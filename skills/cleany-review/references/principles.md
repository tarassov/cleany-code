# Review principles

## Readability
- Middle Developer Test: purpose, main flow, boundaries and effects should be apparent without simulating code. Complex algorithms may require study; their intent and contract should not.
- Express intent through precise names and domain concepts. Names should predict behavior; avoid hidden effects, flags encoding unrelated scenarios and ambiguous state.
- Self-documenting code: comments explaining what code does are a signal to inspect expressiveness, not automatic violations. Preserve comments explaining why, constraints, invariants, trade-offs or genuinely difficult algorithms.
- Keep related logic together. Extract meaningful concepts, not every expression. Excessive fragmentation and navigation cost are defects too.
- Maintain a consistent abstraction level within a flow; avoid mixing business decisions with transport, serialization or low-level mechanics.

## Architecture
- Single responsibility: a unit has one coherent purpose and related reasons to change, not necessarily one operation. Avoid both god objects and needless atomization.
- Separate orchestration from execution: an orchestrator owns scenario context, ordering and coordination; collaborators own their task and contract and should not depend on irrelevant caller context. Domain objects can know their own domain rules; nested orchestration is legitimate. Not every component must be classified as one of two rigid roles.
- Make dependencies and effects explicit. Prefer composition and narrow contracts at meaningful boundaries. Avoid leaky abstractions, inappropriate cross-layer dependencies and duplicated business knowledge.
- Consistency: similar problems should use similar solutions unless differences justify divergence.

## Evolvability
- Natural extension points: identify where behavior can be customized or extended without restructuring unrelated code. These can be functions, modules, objects, existing framework hooks or contracts. Do not implement imagined variants or configuration systems.
- Substitutability: a meaningful collaborator should be replaceable without editing consumers when the replacement satisfies its behavioral contract, including effects, errors and invariants. An explicit interface is useful where justified, but structural typing or a function contract may suffice. Avoid interfaces that merely mirror every concrete class.
- Change locality: a small requirement change should normally remain local to the relevant responsibility. Check realistic examples; broad cross-cutting changes may legitimately touch many modules.
- Minimal abstraction: each boundary must pay for itself through clearer intent, isolation, reuse or a demonstrated change axis. Do not introduce optimization, caching, factories, plugin registries or configuration merely in anticipation.

## Hierarchical clarity
- A good architecture naturally fits a hierarchy of diagrams: system, subsystem, component, implementation. Use only levels that make sense for the scope.
- Top level shows the minimum meaningful concepts and real relationships. Peer nodes share an abstraction level; expand each significant block independently when useful.
- A block's internal details should not be required to understand its external role. Expansion should refine, not contradict, the upper view.
- Cycles, cross-boundary access, tangled dependencies and inability to group cohesive responsibilities are investigation signals, not automatic defects. A diagram is evidence, not proof; do not force a tree onto a legitimate graph.
- Compare actual and proposed designs at equal abstraction and scope. A more complicated proposed diagram needs a concrete justification.
