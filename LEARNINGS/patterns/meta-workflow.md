# Meta-Workflow Patterns

> Patterns about the learning and iteration process itself.

---

## Pattern: Real-Time Learning Capture

### Problem
Retrospective documentation misses nuance and context.

### Solution
Capture learnings in the moment, even if rough. Polish later.

### Examples
```
# During work, when you notice something:
"Pause. Adding to learnings: [quick note]"

# Later, extract to proper learning entry
```

### Anti-patterns
- "I'll document this at the end of the session"
- Only documenting polished insights

---

## Pattern: Three-Strike Pattern Extraction

### Problem
One-off insights clutter documentation; real patterns take time to emerge.

### Solution
Keep raw learnings loose. Extract to patterns only after seeing the same thing 3+ times.

### Examples
```
Strike 1: "Hm, bounded requests worked better here"
Strike 2: "Again, smaller chunks were easier to verify"
Strike 3: "Pattern emerging" → Extract to patterns/prompt-engineering.md
```

### Anti-patterns
- Extracting patterns from single observations
- Never extracting (everything stays raw)

---

## Pattern: Confidence Levels

### Problem
Not all learnings are equally reliable.

### Solution
Tag learnings with confidence levels.

### Examples
```markdown
**Confidence**: hypothesis   # Untested idea
**Confidence**: validated    # Worked once or twice
**Confidence**: proven       # Reliable across contexts
```

### Anti-patterns
- Treating all learnings as equally certain
- Never updating confidence as evidence accumulates

---

## Pattern: Learning-Driven Iteration

### Problem
Improvement priorities are arbitrary or stale.

### Solution
Let learnings inform what to improve next.

### Examples
```
1. Accumulate learnings during work
2. Review learnings at iteration end
3. If learning suggests improvement → add to BEST_PRACTICES_PLAN.md
4. Prioritize improvements that address repeated pain points
```

### Anti-patterns
- Following roadmap blindly regardless of learnings
- Never updating roadmap based on experience

---

## Pattern: Index Maintenance

### Problem
Learnings accumulate but become unfindable.

### Solution
Maintain the LEARNINGS/README.md index as you add entries.

### Examples
```
After adding new learning:
1. Add to chronological table
2. Link from relevant topic section
3. Update "Key Insights" if top-tier learning
```

### Anti-patterns
- "I'll organize this later" (you won't)
- Index that's always out of date

---

## Pattern: Iteration Scoping

### Problem
Iterations that are too big become unwieldy; too small feel unproductive.

### Solution
Size iterations to be completable in 1-3 focused sessions.

### Examples
```
# Good scope
"Add uncertainty permissions to all agents"
"Create evaluator agent"
"Document parallel agent patterns"

# Too big
"Implement all Phase 2 improvements"

# Too small
"Fix typo in one agent file"
```

### Anti-patterns
- Multi-week iterations that lose momentum
- Micro-iterations that create churn

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
