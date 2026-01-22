# Prompt Engineering Patterns

> Patterns for effective prompting in Claude Code workflows.

---

## Pattern: Context Loading Ritual

### Problem
Claude Code loses context across sessions and long conversations.

### Solution
Start sessions with explicit context loading instructions.

### Examples
```
Load context from: CLAUDE.md, ARCHITECTURE.md, ITERATION_LOG.md
Summarize what you understand about the current state.
```

### Anti-patterns
- Assuming Claude remembers previous sessions
- Loading too many files at once (context pollution)

---

## Pattern: Bounded Generation Requests

### Problem
Asking for "the whole feature" produces overwhelming, unverifiable output.

### Solution
Request work in bounded chunks with clear stopping points.

### Examples
```
# Good
"Implement the user registration endpoint. Stop after the route handler is complete."

# Bad
"Build the entire authentication system."
```

### Anti-patterns
- Open-ended requests without scope boundaries
- Not specifying when to stop

---

## Pattern: Acceptance Criteria First

### Problem
Without clear criteria, you don't know when you're done.

### Solution
Define acceptance criteria before starting any generation.

### Examples
```markdown
## Acceptance Criteria
- [ ] Endpoint returns 201 on success
- [ ] Invalid email returns 400 with error message
- [ ] Duplicate email returns 409
- [ ] Tests cover all three cases
```

### Anti-patterns
- "Make it work" without defining what "work" means
- Moving the goalposts mid-implementation

---

## Pattern: Negative Constraints

### Problem
Claude may add features or complexity beyond what's needed.

### Solution
Explicitly state what NOT to build.

### Examples
```
Implement basic user registration.
DO NOT:
- Add email verification
- Add OAuth providers
- Add rate limiting
- Refactor existing code
```

### Anti-patterns
- Leaving scope open-ended
- Not constraining "helpful" additions

---

## Pattern: Learning Trigger Prompts

### Problem
Valuable insights get lost in the flow of work.

### Solution
Pause to capture learnings with specific prompts.

### Examples
```
# When something works
"That worked well. Why? Document the insight."

# When something fails
"That didn't work. What did we learn? Capture it."

# When surprised
"I didn't expect that. Add this to learnings."
```

### Anti-patterns
- Waiting until end of session to document
- Not documenting failures (only successes)

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
