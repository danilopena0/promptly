# Systems Thinking for Agent-Assisted Development

> A guide for building effective systems of agents and environments.
> Based on the thesis: Modern development is about creating optimal systems
> that produce good code, not about writing code directly.

## The Core Shift

**Old model:** How do I write good code?
**New model:** How do I architect systems that produce good code?

The bottleneck has moved. Code generation is fast. The new constraints are:
- Specification (telling the system what you actually want)
- Verification (confirming the output matches intent)
- Orchestration (coordinating components and sessions)

## The System Components

### Agents
The LLMs that generate code. You don't control their internals, but you control:
- What context they see
- What constraints they operate under
- What feedback loops exist

### Environments
The scaffolding around agents that shapes their output:
- Linters and formatters (automated style enforcement)
- Type checkers (catch errors before runtime)
- Test harnesses (verify behavior)
- Pre-commit hooks (quality gates)
- CI pipelines (integration verification)

These aren't agents—they're constraints that make agent output more reliable.

### Context
What the agent knows when generating:
- Project documentation (CLAUDE.md, ARCHITECTURE.md)
- Relevant code files
- Conversation history
- Your specifications for this task

Context window limits mean you must be deliberate about what persists.

## Error Surfaces in Agent-Assisted Development

| Traditional Dev Errors | Agent-Assisted Dev Errors |
|------------------------|---------------------------|
| Typos | Ambiguous prompts |
| Logic mistakes | Missing context |
| API misuse | Wrong assumptions about "done" |
| | Integration mismatches |
| | "Works but weird" solutions |
| | Scope creep / gold-plating |

Your verification processes should target these new error types.

## The Expert Workflow

### Phase 1: Setup (Before Generation)
- [ ] Define acceptance criteria (what "done" looks like, concretely)
- [ ] Identify scope boundaries (what NOT to build)
- [ ] Load relevant context (docs, related code)
- [ ] State constraints explicitly

### Phase 2: Generation
- [ ] Work in bounded chunks, not entire features
- [ ] One clear objective per generation session
- [ ] Include examples of desired output when helpful
- [ ] Let the agent propose approaches for flexible areas

### Phase 3: Verification
- [ ] Run automated checks (tests, lint, types)
- [ ] Review for "works but weird" problems
- [ ] Acceptance test: Does output match specification?
- [ ] Check integration points with existing code

### Phase 4: Integration
- [ ] Wire components together
- [ ] Test the seams explicitly
- [ ] Verify assumptions match across boundaries

### Phase 5: Consolidation
- [ ] Clean up exploratory code
- [ ] Update documentation (CLAUDE.md, ARCHITECTURE.md)
- [ ] Meaningful commit messages
- [ ] Remove any gold-plating that crept in

## Time Allocation Guide

Based on observed productive ratios:

| Activity | Allocation | Notes |
|----------|------------|-------|
| Creation (prompting, generation) | 40% | The fast part |
| Review (verification, "weird" check) | 30% | Where errors get caught |
| Documentation (context for future) | 20% | Investment in future sessions |
| Organization (cleanup, structure) | 10% | Reduces entropy |

Adjust based on project phase:
- Exploration: Creation 60%, Review 20%, Docs 10%, Org 10%
- Active dev: Creation 40%, Review 30%, Docs 20%, Org 10%
- Refinement: Creation 20%, Review 40%, Docs 20%, Org 20%

## Load-Bearing Principles

These should be non-negotiable constraints in your system:

### Single Responsibility Principle (SRP)
Each module does one thing. Why it matters: reduces context needed per task,
makes generation and verification scoped.

### Don't Repeat Yourself (DRY)
Extract repeated logic. Why it matters: agents may not see all files,
duplication leads to inconsistent changes.

### Explicit Over Implicit
No hidden state or magic. Why it matters: agents can't read your mind
about unstated assumptions.

### Fail Fast
Validate early, error loudly. Why it matters: catches agent mistakes
before they propagate through the system.

### Separation of Concerns
Each module handles one domain. Why it matters: you can generate and
test components in isolation.

### Principle of Least Surprise
Code behaves as readers expect. Why it matters: counters the "works but
weird" tendency of generated code.

### Command-Query Separation
Functions do things OR return things, not both. Why it matters:
reduces side-effect surprises in generated code.

## Handling Context Window Limits

The agent forgets. Plan for it.

### Strategies
1. **Persistent documentation**: CLAUDE.md, ARCHITECTURE.md survive sessions
2. **Module-level READMEs**: Context per component
3. **Explicit file loading**: Use @ mentions or explicit requests
4. **Bounded sessions**: Don't try to do everything in one conversation
5. **Recovery protocol**: When agent seems lost, re-establish context

### What Gets Dropped
When context fills, typically:
- Older files drop before recent ones
- Unreferenced code drops before referenced
- Your docs survive if explicitly loaded

## Acceptance Testing Your Prompts

Not "is the LLM good" (provider's job) but "do my instructions produce
what I want in my context."

### Simple Version
After generation, explicitly ask:
- Did I get what I asked for?
- Are there implicit requirements I didn't state that aren't met?
- Would I need to significantly edit this?

### Structured Version
For repeated task types, define:
- Canonical task example
- Expected output characteristics
- Pass/fail criteria

Test periodically: does your current CLAUDE.md + typical prompt
produce acceptable output?

## Knowing When to Stop

Agents will keep going. They'll add features, refactor unnecessarily,
gold-plate solutions. Build stopping into your system:

- [ ] Acceptance criteria defined upfront
- [ ] Explicit scope boundaries
- [ ] Review against criteria, not vibes
- [ ] "Is this done?" as a deliberate checkpoint

**Done means:** Feature complete per spec, tests pass, no lint/type errors,
docs updated. Stop there.

## The Meta-Insight

The people who are most effective with agent-assisted development haven't
necessarily mastered prompting. They've built better scaffolding:

- Templates that encode good defaults
- Checklists that catch common errors
- Documentation that survives context limits
- Review processes that target agent-specific failure modes
- Stopping criteria that prevent scope creep

The system around the agent matters as much as the agent itself.

Your development environment is now a first-class engineering artifact.
Design it deliberately.
