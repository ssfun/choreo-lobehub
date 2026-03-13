# LobeHub Dockerfile for Choreo

# Version

v2.1.40

# Releases

## 📦 Release v2.1.40

This release was automatically published from PR #12939.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/12939

### Commit Message
This release includes a **database schema migration** adding **1 new column** to the `topics` table.

### Migration: Add description column to topics table

- Added `description` (text, nullable) column to the `topics` table
- Uses idempotent `ADD COLUMN IF NOT EXISTS` syntax

### Notes for Self-hosted Users

- The migration runs automatically on application startup
- No manual intervention required

The migration owner: @tjx666 — responsible for this database schema change, reach out for any migration-related issues.
