CREATE TABLE IF NOT EXISTS wins (
  id TEXT PRIMARY KEY,
  handle TEXT NOT NULL,
  repo_url TEXT NOT NULL,
  demo_url TEXT,
  summary TEXT NOT NULL,
  broke_fix TEXT NOT NULL,
  validation TEXT NOT NULL,
  resume_bullets TEXT NOT NULL,
  points INTEGER DEFAULT 0,
  featured INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_wins_created_at ON wins(created_at);
CREATE INDEX IF NOT EXISTS idx_wins_points ON wins(points);
