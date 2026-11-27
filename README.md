# Architecture Review

An agent skill for reviewing human readability, architectural clarity and evolvability of existing and AI-generated code. Read-only by default. No runtime dependencies.

## Install

Copy the entire skill folder (including references and examples) into `.agents/skills/architecture-review` for Codex or `.claude/skills/architecture-review` for Claude Code, inside your project. For personal installation, use the corresponding user-level skills directory supported by your client.

## Usage

Ask the agent to use architecture-review to review the current diff, a specific module or a subsystem. Example: “Use architecture-review to review the checkout module. Do not modify code.”

The report starts with the Middle Developer Test, then compares current and proposed architecture using Mermaid or ASCII diagrams, with concise evidence-backed findings. If the architecture is already clear, the skill does not manufacture a redesign.

## Publish

Create a GitHub repository named `architecture-review` (choose visibility and license yourself), then push this folder as its root. The skill is language- and framework-independent.

## Status

Initial version. Instructions have not yet been benchmarked against real projects in Codex or Claude Code.
