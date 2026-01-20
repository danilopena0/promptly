# Software Principles Quick Reference

Keep these visible during development. These are the load-bearing principles
that should be non-negotiable constraints in agent-assisted work.

---

## Core Principles

### SRP - Single Responsibility Principle
> "A module should have one, and only one, reason to change."

**In practice:** Each function does one thing. Each class has one job. Each file has one purpose.

**Why it matters for agents:** Smaller, focused pieces are easier to specify, generate, and verify.

---

### DRY - Don't Repeat Yourself
> "Every piece of knowledge must have a single, unambiguous, authoritative representation."

**In practice:** Extract repeated code into functions. Centralize configuration. No copy-paste.

**Why it matters for agents:** Agents may not see all files; duplication leads to inconsistent changes.

---

### Explicit Over Implicit
> "Make dependencies, state, and behavior visible."

**In practice:**
- Pass dependencies as parameters, don't reach for globals
- Config in files, not hardcoded magic values
- Clear function signatures showing what goes in and out

**Why it matters for agents:** Agents can't read your mind about unstated assumptions.

---

### Fail Fast
> "Detect errors at the earliest possible point."

**In practice:**
- Validate inputs at function boundaries
- Raise clear errors with helpful messages
- Don't silently swallow problems

**Why it matters for agents:** Catches agent mistakes before they propagate through the system.

---

### Separation of Concerns
> "Different aspects of functionality should be managed in different places."

**In practice:**
- Data access separate from business logic
- UI separate from core functionality
- Configuration separate from code

**Why it matters for agents:** You can generate and test components in isolation.

---

### Principle of Least Surprise
> "Code should behave as readers would expect."

**In practice:**
- Conventional naming (`get_` returns something, `set_` modifies something)
- Side effects should be obvious
- Consistent patterns throughout codebase

**Why it matters for agents:** Counters the "works but weird" tendency of generated code.

---

### Command-Query Separation
> "Functions should either do something OR return something, not both."

**In practice:**
- Commands: `save_user(user)` - returns nothing, causes side effect
- Queries: `get_user(id)` - returns data, no side effects

**Why it matters for agents:** Reduces side-effect surprises in generated code.

---

### Composition Over Inheritance
> "Build complex behavior by combining simple pieces."

**In practice:**
- Small functions that can be chained
- Dependency injection over class hierarchies
- Interfaces over base classes

**Why it matters for agents:** Easier to generate and test in isolation.

---

### Interface Segregation
> "Clients should not depend on interfaces they don't use."

**In practice:**
- Small, focused interfaces
- Don't pass entire objects when you need one field
- Type hints that reflect actual needs

**Why it matters for agents:** Clearer contracts between agent-generated components.

---

## Secondary Principles

### YAGNI - You Aren't Gonna Need It
Don't build features before they're needed. Speculating about future requirements leads to complexity.

### KISS - Keep It Simple, Stupid
The simplest solution that works is usually the best. Complexity is a cost.

### Law of Demeter
Talk only to your immediate friends. Don't chain through objects: `a.b.c.d()` is a smell.

### Prefer Pure Functions
Functions that take inputs and return outputs without side effects are easier to test and reason about.

### Early Return
Return early to avoid deep nesting. Handle edge cases first, then the main logic.

---

## Code Smells to Watch For

| Smell | What It Looks Like | Fix |
|-------|-------------------|-----|
| Long function | >30 lines | Extract into smaller functions |
| Deep nesting | >3 levels of indentation | Early returns, extract logic |
| God object | One class doing everything | Split by responsibility |
| Feature envy | Method uses other class more than its own | Move method to other class |
| Primitive obsession | Using strings/ints for concepts | Create domain types |
| Magic numbers | `if status == 3` | Named constants |
| Shotgun surgery | One change requires editing many files | Better cohesion |

---

## Quick Decision Tree

```
Is this function doing more than one thing?
└── Yes → Split it

Is this code duplicated elsewhere?
└── Yes → Extract to shared function

Are there hidden dependencies?
└── Yes → Make them explicit parameters

Will this fail silently?
└── Yes → Add validation and clear errors

Would another developer be surprised by this?
└── Yes → Refactor for clarity
```
