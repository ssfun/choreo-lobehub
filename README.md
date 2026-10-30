# LobeHub Dockerfile for Choreo

# Version

v2.2.21

# Releases

## 📦 Release v2.2.21

This release was automatically published from PR #21872.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/21872

### Commit Message
# 🚀 LobeHub Release (20261029)

**Release Date:** October 29, 2026  
**Since v2.2.20:** 616 merged PRs · 16 contributors

> Projects become the place where work happens — conversations, channels, tasks and acceptance live inside them — while bots learn when to speak up, goals gain a full review loop, and Resources become Docs.

---

## ✨ Highlights

- **Projects as workspaces** — Run conversations and tasks inside a project, with a project home composer, members and libraries settings, a swappable main agent, topics grouped by agent and filtered by status and device, drag-to-reorder projects, and channels grouped inside projects. (#21370, #21345, #21344, #21483, #21382, #21398, #21490, #21752)
- **Multi-agent channels** — Agents collaborate in channels, each channel inherits its Agent's device and directory, and the redesigned channel settings keep reply style and emoji per channel. (#21545, #21782, #21658, #21757)
- **Bot wake** — Bots decide when to reply based on their duties, can acknowledge first and answer in a thread, wake on edits that @-mention them, stay out of multi-party threads, and the choice not to reply renders as its own state. Available on Discord, Slack and Feishu / Lark. (#21585, #21726, #21719, #21756, #21728, #21727, #21825)
- **Goals workspace** — A cross-agent goals page, decision option trees, a delivery report to review before sign-off, copying goals between personal and workspace scopes, and north-star metric charts. (#21221, #21560, #21773, #21665, #21126)
- **Docs and Favorites** — Resources are restructured into Docs with sidebar view options and artifact rendering; pin any page to a sidebar Favorites section. (#21373, #21548, #21572)
- **Canvas** — Multi-file HTML artifacts rendered with lobe-\* elements, code highlighting, an explicit share button, and unified Canvas/HTML CLI publishing. (#21326, #21506, #21589, #21671)
- **Editor 7.0** — Alerts, charts and footnotes in documents and the slash menu, plus a Notion-style page table of contents. (#21799, #21826, #21321)
- **Linear integration** — Connect Linear via OAuth and sync Linear issues into project tasks. (#21036, #21723)

---

## 🏗️ Core Agent & Architecture

- Sub-agents run in the background and deliver their results as messages. (#20862)
- Decision models via OpenRouter and OpenAI's native Decisions API, configurable per channel and in the redesigned Service Model settings, along with the verifier model. (#20836, #21359, #21788, #21480, #21774)
- New providers and models: Magpie, TypeSafe, MiniMax M3.1 Flash, and any fal endpoint with its image/video model list. (#21644, #21444, #21216, #21238)
- Context compaction is offered for oversized requests, and history is kept when the compaction summary fails. (#21504, #21590)
- Stdio MCP sessions stay alive across tool calls and show actionable startup errors; MCP negotiates modern HTTP protocol versions. (#21031, #21110, #21743)
- Filtered message search, goal search and `lh recall`. (#21188)
- Large server routers, services and database models split into focused modules, and many client stores moved onto `@lobechat/replica` for faster stale-first paints. (#21085, #21132, #21145, #21200, #21118)

## 📱 Platforms / Integrations

- **OpenAPI:** chat groups at `/api/v1/chat-groups`, run a task now and read its runs at `/api/v1/tasks/{id}/runs`, and notification settings endpoints. (#21280, #21470, #21538)
- **IM:** uploaded message attachments, chat images visible to the model in message reads, and Discord replies that actually @-mention people. (#21581, #21758, #21736)
- **External agents:** file/image upload in the `+` menu, Claude Code sees claude.ai connectors, and device-bound runs resume on retry instead of wiping the turn. (#21794, #21294, #21494)
- **Desktop:** OS notification when a workspace member mentions you, and hovered link URLs in the status bar. (#21436, #21291)
- **Mobile:** desktop surfaces come to the mobile web. (#21503)
- **CLI:** `lh gen json`, `lh gen decide`, `lh read <url>`, `lh notification`, workspace slugs for `--workspace`, a reconnectable WebSocket in place of SSE, and the browser tool on `lh connect` devices. (#21413, #21835, #21514, #21539, #21540, #20501, #21422)
- **SDK:** OAuth helpers for native apps and an accessToken provider. (#21435)

## 🖥️ User Experience

- Acceptance gains workspace scope, project binding, terminal evidence and feedback hand-off to the original agent. (#21432, #21392, #21734, #21619)
- Memory replaces the contexts page with entity pages built on real memory data. (#21347)
- Find in topic with Mod+F, hover prefetch of topic pages, and a workspace recycle bin. (#21530, #21724, #21537)
- Generated avatars for agents, people and workspaces without one, and an agent list badge wall. (#21778, #21632, #21786, #21815)
- Connectors open as list → detail pages, with a workspace setting for who manages them. (#21684, #21653)
- Clearer Chinese UI copy with mistranslations corrected. (#21505)

## 🔒 Security & Reliability

- **Security:** JWKS key rotation for auth. (#21431)
- **Security:** memory webhooks require authentication configuration, and provider endpoint credentials are isolated. (#21254, #21255)
- **Security:** `@modelcontextprotocol/sdk` updated for a security advisory, marketplace OAuth MCP installations are authorized, and MCP logs redact sensitive metadata. (#21351, #21367, #21423)
- **Security:** the secure credential form can no longer be approved from notification surfaces. (#20580)
- **Reliability:** web sessions stay alive with deferred session refresh. (#21707)
- **Reliability:** SSRF-safe fetch streams response bodies instead of buffering them. (#21701)
- **Self-hosting:** this release ships several database migrations (favorites, Linear sync, channel lifecycle, project sites and member roles); they run automatically on startup. (#21792, #21722, #21691, #21290)

---

## 👥 Contributors

Huge thanks to **16 contributors** who shipped **616 merged PRs** this cycle.

@SaladDay · @fzlzjerry · @hardy-one · @Coooolfan · @arvinxx · @AmAzing129 · @Innei · @rdmclin2 · @ONLY-yours · @tjx666 · @ImSingee · @nekomeowww · @sudongyuer · @MarioJames · @cy948 · @canisminor1990

Plus @lobehub-coder and renovate[bot] for maintenance.

---

**Full Changelog**: v2.2.20...release/weekly-20261029
