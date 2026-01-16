import type { APIRoute } from 'astro';

type Env = {
  DB?: D1Database;
  KV?: KVNamespace;
};

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8' },
  });
}

function getEnv(locals: unknown): Env | undefined {
  return (locals as any)?.runtime?.env as Env | undefined;
}

export const GET: APIRoute = async ({ locals, url }) => {
  const env = getEnv(locals);

  if (!env?.DB) {
    return json(
      {
        ok: false,
        message: 'Wins not configured yet (DB binding missing).',
        hint: 'Bind D1 as DB in wrangler.jsonc to enable this endpoint.',
      },
      501
    );
  }

  const limitRaw = url.searchParams.get('limit') ?? '20';
  const limit = Math.min(Math.max(parseInt(limitRaw, 10) || 20, 1), 50);

  const cacheKey = `wins:latest:${limit}`;

  if (env.KV) {
    const cached = await env.KV.get(cacheKey, 'json');
    if (cached) return json(cached);
  }

  const { results } = await env.DB
    .prepare('SELECT * FROM wins ORDER BY datetime(created_at) DESC LIMIT ?')
    .bind(limit)
    .all();

  if (env.KV) {
    await env.KV.put(cacheKey, JSON.stringify(results), { expirationTtl: 60 });
  }

  return json(results);
};

export const POST: APIRoute = async ({ locals, request }) => {
  const env = getEnv(locals);

  if (!env?.DB) {
    return json(
      {
        ok: false,
        message: 'Wins submission not configured yet (DB binding missing).',
        hint: 'Bind D1 as DB in wrangler.jsonc to enable this endpoint.',
      },
      501
    );
  }

  let body: any;
  try {
    body = await request.json();
  } catch {
    return json({ error: 'Invalid JSON' }, 400);
  }

  const required = ['handle', 'repo_url', 'summary', 'broke_fix', 'validation', 'resume_bullets'];
  for (const k of required) {
    if (!body?.[k] || typeof body[k] !== 'string') {
      return json({ error: `Missing/invalid field: ${k}` }, 400);
    }
  }

  const id = crypto.randomUUID();
  const demoUrl = typeof body.demo_url === 'string' ? body.demo_url.trim() : null;

  await env.DB.prepare(
    `INSERT INTO wins (
      id, handle, repo_url, demo_url, summary, broke_fix, validation, resume_bullets, points, featured
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
  )
    .bind(
      id,
      body.handle.trim(),
      body.repo_url.trim(),
      demoUrl,
      body.summary.trim(),
      body.broke_fix.trim(),
      body.validation.trim(),
      body.resume_bullets.trim(),
      10,
      0
    )
    .run();

  if (env.KV) {
    await env.KV.delete('leaderboard:30d');
    for (const n of [10, 20, 50]) await env.KV.delete(`wins:latest:${n}`);
  }

  return json({ ok: true, id }, 201);
};
