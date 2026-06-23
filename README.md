# LobeHub Dockerfile for Choreo

# Version

v2.2.8

# Releases

## 📦 Release v2.2.8

This release was automatically published from PR #16183.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/16183

### Commit Message
# 🚀 LobeHub Release (20260622)

**Hotfix Scope:** Task template recommendation regression — legacy cached or server rows crash the home screen

> Drops stale or malformed task-template recommendations before the Daily Brief UI renders them, restoring the home screen for version-skewed clients.

## 🐛 What's Fixed

- **Home crash from legacy task templates** — Legacy or malformed task-template recommendation rows are now filtered before connector-aware rendering and cache mutation, so stale SWR data or older server payloads no longer crash the Daily Brief section. (#16170)

## ⚙️ Upgrade

- Self-hosted: pull the new image and restart. No schema or env changes.
- Cloud: applied automatically.

## 👥 Owner

@tjx666
