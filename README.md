# LobeHub Dockerfile for Choreo

# Version

v2.1.54

# Releases

## 📦 Release v2.1.54

This release was automatically published from PR #14231.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/14231

### Commit Message
**Hotfix Scope:** Agent topic / thread navigation regression — stale chat state on agent switch

> Clears residual topic state when navigating between agents, restores the active subtopic's title in the header, and keeps the sidebar's thread list expanded while a thread is open.

## 🐛 What's Fixed

- **Stale topic on agent switch** — `ChatHydration` syncs `activeTopicId` / `activeThreadId` from the URL via `useLayoutEffect` and writes `null` (not `undefined`) so `/agent/agt_A/tpc_X` → `/agent/agt_B` no longer carries over the previous topic; *Start new topic* responds again.
- **Conversation context isolation** — `ConversationProvider` keys its inner store on `contextKey`, so consumers don't read stale values for one render after agent / topic / thread identity changes.
- **Sidebar thread list visibility** — `<ThreadList />` visibility is now driven by `urlTopicId` and accepts `topicId` as a prop, so the parent topic's thread list stays expanded while viewing a subtopic.
- **Header thread title** — Header `Tags` reads the active thread's title from `s.threadMaps[s.activeTopicId]` when `activeThreadId` is set, falling back to `chat:thread.title` for unnamed threads.
