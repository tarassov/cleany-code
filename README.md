# Cleany Code

A collection of agent skills for Codex and Claude Code.

| Skill | Purpose |
| --- | --- |
| [cleany-review](skills/cleany-review/SKILL.md) | Reviews existing and AI-generated code for readability, architectural clarity, and ease of change. Reviews are read-only by default. |

## Install

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
```

For a project install, run the script from the target project's root and pass `project`.

```bash
bash /path/to/cleany-code/scripts/install.sh codex project cleany-review
```

### Windows PowerShell

Run these commands from the checkout for a personal install. Choose the command for your client.

```powershell
Set-Location cleany-code
.\scripts\install.ps1 -Client codex
.\scripts\install.ps1 -Client claude
```

For a project install, run the script from the target project's root and pass `-Scope project`.

```powershell
& 'C:\path\to\cleany-code\scripts\install.ps1' -Client claude -Scope project -Skill cleany-review
```

### Manual installation

Copy the entire `skills/cleany-review` folder, including its references and examples, into the appropriate directory.

| Client | Personal | Project |
| --- | --- | --- |
| Codex | `~/.agents/skills/` | `.agents/skills/` |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |

See the [Codex skills documentation](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills) and [Claude Code skills documentation](https://code.claude.com/docs/en/skills) for supported locations. If you previously installed `architecture-review`, remove its old folder from your skills directory to avoid loading both versions.

## Usage

In Codex, ask “Use $cleany-review to review the checkout module. Keep the review read-only.” In Claude Code, run `/cleany-review` with the diff, module, or subsystem to review.

The report starts with the Middle Developer Test and provides evidence-backed findings. It compares current and proposed architecture with diagrams when a redesign is warranted.
