# Agent Design Patterns

> Patterns for designing effective Claude Code agents.

---

## Pattern: Single Responsibility Agent

### Problem
Agents that try to do too much produce inconsistent results and are hard to debug.

### Solution
Each agent should have one clear purpose. Split complex workflows across multiple specialized agents.

### Examples
- `explorer` only reads and reports (no modifications)
- `implementer` only writes code (doesn't design)
- `reviewer` only critiques (doesn't fix)

### Anti-patterns
- "Swiss army knife" agents that plan, implement, test, and review
- Agents that switch between read and write modes unpredictably

---

## Pattern: Read/Write Permission Separation

### Problem
Agents with write access can make unintended changes during exploration.

### Solution
Explicitly mark agents as read-only or write-capable in their definitions.

### Examples
```yaml
# Read-only agents
explorer: [Read, Glob, Grep]
reviewer: [Read]

# Write-capable agents
implementer: [Read, Edit, Write, Bash]
```

### Anti-patterns
- Giving all agents full tool access "just in case"
- Not documenting permission expectations

---

## Pattern: Model Tier Matching

### Problem
Using expensive models for simple tasks wastes resources; using cheap models for complex reasoning produces poor results.

### Solution
Match model capability to task complexity.

### Examples
| Task Type | Model | Agents |
|-----------|-------|--------|
| Complex reasoning | Opus | orchestrator, architect |
| Standard execution | Sonnet | implementer, tester, reviewer |
| High-frequency, simple | Haiku | explorer, quick checks |

### Anti-patterns
- Always using Opus "to be safe"
- Using Haiku for architectural decisions

---

## Pattern: Explicit Uncertainty Permission

### Problem
Agents sometimes guess rather than admitting uncertainty, leading to hallucinations.

### Solution
Add explicit permission to express uncertainty in agent prompts.

### Examples
```markdown
You may express uncertainty rather than guessing.
Say "I'm not certain about X" or "I'd need to verify Y" when appropriate.
```

### Anti-patterns
- Requiring agents to always provide an answer
- Punishing uncertainty (even implicitly)

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
