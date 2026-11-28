# Pattern selection

Use patterns as vocabulary for solving observed problems, never as a mandatory checklist. First consider plain functions, modules and direct composition.

| Observed problem | Candidate | Avoid when |
|---|---|---|
| Independent behavior variants tangled in branches | Strategy | A small stable conditional is clearer |
| Complex construction or selection of implementations | Factory / Builder | Direct construction is sufficient |
| External contract leaks into domain | Adapter | No meaningful translation or boundary exists |
| State-dependent behavior spread across code | State | Simple explicit state transitions suffice |
| Two independent dimensions of variation | Bridge | Only one meaningful axis exists |
| Peer components coordinate excessively | Mediator | It would become a god object |
| Consumer depends on replaceable infrastructure | Dependency inversion / injection | A stable simple utility needs no seam |
| Complex subsystem exposes internals | Facade | It would merely duplicate an already clear API |
| Several interchangeable handlers process a request | Chain of Responsibility | Explicit sequence is more understandable |
| Independent reactions to events | Observer | Hidden control flow is worse than explicit calls |
| Behavior layers around a stable contract | Decorator | A straightforward function composition suffices |

For each recommendation explain the concrete issue, why the pattern reduces cognitive cost, and the cost of the new indirection. Never invent a second implementation simply to demonstrate a pattern.

## Antipatterns

Use these examples to guide investigation. Trace the affected behavior before recommending a fix.

| Antipattern | Evidence to look for | Common false positive |
|---|---|---|
| Spaghetti code | Trace one representative operation from entry to outcome. Look for control jumping between modules, implicit ordering, or shared mutable state that hides which step runs next or which code changes the result. Identify the specific path or state dependency that makes a change hard to reason about. | A complex workflow with explicit transitions, predictable execution order, and clear state ownership |
| God object | One object owns unrelated decisions or state, forcing independent responsibilities to change together | A large orchestrator that delegates decisions to their owners |
| Shotgun surgery | A single rule change requires coordinated edits in multiple places because each encodes part of the same decision | A deliberate contract change that naturally updates callers and tests |
| Leaky abstraction | Callers depend on an abstraction's implementation details, such as translating provider-specific errors themselves | A thin wrapper whose public contract intentionally exposes the underlying API |
| Speculative generality | An extension point serves no current requirement and makes callers supply configuration or follow an extra layer | A single implementation behind a boundary needed for a current integration or contract |
