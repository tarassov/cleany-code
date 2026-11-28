# Cleany Code

A collection of agent skills for Codex, Claude Code, and Google Antigravity. See the [release notes](CHANGELOG.md) for recent changes.

| Skill | Purpose |
| --- | --- |
| [cleany-review](skills/cleany-review/SKILL.md) | Reviews existing and AI-generated code for readability, architectural clarity, and ease of change. Reviews are read-only by default. |

## Install the plugin

The plugin installs all bundled skills in Codex and Claude Code. Use the same commands on Windows, macOS, and Linux. For Google Antigravity, follow the [standalone installation](#install-standalone-skills).

### Codex

```sh
codex plugin marketplace add tarassov/cleany-code
codex plugin add cleany-code@cleany-code
```

Start a new Codex session to use the skill.

### Claude Code

Run each command separately in Claude Code.

```text
/plugin marketplace add tarassov/cleany-code
/plugin install cleany-code@cleany-code
```

Run `/reload-plugins` or start a new session to load the plugin.

### Update the plugin

For Codex, refresh the marketplace and install the latest plugin version.

```sh
codex plugin marketplace upgrade cleany-code
codex plugin add cleany-code@cleany-code
```

Start a new Codex session after updating.

For Claude Code, refresh the marketplace and update the plugin.

```sh
claude plugin marketplace update cleany-code
claude plugin update cleany-code@cleany-code
```

Restart Claude Code after updating.

## Install standalone skills

Clone the repository once.

```text
git clone https://github.com/tarassov/cleany-code.git
```

The installers copy all bundled skills by default. Select one by passing its name as the third Bash argument or with `-Skill` in PowerShell. Repeat the install after pulling updates to refresh the bundled files.

### macOS, Linux, and WSL

Run these commands from the checkout for a personal install. Choose the command for your client.

```bash
cd cleany-code
bash scripts/install.sh codex
bash scripts/install.sh claude
bash scripts/install.sh antigravity
```

For a project install, run the script from the target project's root and pass `project`.

```bash
bash /path/to/cleany-code/scripts/install.sh antigravity project cleany-review
```

### Windows PowerShell

Run these commands from the checkout for a personal install. Choose the command for your client.

```powershell
Set-Location cleany-code
.\scripts\install.ps1 -Client codex
.\scripts\install.ps1 -Client claude
.\scripts\install.ps1 -Client antigravity
```

For a project install, run the script from the target project's root and pass `-Scope project`.

```powershell
& 'C:\path\to\cleany-code\scripts\install.ps1' -Client antigravity -Scope project -Skill cleany-review
```

### Manual installation

Copy the entire `skills/cleany-review` folder, including its references and examples, into the appropriate directory.

| Client | Personal | Project |
| --- | --- | --- |
| Codex | `~/.agents/skills/` | `.agents/skills/` |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Google Antigravity | `~/.gemini/config/skills/` | `.agents/skills/` |

See the docs for supported locations. [Codex](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills) · [Claude Code](https://code.claude.com/docs/en/skills) · [Google Antigravity](https://antigravity.google/docs/skills)

If you previously installed `architecture-review`, remove its old folder from your skills directory to avoid loading both versions.

## Usage

In Codex, ask “Use $cleany-review to review the checkout module. Keep the review read-only.” In Claude Code, use `/cleany-code:cleany-review` after plugin installation or `/cleany-review` after standalone installation. Pass the diff, module, or subsystem to review.

In Antigravity, use `/cleany-review` in the App or CLI, or ask the agent to use `cleany-review` in your prompt. Run `/skills reload` if the CLI was open during installation.

The report starts with a readability score from 0 to 100 based on the Middle Developer Test, then gives evidence-backed findings and a separate verdict. It compares current and proposed architecture with diagrams when a redesign is warranted.
