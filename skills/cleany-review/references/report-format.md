# Report format

Default to a short report (roughly one screen of prose plus diagrams; expand only when needed).

## Middle Developer Test: PASS / PARTIAL / FAIL
One or two sentences with evidence. State reviewed scope and limitations.

## Current architecture
One Mermaid flowchart or ASCII diagram. Show meaningful components, responsibilities and actual dependencies. Label arrows if their semantics are ambiguous; do not mix call order and dependency direction without explanation.

## Proposed architecture
Same scope and abstraction level; show the smallest useful redesign. Mark proposed nodes as proposed in the caption. Omit on PASS if no meaningful change is justified. If evidence is insufficient, label the alternative conditional or omit it.

Keep top-level diagrams small (typically 3–7 nodes, not a hard cap). Add a pair of zoomed-in views only where necessary to expose a problem or demonstrate a natural boundary. Mermaid is source text; use ASCII when rendering is unavailable. Do not require diagram tools.

## Findings and recommendations
Up to five material findings by default, ordered by impact; group related issues. For each: location (path:line if known), problem, concrete consequence, minimal recommended change. Explain any chosen pattern and trade-off. No invented references.

## Verdict
PASS / NEEDS IMPROVEMENT / REWORK RECOMMENDED / INSUFFICIENT CONTEXT. In one or two sentences explain how the proposal changes readability, architecture and evolvability, including any cost. Avoid arbitrary numeric scores. No mandatory refactoring on PASS.
