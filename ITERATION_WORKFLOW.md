# Iteration Workflow: Capturing Learnings with Claude Code

> A workflow for making improvements, hitting checkpoints, and preserving learnings across sessions.

---

## Overview

This workflow addresses three goals:
1. **Make improvements** incrementally with clear checkpoints
2. **Capture learnings** as they emerge (not after the fact)
3. **Build institutional knowledge** that survives context resets

---

## Documentation Architecture

```
promptly/
├── LEARNINGS/                    # Learning journal
│   ├── README.md                 # Index of learnings by topic
│   ├── YYYY-MM-DD-topic.md      # Individual learning entries
│   └── patterns/                 # Reusable patterns extracted
│       ├── agent-design.md
│       ├── prompt-engineering.md
│       └── workflow-patterns.md
├── METHOD.md                     # Development methodology & context engineering
├── NAMING_CONVENTIONS.md         # File/folder naming standards
├── CHANGELOG.md                  # What changed (for users)
├── ITERATION_LOG.md              # Iteration-specific session log
├── BEST_PRACTICES_PLAN.md        # Improvement roadmap
└── ... (existing structure)
```

### Why This Structure?

| File | Purpose | Audience |
|------|---------|----------|
| `LEARNINGS/` | Raw insights, experiments, discoveries | You (developer) |
| `METHOD.md` | Development philosophy & context engineering | You + Claude Code |
| `NAMING_CONVENTIONS.md` | File/folder naming standards | You + contributors |
| `CHANGELOG.md` | User-facing "what's new" | Users of promptly |
| `ITERATION_LOG.md` | Current iteration tracking | You + Claude Code |
| `BEST_PRACTICES_PLAN.md` | Strategic roadmap | Reference |

---

## The Iteration Cycle

```
┌─────────────────────────────────────────────────────────────┐
│                    ITERATION CYCLE                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. PLAN      → Pick improvement from BEST_PRACTICES_PLAN  │
│       ↓                                                     │
│  2. DO        → Implement with Claude Code                 │
│       ↓                                                     │
│  3. CAPTURE   → Document learnings AS YOU GO               │
│       ↓                                                     │
│  4. CHECKPOINT → Commit with meaningful message            │
│       ↓                                                     │
│  5. REFLECT   → Update patterns & roadmap                  │
│       ↓                                                     │
│  (repeat)                                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Phase 1: Plan

**Goal**: Select one focused improvement per iteration.

### Steps:
1. Review `BEST_PRACTICES_PLAN.md` for next priority item
2. Create/update `ITERATION_LOG.md` with:
   - Goal statement
   - Acceptance criteria
   - Scope boundaries (what NOT to do)
3. Estimate effort (small/medium/large)

### Template for ITERATION_LOG.md:
```markdown
# Current Iteration

## Goal
[One sentence: what am I improving?]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Scope Boundaries
NOT building: [explicit exclusions]

## Status: [planning | in-progress | review | complete]
```

---

## Phase 2: Do (with Learning Capture)

**Goal**: Implement while capturing insights in real-time.

### The "Learning Trigger" Prompts

Use these prompts with Claude Code to capture learnings:

**When something works well:**
```
That worked well. Before we continue, let me capture why:
- What made this approach effective?
- Is this a pattern we should document?
```

**When something doesn't work:**
```
That didn't work as expected. Let's document:
- What was the hypothesis?
- What actually happened?
- What's the revised approach?
```

**When you discover something unexpected:**
```
I just learned something. Capture this insight:
- Discovery: [what you found]
- Context: [when this matters]
- Implication: [how to use this]
```

### Real-Time Learning Capture Format

During implementation, dump learnings into `ITERATION_LOG.md`:

```markdown
## Learnings (Raw)

### [Timestamp] Discovery
**What**: [Brief description]
**Why it matters**: [So what?]
**Pattern?**: [Could this be generalized?]

