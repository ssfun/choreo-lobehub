# LobeHub Dockerfile for Choreo

# Version

v2.1.36

# Releases

## 📦 Release v2.1.36

This release was automatically published from PR #12714.

### Changes
See PR description: https://github.com/lobehub/lobehub/pull/12714

### Commit Message
#### 💻 Change Type

<!-- For change type, change [ ] to [x]. -->

- [ ] ✨ feat
- [x] 🐛 fix
- [ ] ♻️ refactor
- [ ] 💄 style
- [ ] 👷 build
- [ ] ⚡️ perf
- [ ] ✅ test
- [ ] 📝 docs
- [ ] 🔨 chore

#### 🔗 Related Issue

<!-- Link to the issue that is fixed by this PR -->

<!-- Example: Fixes #xxx, Closes #xxx, Related to #xxx -->

#### 🔀 Description of Change

<!-- Thank you for your Pull Request. Please provide a description above. -->

#### 🧪 How to Test

<!-- Please describe how you tested your changes -->

<!-- For AI features, please include test prompts or scenarios -->

- [ ] Tested locally
- [ ] Added/updated tests
- [ ] No tests needed

#### 📸 Screenshots / Videos

<!-- If this PR includes UI changes, please provide screenshots or videos -->

| Before | After |
| ------ | ----- |
| ...    | ...   |

#### 📝 Additional Information

<!-- Add any other context about the Pull Request here. -->

<!-- Breaking changes? Migration guide? Performance impact? -->

## Summary by Sourcery

Ensure marketplace-related API calls include the required MP token when querying assistants, MCP lists, and skills, and bump the package version.

Bug Fixes:
- Inject the MP token before fetching the assistant list from the market API.
- Inject the MP token before fetching the MCP list from the market API.
- Inject the MP token before performing skill search requests via the market API.

Build:
- Bump package version from 2.1.34 to 2.1.35.
