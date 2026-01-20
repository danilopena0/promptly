# Development Session Checklist

Use this checklist to maintain consistency across development sessions.
Print it, keep it visible, or copy into your task management tool.

---

## Session Start

- [ ] **Define the goal**: What specifically am I trying to accomplish?
- [ ] **Set acceptance criteria**: How will I know it's done?
- [ ] **Scope boundaries**: What am I NOT building?
- [ ] **Load context**: CLAUDE.md, relevant files, architecture docs
- [ ] **Check current state**: Any broken tests? Lint errors? WIP code?

## During Generation

- [ ] **Bounded chunks**: Am I asking for too much at once?
- [ ] **Clear constraints**: Have I stated the non-negotiables?
- [ ] **Examples provided**: Would an example of desired output help?
- [ ] **Stopping point defined**: When should generation stop?

## After Each Generation

- [ ] **Run checks**: Tests pass? Lint clean? Types check?
- [ ] **"Works but weird" review**: Does the structure make sense?
- [ ] **Acceptance test**: Does this match what I asked for?
- [ ] **Integration check**: Does it fit with existing code?

## Before Context Reset / New Session

- [ ] **Document decisions**: Any architectural changes to CLAUDE.md?
- [ ] **Update ARCHITECTURE.md**: Any new components or patterns?
- [ ] **Commit with meaning**: Clear commit message capturing intent
- [ ] **Note WIP**: If incomplete, leave notes for next session

## Session End

- [ ] **Feature complete?**: Per acceptance criteria, not vibes
- [ ] **Tests pass?**: All automated checks green
- [ ] **Docs updated?**: CLAUDE.md, README, comments as needed
- [ ] **No gold-plating?**: Did I add anything beyond spec?
- [ ] **Clean state?**: Would next session start easily?

---

## Quick Reference: Error Types to Watch For

| Error Type | What to Look For |
|------------|------------------|
| Ambiguous spec | Output doesn't match intent |
| Missing context | Agent made wrong assumptions |
| Integration mismatch | Components don't fit together |
| "Works but weird" | Unusual structure or patterns |
| Scope creep | Features beyond acceptance criteria |
| Implicit assumptions | Hidden dependencies or magic values |

## Quick Reference: When to Stop Generating

Stop when:
- ✓ Acceptance criteria met
- ✓ Tests pass
- ✓ Lint/type checks clean
- ✓ Docs updated

Do NOT continue to:
- ✗ Add "nice to have" features
- ✗ Refactor working code "while we're at it"
- ✗ Optimize prematurely
- ✗ Build ahead of immediate need

---

## Notes Space

Use this for session-specific notes:

**Today's goal:**


**Blockers/Questions:**


**For next session:**

