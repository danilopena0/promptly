# CLAUDE.md - Project Intelligence

> This file provides context and constraints for AI-assisted development.
> It persists across sessions and compensates for context window limitations.

## Project Overview

**Name:** [PROJECT_NAME]
**Type:** [ml-pipeline | web-app | data-tool | api-service | other]
**Status:** [exploration | active-development | refinement | maintenance]
**One-liner:** [What this project does in one sentence]

## Architecture Summary

<!-- Keep this updated. When context window fills, this survives. -->

```
[High-level diagram or description of how components connect]
```

### Key Components
- `src/` - [what lives here]
- `tests/` - [testing approach]
- `data/` - [data handling notes]

### Important Decisions
<!-- Document the WHY, not just the what -->
1. [Decision]: [Rationale]
2. [Decision]: [Rationale]

## Development Principles

### Non-Negotiable Constraints
These are load-bearing. Do not deviate without explicit discussion.

- **Single Responsibility**: Each module/function does one thing
- **DRY**: Extract repeated logic; no copy-paste code blocks
- **Explicit over Implicit**: No hidden state, magic values, or implicit dependencies
- **Fail Fast**: Validate inputs early, raise clear errors immediately
- **Composition over Inheritance**: Small, composable pieces
- **Command-Query Separation**: Functions either do things OR return things, not both

### Flexible Guidelines
Agent has latitude here. Suggest alternatives if better.

- Code organization and file structure
- Naming conventions (but be consistent)
- Implementation approach for well-defined interfaces
- Library choices for non-core functionality

### Code Style Preferences
- Type hints on all function signatures
- Docstrings on public functions (Google style)
- Max function length: ~30 lines (suggest extraction if longer)
- Prefer early returns over deep nesting
- No bare `except:` clauses

## Working Patterns

### Session Workflow
1. **Before generating**: State what you're building and acceptance criteria
2. **During generation**: Work in bounded chunks, not entire features at once
3. **After generation**: Run checks, review for "works but weird" problems
4. **Before committing**: Update this file if architecture changed

### Acceptance Criteria Template
When starting a task, define:
- [ ] What "done" looks like specifically
- [ ] Edge cases to handle
- [ ] What should NOT be built (scope boundaries)

### When to Stop
- Feature complete per acceptance criteria
- Tests pass
- No linter/type errors
- Documentation updated
- **Stop there.** No gold-plating, no "while we're at it" additions.

## Context Management

### Files to Always Load
<!-- List files that must be in context for coherent work -->
- This file (CLAUDE.md)
- `ARCHITECTURE.md` (if exists)
- Relevant module's README

### Recovery From Context Loss
If you seem to have forgotten earlier decisions:
1. Re-read this file
2. Check git log for recent commits
3. Ask me to clarify rather than guessing

## Testing Strategy

### Test Types
- **Unit**: Pure functions, isolated logic
- **Integration**: Component boundaries, API contracts
- **Acceptance**: Does output match specification?

### Running Tests
```bash
# [Add your test commands here]
pytest tests/
pytest tests/ -v --tb=short  # verbose, short traceback
```

## Common Commands

```bash
# Development
[command]  # description

# Testing
[command]  # description

# Linting/Formatting
[command]  # description
```

## Known Gotchas

<!-- Things that have bitten you before -->
1. [Gotcha]: [How to avoid]

## Changelog

<!-- Track significant architectural changes -->
| Date | Change | Rationale |
|------|--------|-----------|
| YYYY-MM-DD | Initial setup | Project bootstrap |
