---
name: cleany-review
description: Review existing or AI-generated code for architectural clarity, human readability, responsibility boundaries, natural extension points and substitutability. Use for architecture reviews, readability reviews, design critiques, or reviewing generated changes before merging. Not a general bug or security review.
---
# Cleany Review

Good code is beautiful code: it makes the underlying problem easier to understand, not merely executable. Beauty means clarity, coherence, economy and natural decomposition, not personal style.

## Workflow

1. Establish scope from the request; otherwise inspect the current diff and its surrounding architecture. Read relevant project instructions, entry points, callers, contracts, implementations, tests and existing conventions. Do not infer architecture from filenames alone. State any missing context.
2. **First answer the Middle Developer Test:** Could a competent mid-level developer familiar with the language and domain understand the purpose, main flow, dependencies and effects at first glance, without mentally executing implementation details? Return PASS, PARTIAL or FAIL with a concrete reason. This is a reasoned assessment, not an empirical test.
3. **Diagram Test:** Map actual components and dependencies at the highest meaningful abstraction level. Try expanding significant blocks independently. Can each level be understood without opening the next? Can the top-level view stay minimal without hiding material coupling? Identify where this fails.
4. Apply [principles](references/principles.md) and consult [patterns](references/patterns.md) when a structural problem warrants it. Identify evidence-backed problems, not checklist violations. Reference file paths and lines where available.
5. Propose the smallest coherent redesign. Consider plausible changes (replace a dependency, change a rule, add a behavior, reuse a component) as thought experiments, not implementation requirements. Compare cognitive cost, navigation, coupling and change locality before and after. Reject a proposal that adds indirection without a concrete net benefit.
6. Deliver the concise report in [report format](references/report-format.md). Use two comparable diagrams when a redesign is justified. If no material problem exists, return PASS and the current diagram only. See [examples](examples/review.md).

## Guardrails

- Review only; never modify source unless explicitly asked. If asked to implement separately, preserve behavior and contracts unless approved otherwise.
- Prefer existing conventions unless they are the demonstrated source of the problem.
- Do not force OOP, interfaces, design patterns, SOLID checklists, Clean Architecture, or a particular framework.
- Do not optimize, generalize or configure hypothetical future requirements. Make current responsibilities and contracts clear enough that changes have natural insertion points.
- Do not hide real dependencies for a prettier diagram. Distinguish existing facts, inferred behavior and proposed design.
- Do not invent findings, line numbers, dependencies or test results. If context is insufficient, label the assessment provisional.
- Focus on architecture and readability. Mention unrelated correctness/security concerns separately only if discovered and material; do not claim comprehensive coverage.
- Respond in the user's language; preserve actual code identifiers.
