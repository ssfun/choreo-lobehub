# LobeHub Dockerfile for Choreo

# Version

v2.1.34

# Releases

## 📦 Release v2.1.34

This release was automatically published from PR #12532.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/12532

Scope agent evaluation benchmarks and new bot provider bindings by user while introducing infrastructure for external chat platform integrations.

New Features:
- Add agent bot provider database schema and model to store per-agent external platform bindings with encrypted credentials.
- Introduce agent agency configuration types and persist agencyConfig on agents for Discord and Slack bot settings.

Bug Fixes:
- Associate agent evaluation benchmarks with a userId and restrict create, query, update, delete, and lookup operations to the owning user while still allowing access to system benchmarks.

Enhancements:
- Export new agentBotProvider schema and agency configuration types through existing database and type index barrels.

Tests:
- Extend agent evaluation benchmark model tests to cover user-scoped behavior, including isolation between different users and handling of system benchmarks.
