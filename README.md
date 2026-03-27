# LobeHub Dockerfile for Choreo

# Version

v2.1.46

# Releases

## 📦 Release v2.1.46

This release was automatically published from PR #13295.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/13295

### Commit Message
This release includes a **database schema migration** involving **2 new tables** for the Notification system.

### Migration: Add Notification Tables

- Added 2 new tables: `notifications`, `notification_deliveries`
- Added `notification` jsonb column to `user_settings`

### Notes for Self-hosted Users

- The migration runs automatically on application startup
- No manual intervention required

The migration owner: @tjx666 — responsible for this database schema change, reach out for any migration-related issues.
