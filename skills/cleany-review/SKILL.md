---
name: cleany-review
description: Review existing or AI-generated code for architectural clarity, human readability, responsibility boundaries, natural extension points and substitutability. Use for architecture reviews, readability reviews, design critiques, or reviewing generated changes before merging. Not a general bug or security review.
---
# Cleany Review

Good code is beautiful code: it makes the underlying problem easier to understand, not merely executable. Beauty means clarity, coherence, economy and natural decomposition, not personal style.

## Workflow

1. Use the scope named by the user, such as a branch, subsystem, module, commit or diff, even when the working diff is empty. For a branch, follow [branch review](#branch-review). With no named scope, review both staged and unstaged changes and their surrounding architecture. If neither contains changes, report that the diff is empty and ask what to review. Read relevant entry points, callers, contracts, implementations, tests and project conventions. State any missing context.
2. Assess readability using the Middle Developer Test. Can a competent mid-level developer familiar with the language and domain understand the purpose, main flow, dependencies and effects at a glance? Use the [readability scale](references/report-format.md#readability-0100) and support the score with code evidence.
3. **Diagram Test:** Map actual components and dependencies at the highest meaningful abstraction level. Try expanding significant blocks independently. Can each level be understood without opening the next? Can the top-level view stay minimal without hiding material coupling? Identify where this fails.
4. Apply [principles](references/principles.md) and consult [patterns](references/patterns.md) when a structural problem warrants it. Identify evidence-backed problems, not checklist violations. Reference file paths and lines where available.
5. Compare relevant design choices with established practices for the project's language, framework, and versions. Use applicable official guides or maintained community guidance to verify recommendations. Distinguish documented guidance from conventions inferred from examples. Check whether the rationale applies to this project and account for local constraints. Report departures with a concrete consequence or an actionable benefit. If guidance varies or cannot be verified, state the uncertainty where it affects the recommendation.
6. Check whether a working solution can be simplified with an existing project helper or an idiom supported by the project's language, framework, or standard library. Verify behavior and version compatibility. Recommend it only when you can show a concrete benefit in this codebase, such as less branching, less duplication, or removal of custom plumbing.
7. Check for known [antipatterns](references/patterns.md#antipatterns) within the reviewed scope. Trace callers, dependencies, or change history as needed to verify the defining symptoms and their effect. Apply the label only when the evidence supports it.
8. After completing the checks, choose the smallest change that addresses the evidence. Propose a redesign only when a structural problem warrants it. Compare cognitive cost, navigation, coupling and change locality before and after. Use realistic changes as thought experiments and check that each new boundary earns its cost.
9. Deliver the concise [report](references/report-format.md). Compare diagrams when a redesign is justified and the evidence supports a comparison. On a final verdict of PASS, include optional advice when supported by evidence. See [examples](examples/review.md).

## Branch review

- For the current branch, review `HEAD`. Use the base branch specified by the user. If none is specified, use the target ref from the target repository of an identifiable open PR for the reviewed branch. If the base is ambiguous or unknown, ask for it. A tracking upstream alone does not establish the base.
- Review `git diff <base>...HEAD` for the current branch, or substitute the named branch for `HEAD`. This compares the merge base with the reviewed tip. Inspect surrounding code at that same tip so local edits cannot affect findings. Include staged or unstaged changes only if requested and identify them separately in the report.
- If the base ref or merge base cannot be resolved, explain what is missing and ask for the ref or history needed to proceed. If the branch diff is empty, report that result for the selected base. Record the reviewed branch, resolved base ref and merge-base commit in the report.

## Guardrails

- Review only; never modify source unless explicitly asked. If asked to implement separately, preserve behavior and contracts unless approved otherwise.
- Prefer existing conventions unless they are the demonstrated source of the problem.
- Do not force OOP, interfaces, design patterns, SOLID checklists, Clean Architecture, or a particular framework.
- Do not optimize, generalize or configure hypothetical future requirements. Make current responsibilities and contracts clear enough that changes have natural insertion points.
- Do not hide real dependencies for a prettier diagram. Distinguish existing facts, inferred behavior and proposed design.
- Do not invent findings, line numbers, dependencies or test results. If context is insufficient, label the assessment provisional.
- Focus on architecture and readability. Mention unrelated correctness/security concerns separately only if discovered and material; do not claim comprehensive coverage.
- Respond in the user's language; preserve actual code identifiers.
