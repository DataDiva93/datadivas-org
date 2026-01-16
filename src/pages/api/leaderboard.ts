import type { APIRoute } from 'astro';

type Env = {
  DB?: D1Database;
  KV?: KVNamespace;
};

function json(data: any, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8' },
  });
}

export const GET: APIRoute = async (context) => {
  const { locals, url } = context;
  // Try all possible ways to access Cloudflare bindings
  const env = ((context as any).env ||
                (context as any).platform?.env ||
                (locals as any)?.runtime?.env ||
                (context as any).locals?.runtime?.env) as Env | undefined;

  // If bindings are not present (common during build/prerender), return a safe response.
  if (!env?.DB) {
    return json(
      {
        ok: false,
        message: 'Leaderboard not configured yet (DB binding missing).',
        hint: 'Bind D1 as DB in wrangler.jsonc to enable this endpoint.',
      },
      501
    );
  }

  const window = (url.searchParams.get('window') ?? '30d').toLowerCase();
  const cacheKey = `leaderboard:${window}`;

  // KV is optional; use it if available.
  if (env.KV) {
    const cached = await env.KV.get(cacheKey, 'json');
    if (cached) return json(cached);
  }

  const where =
    window === 'all'
      ? ''
      : "WHERE datetime(created_at) >= datetime('now', '-30 days')";

  const query = `
    SELECT handle,
           COUNT(*) as wins,
           SUM(points) as points
    FROM wins
    ${where}
    GROUP BY handle
    ORDER BY points DESC, wins DESC, handle ASC
    LIMIT 25
  `;

  const { results } = await env.DB.prepare(query).all();

  if (env.KV) {
    await env.KV.put(cacheKey, JSON.stringify(results), { expirationTtl: 300 });
  }

  return json(results);
};
