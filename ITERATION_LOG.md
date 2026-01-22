# Current Iteration

> Track the current improvement iteration.

---

## Goal

Establish iteration workflow and learning capture system for promptly development.

## Acceptance Criteria

- [x] Create ITERATION_WORKFLOW.md documenting the process
- [x] Set up LEARNINGS/ directory structure
- [x] Create initial pattern files
- [x] Create this ITERATION_LOG.md template
- [ ] Create CHANGELOG.md for user-facing changes
- [ ] First iteration complete

## Scope Boundaries

NOT building:
- Automated learning extraction tooling
- Integration with external systems
- Changes to existing agents (this iteration)

## Status: in-progress

---

## Learnings (Raw)

*Capture insights here during the iteration. Move to LEARNINGS/ at the end.*

### 2026-01-22 - Workflow Design

**What**: The workflow needs to balance structure with flexibility
**Why it matters**: Too rigid = won't be used; too loose = no consistency
**Pattern?**: Yes - "just enough structure" for documentation

### [Add more as you discover them]

---

## Checkpoints

### CP1: Initial Structure - [pending commit]
- Created: ITERATION_WORKFLOW.md, LEARNINGS/, ITERATION_LOG.md
- Can rollback to: previous commit

---

## Decisions

### Decision 1: Separate LEARNINGS/ from project-scaffold/

**Context**: Where should learnings live?
**Options**:
1. In project-scaffold/templates/ - gets copied to new projects
2. In root LEARNINGS/ - specific to promptly development

**Decision**: Root LEARNINGS/ directory
**Rationale**: These are meta-learnings about building promptly, not templates for other projects. Projects get SESSION_LOG.md for their own learnings.

---

## Session Handoff

### If session ends, next session should:
1. Create CHANGELOG.md
2. Update README.md to mention the iteration workflow
3. Make first commit of this iteration

### Context to load:
- [ ] ITERATION_WORKFLOW.md
- [ ] This ITERATION_LOG.md
- [ ] BEST_PRACTICES_PLAN.md

### Known issues:
- None currently
