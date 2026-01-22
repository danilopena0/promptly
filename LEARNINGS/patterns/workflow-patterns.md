# Workflow Patterns

> Patterns for effective development workflows with Claude Code.

---

## Pattern: Checkpoint Before Risk

### Problem
Risky changes without save points make recovery difficult.

### Solution
Commit before any change that could break things.

### Examples
```bash
# Before refactoring
git add -A && git commit -m "checkpoint: before auth refactor"

# Before risky change
git stash  # or commit

# Then attempt the risky change
```

### Anti-patterns
- Making breaking changes on uncommitted work
- "I'll commit when it's all done"

---

## Pattern: Test-First Verification

### Problem
Writing tests after implementation leads to tests that verify implementation, not behavior.

### Solution
Write tests first, or at minimum, define test cases before implementing.

### Examples
```
1. Define acceptance criteria as test cases
2. Write failing tests (or skeleton tests)
3. Implement until tests pass
4. Stop when green
```

### Anti-patterns
- "I'll add tests later" (you won't)
- Tests that just assert current behavior

---

## Pattern: Parallel Review Agents

### Problem
Sequential reviews are slow and create bottlenecks.

### Solution
Run independent review agents in parallel.

### Examples
```
Safe to parallelize:
- reviewer + security-reviewer + principles-enforcer
- explorer + architect (both read-only)

Must be sequential:
- architect → implementer (dependency)
- implementer → tester (dependency)
```

### Anti-patterns
- Running all agents sequentially "to be safe"
- Parallelizing dependent agents

---

## Pattern: Session Handoff Notes

### Problem
Context is lost between sessions; next session starts from scratch.

### Solution
End every session with explicit handoff notes.

### Examples
```markdown
## Session Handoff

### Next session should:
1. Complete the remaining 3 test cases
2. Run the reviewer agent on changes
3. Update CLAUDE.md with new endpoint

### Context to load:
- ITERATION_LOG.md (current state)
- src/auth/routes.py (in progress)

### Known issues:
- Test for duplicate email failing (investigate mock)
```

### Anti-patterns
- Ending sessions without documentation
- Assuming you'll remember where you left off

---

## Pattern: Incremental Complexity

### Problem
Building everything at once leads to complex debugging.

### Solution
Add complexity in layers; verify each layer before adding the next.

### Examples
```
Layer 1: Basic endpoint (happy path)
  → Verify: works
Layer 2: Input validation
  → Verify: rejects bad input
Layer 3: Error handling
  → Verify: handles edge cases
Layer 4: Tests
  → Verify: all green
```

### Anti-patterns
- Building "production-ready" in one shot
- Adding error handling before happy path works

---

## Pattern: Decision Documentation

### Problem
Architectural decisions get lost; same discussions repeat.

### Solution
Document decisions with rationale when made.

### Examples
```markdown
### Decision: Use JWT for authentication
**Context**: Need stateless auth for API
**Options considered**:
1. JWT - stateless, scalable, standard
2. Sessions - simpler but stateful
3. OAuth only - overkill for MVP

**Decision**: JWT
**Rationale**: Stateless requirement, team familiarity
```

### Anti-patterns
- Making decisions without documenting
- Documenting only the decision (not the why)

---

## Add New Patterns Below

<!-- Template:
## Pattern: [Name]

### Problem
[What situation does this address?]

### Solution
[The pattern/approach]

### Examples
[Concrete examples]

### Anti-patterns
[What to avoid]
-->
