# AI Engineering Skills Guide

Essential skills for effective AI-assisted development with Claude Code and similar tools.

---

## Table of Contents

1. [Context Engineering](#context-engineering)
2. [Prompt Engineering](#prompt-engineering)
3. [Verification & Validation](#verification--validation)
4. [Debugging AI Output](#debugging-ai-output)
5. [Trust Calibration](#trust-calibration)
6. [Session Management](#session-management)
7. [Collaboration Patterns](#collaboration-patterns)

---

## Context Engineering

Context engineering is **what information you give the AI** and **how you structure it**. It's often more important than the prompt itself.

### The Context Hierarchy

```
┌─────────────────────────────────────────┐
│  System Context (CLAUDE.md)             │  ← Persists across sessions
│  - Project overview                     │
│  - Tech stack                           │
│  - Patterns and conventions             │
├─────────────────────────────────────────┤
│  Session Context (loaded files)         │  ← Current session
│  - Relevant source files                │
│  - Documentation                        │
│  - Recent changes                       │
├─────────────────────────────────────────┤
│  Task Context (your prompt)             │  ← This request
│  - What you want                        │
│  - Constraints                          │
│  - Examples                             │
└─────────────────────────────────────────┘
```

### Principles

#### 1. Front-load Critical Information

Put the most important context first. If context gets truncated, you want essentials preserved.

```markdown
# Bad: Important info buried
Here's some background... [500 words]
Oh, and the API uses v2 authentication.

# Good: Important info first
IMPORTANT: This API uses v2 authentication (Bearer tokens).
Background: [500 words]
```

#### 2. Be Explicit About Constraints

Don't assume the AI knows your constraints.

```markdown
# Bad: Implicit constraint
Add user authentication.

# Good: Explicit constraints
Add user authentication.
- Must use existing User model in src/models/user.py
- Must integrate with current session middleware
- No new dependencies (use stdlib only)
- Target: Python 3.11+
```

#### 3. Provide Negative Examples

Show what you DON'T want, not just what you want.

```markdown
# Good: Negative example
Create a logging utility.

DO NOT:
- Use print statements
- Create global logger instances
- Add color formatting (breaks in CI)

DO:
- Use stdlib logging module
- Accept logger as parameter
- Support structured logging (JSON)
```

#### 4. Include "Why" Not Just "What"

Context about intent helps the AI make better decisions.

```markdown
# Bad: Just what
Add rate limiting to the API.

# Good: What + Why
Add rate limiting to the API.

Why: We're seeing abuse from scrapers hitting the search endpoint.
The goal is to limit anonymous users to 10 req/min while allowing
authenticated users 100 req/min. We may need to adjust these limits
based on monitoring, so make them configurable.
```

### Context Loading Strategies

#### For Small Tasks
```
Read the file, describe the task.
```

#### For Medium Tasks
```
1. Point to CLAUDE.md for project context
2. Load specific files: "Read src/api/routes.py and src/models/user.py"
3. Describe the task
```

#### For Large Tasks
```
1. Start with explorer to map relevant code
2. Save findings to SESSION_LOG.md
3. Load findings + specific files
4. Use architect to plan
5. Execute in phases with checkpoints
```

### CLAUDE.md Best Practices

Your CLAUDE.md is the AI's "memory" across sessions. Optimize it:

```markdown
# Project: MyApp

## Quick Facts (always read these)
- Python 3.11 + Litestar + SQLite
- Run tests: `pytest`
- Run app: `make dev`

## Architecture (read for structural tasks)
[Component descriptions]

## Patterns (read when writing code)
- All DB access through repository pattern
- Errors use custom AppError hierarchy
- Config from environment variables only

## Recent Decisions (read for context)
- 2024-01: Switched from FastAPI to Litestar for OpenAPI support
- 2024-02: Removed Redis dependency, using SQLite for caching

## Known Issues (read before debugging)
- Tests flaky on CI due to timing issues (#123)
- Don't use `datetime.now()`, use `utils.now()` for testability
```

---

## Prompt Engineering

Prompt engineering is **how you ask** for what you want.

### The CLEAR Framework

**C**ontext → **L**oad relevant information first
**E**xplicit → State exactly what you want
**A**ctionable → Request specific outputs
**R**efined → Iterate based on results

### Prompt Patterns

#### 1. The Specification Pattern

For implementation tasks, be specific:

```markdown
Create a function `calculate_metrics` that:

Inputs:
- trades: list of Trade objects (see src/models/trade.py)
- period: str, one of "daily", "weekly", "monthly"

Outputs:
- MetricsResult with fields: total_return, sharpe_ratio, max_drawdown

Behavior:
- Return empty MetricsResult if trades list is empty
- Raise ValueError if period is invalid
- Use Polars for calculations (not pandas)

Example:
>>> trades = [Trade(...), Trade(...)]
>>> result = calculate_metrics(trades, "daily")
>>> result.sharpe_ratio
1.45
```

#### 2. The Constraint Pattern

When you need to limit scope:

```markdown
Refactor the authentication module.

CONSTRAINTS:
- Do not change the public API (function signatures must stay same)
- Do not add new dependencies
- Keep backward compatibility with existing tokens
- Complete in under 200 lines of changes

FOCUS ON:
- Extracting password hashing to separate module
- Improving error messages
- Adding type hints
```

#### 3. The Example Pattern

Show, don't just tell:

```markdown
Create API endpoints following our existing pattern.

EXAMPLE (existing endpoint):
```python
@router.get("/users/{user_id}")
async def get_user(user_id: int, db: Database) -> UserResponse:
    user = await db.users.get(user_id)
    if not user:
        raise NotFoundError(f"User {user_id} not found")
    return UserResponse.from_orm(user)
```

Create similar endpoints for:
- GET /orders/{order_id}
- GET /products/{product_id}
```

#### 4. The Checklist Pattern

For complex tasks, provide a checklist:

```markdown
Implement user registration.

CHECKLIST (verify each):
- [ ] Validate email format
- [ ] Check email not already registered
- [ ] Hash password with bcrypt
- [ ] Create user in database
- [ ] Send verification email (mock for now)
- [ ] Return user without password hash
- [ ] Log registration event
- [ ] Handle all error cases with proper HTTP codes
```

#### 5. The Persona Pattern

Invoke specific expertise:

```markdown
As a security engineer, review this authentication code for vulnerabilities.
Focus on: injection attacks, session management, password storage.
```

```markdown
As a performance engineer, analyze this data processing function.
Identify bottlenecks and suggest optimizations using NumPy/Polars.
```

### Anti-Patterns to Avoid

#### Vague Requests
```markdown
# Bad
Make the code better.

# Good
Refactor the `process_data` function to:
- Reduce cyclomatic complexity (currently 15, target <10)
- Extract the validation logic to a separate function
- Add type hints to all parameters
```

#### Assuming Context
```markdown
# Bad
Fix the bug in the API.

# Good
Fix the 500 error in GET /api/users/{id}.
Bug: Returns 500 when user_id doesn't exist (should return 404).
Reproduce: `curl localhost:8000/api/users/99999`
```

#### Overloading
```markdown
# Bad
Build a complete e-commerce system with cart, checkout, payments,
inventory management, user accounts, admin panel, and analytics.

# Good
Let's build the e-commerce system in phases.
Phase 1: User accounts (registration, login, profile)
Start with: Create the User model and registration endpoint.
```

---

## Verification & Validation

The most critical skill: **verify AI output before trusting it**.

### The Verification Pyramid

```
        /\
       /  \    Manual Review
      /    \   (Logic, Edge Cases)
     /──────\
    /        \  Automated Checks
   /          \ (Tests, Lint, Types)
  /────────────\
 /              \ Quick Sanity
/                \(Does it run?)
──────────────────
```

### Verification Checklist

#### Level 1: Does It Run?
- [ ] Code compiles/parses without errors
- [ ] Application starts
- [ ] Basic functionality works

#### Level 2: Automated Checks
- [ ] All tests pass
- [ ] No linting errors
- [ ] No type errors
- [ ] No security scanner warnings

#### Level 3: Manual Review
- [ ] Logic is correct (not just "works")
- [ ] Edge cases handled
- [ ] Error handling appropriate
- [ ] No "works but weird" solutions
- [ ] Matches existing patterns
- [ ] No unnecessary complexity

### "Works But Weird" Detection

AI often produces code that works but is subtly wrong. Watch for:

| Symptom | Example |
|---------|---------|
| Reinventing existing utilities | Writing custom date parser when project has one |
| Over-engineering | Creating abstract factory for one-time use |
| Inconsistent patterns | Using callbacks when rest of codebase uses async/await |
| Magic values | Hardcoded timeouts, sizes, or thresholds |
| Silent failures | Catching and ignoring exceptions |
| Copy-paste artifacts | Comments referencing different function |

### Test AI Output

Don't just review—test:

```bash
# Run the code
python -c "from module import new_function; print(new_function(test_input))"

# Check edge cases
python -c "from module import new_function; new_function(None)"
python -c "from module import new_function; new_function([])"
python -c "from module import new_function; new_function('')"

# Run actual tests
pytest tests/test_new_function.py -v
```

---

## Debugging AI Output

When AI output doesn't work, debug systematically.

### The 5 Whys for AI Output

1. **What's wrong?** (Symptoms)
2. **What did I ask for?** (Review prompt)
3. **What context did AI have?** (Review loaded files)
4. **What assumptions did AI make?** (Read the code/comments)
5. **What was missing?** (What context would have helped?)

### Common Failure Modes

| Failure | Cause | Fix |
|---------|-------|-----|
| Wrong library used | Didn't specify stack | Add "Use X library" to prompt |
| Doesn't match patterns | AI didn't see examples | Load example files first |
| Missing edge cases | Not specified | Add "Handle cases: X, Y, Z" |
| Wrong API version | Outdated training | Provide current API docs |
| Over-complicated | No simplicity constraint | Add "Keep it simple, no abstractions" |
| Incomplete | Task too large | Break into smaller tasks |

### Recovery Strategies

**If output is partially correct:**
```
The implementation is mostly correct, but:
1. Change X to Y because [reason]
2. Add handling for [edge case]
3. Remove [unnecessary part]
```

**If output is fundamentally wrong:**
```
Let's start over. The approach should be [different approach].

Key insight you may have missed: [important context]

Please implement using [specific pattern/library/approach].
```

**If you're not sure what's wrong:**
```
Use the debugger agent to analyze why this implementation
fails when [specific scenario].
```

---

## Trust Calibration

Knowing when to trust AI output vs verify carefully.

### Trust Matrix

| Task Type | Trust Level | Verification |
|-----------|-------------|--------------|
| Boilerplate (models, CRUD) | High | Quick review |
| Standard patterns (auth, validation) | Medium | Test thoroughly |
| Business logic | Low | Manual review + tests |
| Security-sensitive | Very Low | Security review + audit |
| Novel/complex algorithms | Very Low | Extensive testing |
| Existing code modification | Medium | Diff review + tests |

### High-Trust Scenarios
- Generating boilerplate you've described precisely
- Following patterns you've shown examples of
- Simple transformations (rename, reformat)
- Documentation generation

### Low-Trust Scenarios
- Security-critical code (auth, crypto, permissions)
- Financial calculations
- Data migrations
- Integration with external systems you haven't described
- "Creative" solutions to underspecified problems

### Building Trust Over Time

1. **Start small**: Test AI on low-risk tasks first
2. **Verify consistently**: Don't skip verification even when confident
3. **Track accuracy**: Note where AI succeeds vs fails in your codebase
4. **Calibrate prompts**: Improve prompts based on failure patterns

---

## Session Management

Managing context and continuity across Claude sessions.

### Session Lifecycle

```
┌─────────────────────────────────────────────────────────────┐
│ SESSION START                                               │
│ 1. Load CLAUDE.md (project context)                         │
│ 2. Load SESSION_LOG.md if continuing previous work          │
│ 3. State session goal                                       │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│ ACTIVE WORK                                                 │
│ - Work in bounded tasks                                     │
│ - Commit at logical checkpoints                             │
│ - Update SESSION_LOG.md for complex work                    │
│ - Watch for context window filling up                       │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│ SESSION END                                                 │
│ 1. Summarize what was accomplished                          │
│ 2. Note any pending work in SESSION_LOG.md                  │
│ 3. Update CLAUDE.md if project context changed              │
│ 4. Commit changes with meaningful message                   │
└─────────────────────────────────────────────────────────────┘
```

### When to Start a New Session

- Context feels "stale" (AI repeating itself or confused)
- Switching to a completely different task
- After major milestone (feature complete, merged PR)
- Session has been going for a long time

### Context Recovery

If Claude seems lost or confused:

```markdown
Let's reset context. Please read:
1. CLAUDE.md for project overview
2. SESSION_LOG.md for what we've done
3. [specific files relevant to current task]

We were working on: [current task]
Current state: [what's done, what's pending]
```

---

## Collaboration Patterns

Working effectively with AI as a collaborator.

### The Pair Programming Model

Think of Claude as a pair programming partner:

| You (Navigator) | Claude (Driver) |
|-----------------|-----------------|
| Define goals | Implement solutions |
| Review output | Generate code |
| Make decisions | Provide options |
| Verify correctness | Follow patterns |
| Own the codebase | Assist with tasks |

### Effective Feedback Loops

**Positive feedback** (reinforce good patterns):
```markdown
Good, that matches our repository pattern. Continue with the
service layer using the same approach.
```

**Corrective feedback** (fix misunderstandings):
```markdown
Not quite. In this codebase, we use dependency injection, not
direct instantiation. Here's an example: [show correct pattern]
```

**Clarifying feedback** (when output is ambiguous):
```markdown
Before I accept this, explain why you chose to use a class here
instead of a function. I want to understand if it's necessary.
```

### When to Take Back Control

Sometimes it's faster to do it yourself:

- **Trivial changes**: One-line fixes you can type faster than describe
- **High-context edits**: Changes requiring deep knowledge AI doesn't have
- **Exploratory work**: When you need to "feel" the code
- **After 2-3 failed attempts**: AI isn't converging on correct solution

### Escalation Path

```
Simple prompt
    │ ↓ (didn't work)
More specific prompt with examples
    │ ↓ (still wrong)
Break into smaller tasks
    │ ↓ (still struggling)
Provide working example to mimic
    │ ↓ (fundamentally wrong approach)
Do it manually, document the pattern for next time
```

---

## Skills Summary

### Essential Skills (must have)

1. **Context Engineering**: Structure information for AI effectively
2. **Verification**: Never trust without verifying
3. **Prompt Iteration**: Refine prompts based on results
4. **Trust Calibration**: Know when to verify thoroughly

### Advanced Skills (for power users)

5. **Session Management**: Maintain context across sessions
6. **Agent Orchestration**: Use multiple specialized agents
7. **Failure Recovery**: Debug and recover from AI mistakes
8. **Pattern Recognition**: Identify recurring AI failure modes

### Meta-Skills (for teams)

9. **Template Creation**: Build reusable prompt templates
10. **Documentation**: Maintain AI-friendly project docs
11. **Process Design**: Design workflows that leverage AI effectively
12. **Knowledge Transfer**: Teach others to use AI tools effectively

---

## Quick Reference

### Before Asking AI
- [ ] Is my CLAUDE.md up to date?
- [ ] Have I loaded relevant files?
- [ ] Is my request specific enough?
- [ ] Have I stated constraints explicitly?

### After AI Responds
- [ ] Does it compile/run?
- [ ] Do tests pass?
- [ ] Does it match our patterns?
- [ ] Is there anything "weird"?
- [ ] Did I verify security-sensitive parts?

### When Things Go Wrong
- [ ] What context was missing?
- [ ] Can I provide a working example?
- [ ] Should I break this into smaller tasks?
- [ ] Is this something I should just do manually?
