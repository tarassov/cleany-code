# Report format

Default to a short report (roughly one screen of prose plus diagrams; expand only when needed).

## Readability (0–100)

Report an approximate score, rounded to the nearest five, with one or two sentences of evidence from the Middle Developer Test. State the reviewed scope and limitations. Score how readily a developer can follow intent, control flow, dependencies and effects within that scope. Judge how clearly the code expresses the complexity its task requires.

For a branch review, state the reviewed branch, base ref, merge-base commit, and whether uncommitted changes were included. If the comparison is empty and no requested local changes apply, report the empty comparison without a score or verdict. If the comparison cannot be established, explain what is missing and use INSUFFICIENT CONTEXT if issuing a report.

| Anchor | What it looks like |
|---|---|
| 0 | Machine-like or effectively opaque code whose intent can only be reconstructed by tracing execution |
| 25 | Individual operations are recognizable, but intent, control flow and effects take substantial reconstruction |
| 50 | The main purpose is apparent after a close read, with significant context needed to follow the behavior |
| 75 | The main flow is clear on first reading, with a few boundaries or effects that need investigation |
| 100 | An idealized example like Hello World or an exceptionally clear teaching example of a pattern, with immediately visible intent, flow and effects |

Reserve the endpoints for those reference cases. Use 5 or 95 if rounding would otherwise assign an endpoint. If there is too little evidence to assign a score, say what context is missing.

## Current architecture
One Mermaid flowchart or ASCII diagram. Show meaningful components, responsibilities and actual dependencies. Label arrows if their semantics are ambiguous; do not mix call order and dependency direction without explanation.

If context is incomplete, show only the confirmed part and state what the diagram leaves unresolved. If the available evidence cannot establish meaningful components or relationships, omit the diagram and say what information is missing.

## Proposed architecture
Same scope and abstraction level; show the smallest useful redesign. Mark proposed nodes as proposed in the caption. Omit on a final verdict of PASS if no meaningful change is justified. If evidence is insufficient, label the alternative conditional or omit it.

Keep top-level diagrams small (typically 3–7 nodes, not a hard cap). Add a pair of zoomed-in views only where necessary to expose a problem or demonstrate a natural boundary. Mermaid is source text; use ASCII when rendering is unavailable. Do not require diagram tools.

## Findings and recommendations
Up to five material findings by default, ordered by impact; group related issues. For each: location (path:line if known), problem, concrete consequence, minimal recommended change. Explain any chosen pattern and trade-off. No invented references.

For a finding about an established practice, name the practice, link the guidance consulted, and explain how the affected code differs and why that matters here. If the existing approach works and the benefit is incremental, present the alternative as optional. Combine it with any overlapping simplification in one finding.

For a confirmed antipattern, name it in the finding, point to the code that demonstrates its defining symptoms, and explain the project-specific cost and smallest useful correction. Merge it with any finding that shares the same root cause.

If the current solution works and a simpler idiom fits, include an optional suggestion. Identify the location, show the replacement in a short code example, and explain the benefit for this project and any relevant trade-off. A local simplification can accompany PASS without a second diagram. Include it in a material finding instead when it addresses the same problem.

## Verdict
Base the verdict on the impact of the findings, independently of the readability score.

- **PASS** — No material issue found in the reviewed scope. Optional improvements may still apply.
- **NEEDS IMPROVEMENT** — A material issue warrants a targeted change.
- **REWORK RECOMMENDED** — Material issues require changing core responsibilities or dependencies.
- **INSUFFICIENT CONTEXT** — Missing evidence prevents a reliable verdict.

Summarize the trade-off of any proposed change in one or two sentences.
