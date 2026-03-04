# LobeHub Dockerfile for Choreo

# Version

v2.1.35

# Releases

## 📦 Release v2.1.35

This release was automatically published from PR #12631.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/12631

### Commit Message
This release includes **90 commits**. Key updates are below.

### ✨ New Features and Enhancements

- 🤖 Added **Discord IM bot integration** for receiving and responding to messages within Discord channels. ([#12517](https://github.com/lobehub/lobehub/pull/12517))
- 🧩 Introduced **Agent Skills** support with progressive disclosure via `lobe-tools`, allowing agents to expose task-specific capabilities. ([#12424](https://github.com/lobehub/lobehub/pull/12424), [#12489](https://github.com/lobehub/lobehub/pull/12489))
- 🧠 Added **Memory Settings** for configuring memory effort and tool permissions. ([#12514](https://github.com/lobehub/lobehub/pull/12514))
- 📧 Support for **changing email address** in profile settings. ([#12549](https://github.com/lobehub/lobehub/pull/12549))
- 🛡️ Added **unsaved changes guard** to prevent data loss on navigation. ([#12332](https://github.com/lobehub/lobehub/pull/12332))
- 🖱️ Support **Cmd+Click to open sidebar nav in new tab**. ([#12574](https://github.com/lobehub/lobehub/pull/12574))
- 🧮 Added **calculator builtin tool** for agents. ([#11715](https://github.com/lobehub/lobehub/pull/11715))
- 🎬 Added **video tab** to provider ModelList settings page with image dimension/aspect ratio constraints for uploads. ([#12534](https://github.com/lobehub/lobehub/pull/12534), [#12607](https://github.com/lobehub/lobehub/pull/12607))
- 🎯 Center active model on open in **model switch panel**. ([#12215](https://github.com/lobehub/lobehub/pull/12215))
- 🕹️ Support **agent management**. ([#12061](https://github.com/lobehub/lobehub/pull/12061))

### 🤖 Models and Provider Expansion

- 🌟 Added **Kimi K2 thinking models** (Moonshot). ([#12630](https://github.com/lobehub/lobehub/pull/12630))
- 🍌 Added **Nano Banana 2** support. ([#12493](https://github.com/lobehub/lobehub/pull/12493), [#12496](https://github.com/lobehub/lobehub/pull/12496))
- 🎨 Added **Seedream 5 Lite** image generation model. ([#12459](https://github.com/lobehub/lobehub/pull/12459))
- 💨 Added **Qwen3.5 Flash** and Qwen3.5 OSS models. ([#12465](https://github.com/lobehub/lobehub/pull/12465))
- 🔮 Added **GLM-5**, **GLM-4.6V**, and **GLM-Image** for Zhipu. ([#12272](https://github.com/lobehub/lobehub/pull/12272))
- 📦 Batch updated model lists for AI360, Hunyuan, InternLM, Spark, StepFun, Wenxin, and Seedream. ([#12371](https://github.com/lobehub/lobehub/pull/12371))
- 🗑️ Removed deprecated `chatgpt-4o-latest`. ([#12486](https://github.com/lobehub/lobehub/pull/12486))
- ➕ Supplemented models from NewAPI pricing endpoint. ([#10628](https://github.com/lobehub/lobehub/pull/10628))

### 🏗️ Architecture

- ⚡ **Migrated frontend from Next.js App Router to Vite SPA** — a major architectural change improving dev experience and build performance. ([#12404](https://github.com/lobehub/lobehub/pull/12404))
- 📂 Restructured SPA routes to `src/routes` and `src/router`. ([#12542](https://github.com/lobehub/lobehub/pull/12542))
- ♻️ Refactored client agent runtime. ([#12482](https://github.com/lobehub/lobehub/pull/12482))
- 🔥 Removed invite code requirement feature. ([#12474](https://github.com/lobehub/lobehub/pull/12474))

### 🖥️ Desktop Improvements

- 🔧 Fixed better-auth client stub for Electron renderer. ([#12563](https://github.com/lobehub/lobehub/pull/12563))

### Stability, Security, and UX Fixes

- Fixed topic/thread title summarization to respect `responseLanguage` setting. ([#12627](https://github.com/lobehub/lobehub/pull/12627))
- Fixed MCP tool install loading state. ([#12629](https://github.com/lobehub/lobehub/pull/12629))
- Fixed mermaid rendering in notebook documents. ([#12624](https://github.com/lobehub/lobehub/pull/12624))
- Fixed global memory setting and tool enabled logic. ([#12610](https://github.com/lobehub/lobehub/pull/12610))
- Fixed Vertex AI 400 error caused by duplicate tool function declarations. ([#12604](https://github.com/lobehub/lobehub/pull/12604))
- Fixed multiple Vertex AI and Moonshot runtime issues. ([#12595](https://github.com/lobehub/lobehub/pull/12595))
- Fixed SiliconCloud model thinking mode toggle. ([#10011](https://github.com/lobehub/lobehub/pull/10011))
- Fixed DeepSeek-Reasoner `reasoning_content` for tool calls. ([#12564](https://github.com/lobehub/lobehub/pull/12564))
- Fixed Google API key header passing (`x-goog-api-key`). ([#12506](https://github.com/lobehub/lobehub/pull/12506))
- Fixed `@napi-rs/canvas` hoisting for PDF parsing in Docker. ([#12475](https://github.com/lobehub/lobehub/pull/12475))
- Fixed model select panel flickering and improved list implementation. ([#12485](https://github.com/lobehub/lobehub/pull/12485))
- Fixed memory tools to run in server correctly with correct cron schedule. ([#12471](https://github.com/lobehub/lobehub/pull/12471), [#12568](https://github.com/lobehub/lobehub/pull/12568))
- Fixed group agent rename, skill search, and editor focus issues in agent settings. ([#12511](https://github.com/lobehub/lobehub/pull/12511), [#12432](https://github.com/lobehub/lobehub/pull/12432), [#12512](https://github.com/lobehub/lobehub/pull/12512))
- Fixed NewAPI proxy gzip handling. ([#10628](https://github.com/lobehub/lobehub/pull/10628))
- Fixed provider request filtering for disabling browser requests. ([#12002](https://github.com/lobehub/lobehub/pull/12002))
- Fixed `input_image` incorrectly passed when no `image_url` present. ([#12017](https://github.com/lobehub/lobehub/pull/12017))
- Fixed crawler error handling and timeout cancellation. ([#12487](https://github.com/lobehub/lobehub/pull/12487))
- Added username and fullName length validation. ([#12614](https://github.com/lobehub/lobehub/pull/12614))
- Added database migration to Vercel build command. ([#12551](https://github.com/lobehub/lobehub/pull/12551))
- Improved auth db fallback for secondary-storage sessions. ([#12548](https://github.com/lobehub/lobehub/pull/12548))
- Fixed type not preserved when model batch processing. ([#10015](https://github.com/lobehub/lobehub/pull/10015))
- Fixed search issue. ([#12457](https://github.com/lobehub/lobehub/pull/12457))

### 🙏 Credits

Huge thanks to these contributors (alphabetical):

@Innei @arvinxx @canisminor1990 @cy948 @eaten-cake @eronez @hezhijie0327 @mikelambert @nekomeowww @rdmclin2 @sxjeru @tjx666

