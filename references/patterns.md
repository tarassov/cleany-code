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
