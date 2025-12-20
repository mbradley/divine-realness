-- ABOUTME: Add moderation action tracking columns
-- ABOUTME: Links Realness detection to relay enforcement via action queue

ALTER TABLE jobs ADD COLUMN moderation_action TEXT;
ALTER TABLE jobs ADD COLUMN moderation_status TEXT;
ALTER TABLE jobs ADD COLUMN moderation_request_id TEXT;
ALTER TABLE jobs ADD COLUMN moderation_error TEXT;
ALTER TABLE jobs ADD COLUMN moderation_processed_at TEXT;

CREATE INDEX IF NOT EXISTS idx_jobs_moderation_status ON jobs(moderation_status);
