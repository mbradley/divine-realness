-- ABOUTME: Initial schema for Realness AI video detection
-- ABOUTME: Creates jobs table with provider results stored as JSON

CREATE TABLE IF NOT EXISTS jobs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id TEXT UNIQUE NOT NULL,
    media_hash TEXT,
    video_url TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending',
    submitted_at TEXT NOT NULL,
    completed_at TEXT,
    error TEXT,
    webhook_url TEXT,
    webhook_called INTEGER DEFAULT 0,
    results TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_jobs_event_id ON jobs(event_id);
CREATE INDEX IF NOT EXISTS idx_jobs_status ON jobs(status);
CREATE INDEX IF NOT EXISTS idx_jobs_submitted_at ON jobs(submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_jobs_media_hash ON jobs(media_hash);
