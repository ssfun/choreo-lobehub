# LobeHub Dockerfile for Choreo

# Version

v2.1.30

# Releases

## 📦 Release v2.1.30

This release was automatically published from PR #12321.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/12321

### Commit Message
## 🩹 Hotfix v2.1.30

This PR starts a hotfix release from `main`.

### Release Process
1. ✅ Hotfix branch created from main
2. ✅ Pushed to remote
3. 🔄 Waiting for PR review and merge
4. ⏳ Auto tag + GitHub Release will be created after merge

---
Created by hotfix script

## Summary by Sourcery

Adjust release automation, linting configuration, and user panel UI behavior for hotfix v2.1.30.

Enhancements:
- Update UserPanel popover styling and behavior, including a skeleton loading state and adjusted placement and triggers.
- Refine PanelContent component typing and navigation event handling in the sidebar header layout.
- Extend lint-staged configuration to integrate eslint suppression pruning and ensure suppression files are committed for multiple file types.

CI:
- Simplify GitHub release creation to run for all tag types in the auto-tag workflow.
- Harden the desktop stable release workflow to safely handle missing release body content.