### [Timestamp] Failed Approach
**Tried**: [What you attempted]
**Result**: [What happened]
**Better approach**: [What worked instead]
```

---

## Phase 3: Checkpoint

**Goal**: Save progress at meaningful intervals.

### Checkpoint Triggers

Create a checkpoint when:
- [ ] A sub-feature is complete and working
- [ ] Tests pass for the current change
- [ ] You've accumulated 3+ learnings worth preserving
- [ ] Before any risky change
- [ ] End of a work session

### Checkpoint Actions

1. **Git commit** with semantic message:
   ```
   feat(agents): add uncertainty permissions to all agents

   Learnings: explicit uncertainty reduces hallucination in complex
   reasoning tasks. See LEARNINGS/2026-01-22-uncertainty.md
   ```

2. **Tag milestones** (optional):
   ```bash
   git tag -a v0.2.0 -m "Phase 1 improvements complete"
   ```

3. **Update ITERATION_LOG.md** checkpoint section:
   ```markdown
   ## Checkpoints

   ### CP1: [Name] - [commit hash]
   - What's done: [summary]
   - Can rollback to: `git checkout [hash]`
   ```

---

## Phase 4: Reflect & Extract

**Goal**: Convert raw learnings into reusable knowledge.

### After Each Iteration

1. **Review raw learnings** in ITERATION_LOG.md
2. **Promote valuable insights** to `LEARNINGS/YYYY-MM-DD-topic.md`
3. **Extract patterns** to `LEARNINGS/patterns/*.md`
4. **Update roadmap** if priorities changed

### Learning Entry Template

Create `LEARNINGS/YYYY-MM-DD-topic.md`:

```markdown
# Learning: [Descriptive Title]

**Date**: YYYY-MM-DD
**Context**: [What iteration/task produced this]
**Confidence**: [hypothesis | validated | proven]

## The Insight

[2-3 sentences explaining what you learned]

## Evidence

[What happened that taught you this]

## Application

[When/how to apply this learning]

## Related

- [Links to other learnings or patterns]
```

### Pattern Extraction

When you see the same learning 3+ times, extract to a pattern file:

```markdown
# Pattern: [Name]

## Problem
[What situation does this address?]

## Solution
[The pattern/approach]

## Examples
[Concrete examples from your experience]

## Anti-patterns
[What to avoid]
```

---

## Phase 5: Update & Iterate

### End of Iteration Checklist

- [ ] All acceptance criteria met
- [ ] ITERATION_LOG.md updated with final status
- [ ] Raw learnings promoted to LEARNINGS/
- [ ] CHANGELOG.md updated (if user-facing)
- [ ] BEST_PRACTICES_PLAN.md updated (mark complete, add new items)
- [ ] Clean commit history
- [ ] Ready for next iteration

### Periodic Review Checklist (Every 3-5 Iterations)

These documents should evolve with the project. Review periodically:

- [ ] **METHOD.md** - Does our methodology still reflect how we work?
  - New context engineering techniques discovered?
  - Approaches that proved ineffective?
  - Industry best practices shifted?
- [ ] **LEARNINGS/README.md** - Is the index current and navigable?
  - Key insights section reflects top learnings?
  - Chronological list up to date?
  - Patterns properly extracted?
- [ ] **NAMING_CONVENTIONS.md** - Are naming patterns working?
  - New file types introduced?
  - Conventions causing friction?
- [ ] **BEST_PRACTICES_PLAN.md** - Roadmap aligned with current goals?

### Reset for Next Iteration

1. Archive current ITERATION_LOG.md if keeping history:
   ```bash
   mv ITERATION_LOG.md LEARNINGS/iterations/YYYY-MM-DD-iteration-name.md
   ```

2. Create fresh ITERATION_LOG.md for next goal

3. Review LEARNINGS/README.md index is current

---

## Quick Reference: Prompts for Claude Code

### Session Start
```
I'm working on iteration [X]. Goal: [goal].
Load context from: CLAUDE.md, ITERATION_LOG.md, BEST_PRACTICES_PLAN.md
```

### Mid-Session Learning Capture
```
Pause. I want to capture a learning before continuing:
[describe insight]
Add this to the Learnings section of ITERATION_LOG.md
```

### Before Context Reset
```
Before we end/reset:
1. What did we learn this session?
2. What should I document in LEARNINGS/?
3. What's the next priority?
Update ITERATION_LOG.md with this summary.
```

### Checkpoint Request
```
Good stopping point. Let's checkpoint:
1. Summarize what's complete
2. Note what's pending
3. Update ITERATION_LOG.md checkpoints
```

---

## File Templates

### LEARNINGS/README.md
```markdown
# Learnings Index

## By Topic
- [Agent Design](patterns/agent-design.md)
- [Prompt Engineering](patterns/prompt-engineering.md)
- [Workflow Patterns](patterns/workflow-patterns.md)

## Chronological
- [2026-01-22: Uncertainty Permissions](2026-01-22-uncertainty.md)
- [2026-01-XX: Next learning...](...)

## Key Insights (Quick Reference)
1. [Most important learning]
2. [Second most important]
3. ...
```

### CHANGELOG.md
```markdown
# Changelog

All notable changes to Promptly.

## [Unreleased]
### Added
### Changed
### Fixed

## [0.1.0] - YYYY-MM-DD
### Added
- Initial agent set (10 agents)
- Project scaffold templates
- Documentation templates
```

---

## Integration with Existing Workflow

This workflow complements your existing files:

| Existing | How It Integrates |
|----------|-------------------|
| SESSION_LOG.md | Use for individual project sessions; ITERATION_LOG.md for promptly improvements |
| SESSION_CHECKLIST.md | Reference during Phase 2 (Do) |
| BEST_PRACTICES_PLAN.md | Source of truth for what to improve (Phase 1) |
| CLAUDE.md | Update when architecture changes |

---

## Getting Started

1. Create the directory structure:
   ```bash
   mkdir -p LEARNINGS/patterns LEARNINGS/iterations
   ```

2. Create initial files:
   - `LEARNINGS/README.md` (index)
   - `ITERATION_LOG.md` (current iteration)
   - `CHANGELOG.md` (user-facing changes)

3. Pick first improvement from BEST_PRACTICES_PLAN.md

4. Follow the cycle: Plan → Do → Capture → Checkpoint → Reflect

---

## Context Engineering Tips

These principles (from [Anthropic's context engineering guide](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)) inform how we work:

| Principle | Application in Promptly |
|-----------|------------------------|
| **Minimum viable context** | Load only what's needed; use file paths as identifiers |
| **Calibrate the altitude** | Balance specificity and flexibility in agent prompts |
| **Structured formatting** | Use XML tags and Markdown headers for clarity |
| **Start minimal, iterate** | Add instructions based on observed failures |
| **Minimize tool overlap** | Each agent has single, clear responsibility |
| **Token efficiency** | Return compact information; avoid bloated outputs |
| **Just-in-time retrieval** | Maintain identifiers, load details on demand |
| **Compaction** | Summarize conversations approaching context limits |
| **Structured note-taking** | CLAUDE.md, ITERATION_LOG.md survive resets |
| **Sub-agent architecture** | Delegate to focused agents returning summaries |

See [METHOD.md](./METHOD.md) for full methodology documentation.

---

## Meta: Improving This Workflow

This workflow itself should evolve. Capture learnings about the learning process in:
`LEARNINGS/patterns/meta-workflow.md`

---

## References

- [METHOD.md](./METHOD.md) - Development methodology & context engineering
- [NAMING_CONVENTIONS.md](./NAMING_CONVENTIONS.md) - File/folder naming standards
- [LEARNINGS/](./LEARNINGS/) - Knowledge base and patterns
- [Anthropic: Effective Context Engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
