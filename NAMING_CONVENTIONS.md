# Naming Conventions

> Consistent naming improves discoverability, reduces cognitive load, and enables better AI-assisted navigation.

---

## Core Principles

1. **Descriptive over clever** - Names should reveal intent
2. **Consistent patterns** - Same concepts use same naming style
3. **Discoverable** - Structure should be navigable by both humans and AI
4. **Context-aware** - Names work standalone and in context

---

## Directory Structure

### Top-Level Directories

Use **lowercase-kebab-case** for directories:

```
promptly/
├── agents/              # Specialized agent definitions
├── project-scaffold/    # Templates for new projects
├── learnings/           # Knowledge base (patterns, iterations)
└── examples/            # Example implementations
```

**Rationale:**
- Consistent with npm, git, and CLI conventions
- Works across all operating systems
- Easy to type in terminals

### Nested Directories

Follow the same pattern:

```
learnings/
├── patterns/           # Extracted reusable patterns
├── iterations/         # Historical iteration logs
└── research/           # Research notes and findings
```

---

## File Naming

### Documentation Files (Markdown)

Use **UPPER_SNAKE_CASE** for top-level documentation:

```
CLAUDE.md              # AI context (required)
ARCHITECTURE.md        # System architecture
README.md              # Project introduction
ITERATION_LOG.md       # Current iteration state
ITERATION_WORKFLOW.md  # Workflow documentation
BEST_PRACTICES_PLAN.md # Strategic roadmap
METHOD.md              # Methodology document
NAMING_CONVENTIONS.md  # This file
CHANGELOG.md           # Version history
```

**Rationale:**
- Stands out in directory listings
- Indicates "project-level" documentation
- GitHub convention for important files

### Nested Documentation

Use **lowercase-kebab-case** for non-root documentation:

```
learnings/patterns/
├── agent-design.md
├── prompt-engineering.md
├── workflow-patterns.md
└── meta-workflow.md
```

### Date-Prefixed Files

Use **YYYY-MM-DD** prefix for chronological files:

```
learnings/iterations/
├── 2026-01-22-workflow-setup.md
├── 2026-01-25-agent-improvements.md
└── 2026-01-26-context-engineering.md
```

**Format:** `YYYY-MM-DD-descriptive-name.md`

---

## Agent Files

### Agent Definition Files

Use **lowercase-kebab-case** matching the agent's functional name:

```
agents/
├── orchestrator.md
├── explorer.md
├── architect.md
├── implementer.md
├── tester.md
├── reviewer.md
├── principles-enforcer.md
├── optimizer.md
├── documenter.md
├── evaluator.md
├── security-reviewer.md
├── debugger.md
└── recovery.md
```

**Naming pattern:**
- Use role nouns: `reviewer`, `tester`, `debugger`
- Use verb-noun for specific functions: `principles-enforcer`
- Avoid abbreviations: `security-reviewer` not `sec-reviewer`

---

## Template Files

### Scaffold Templates

Use **UPPER_SNAKE_CASE.md** matching the target file name:

```
project-scaffold/
├── CLAUDE.md           # Template for AI context
├── ARCHITECTURE.md     # Template for architecture doc
├── SESSION_LOG.md      # Template for session tracking
└── SESSION_CHECKLIST.md
```

### Script Files

Use **lowercase-kebab-case** with appropriate extension:

```
project-scaffold/
├── new-project.sh      # Project initialization script
├── setup-hooks.sh      # Git hooks setup
└── validate-config.sh  # Configuration validation
```

---

## Code Conventions

### Source Files

Follow language conventions:

| Language | Files | Classes/Types | Functions/Methods | Variables |
|----------|-------|---------------|-------------------|-----------|
| Python | `snake_case.py` | `PascalCase` | `snake_case` | `snake_case` |
| JavaScript/TypeScript | `kebab-case.ts` or `camelCase.ts` | `PascalCase` | `camelCase` | `camelCase` |
| Go | `lowercase.go` | `PascalCase` | `PascalCase`/`camelCase` | `camelCase` |
| Rust | `snake_case.rs` | `PascalCase` | `snake_case` | `snake_case` |

### Test Files

Mirror source file names with test suffix:

```
src/
├── user-service.ts
└── user-service.test.ts

# or

src/
├── user_service.py
└── test_user_service.py  # Python convention
```

---

## Git Conventions

### Branch Names

Use **type/description** format:

```
feature/add-evaluator-agent
bugfix/fix-context-overflow
docs/update-naming-conventions
refactor/simplify-orchestrator
chore/update-dependencies
```

**Types:**
- `feature/` - New functionality
- `bugfix/` - Bug fixes
- `docs/` - Documentation only
- `refactor/` - Code restructuring
- `chore/` - Maintenance tasks
- `experiment/` - Exploratory work

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

feat(agents): add uncertainty permissions to all agents
fix(orchestrator): handle context overflow gracefully
docs(learnings): add prompt engineering patterns
refactor(scaffold): simplify template structure
```

**Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### Tag Names

Use semantic versioning:

```
v0.1.0
v0.2.0-beta
v1.0.0
```

---

## Configuration Files

### Standard Names

Use conventional names when they exist:

```
.gitignore           # Git ignore patterns
.claude/             # Claude Code configuration
package.json         # Node.js project
pyproject.toml       # Python project
Makefile             # Build automation
Dockerfile           # Container definition
docker-compose.yml   # Container orchestration
```

### Custom Configuration

Use **.lowercase** or **lowercase.extension**:

```
.promptly.yml        # Promptly configuration
settings.json        # Project settings
config.toml          # General configuration
```

---

## Anti-Patterns to Avoid

| Avoid | Prefer | Reason |
|-------|--------|--------|
| `myAgent.md` | `my-agent.md` | Inconsistent casing |
| `README2.md` | `readme-v2.md` or context-specific name | Numeric suffixes are unclear |
| `temp.md`, `test.md` | Descriptive names | Non-descriptive |
| `agent_reviewer.md` | `reviewer.md` | Redundant prefix |
| `LEARNINGS_2026.md` | `learnings/2026-01-26-topic.md` | Use directories for organization |
| `newFeature.py` | `new_feature.py` | Follow language conventions |
| `src2/`, `old_agents/` | Use git branches | Version in VCS, not filenames |

---

## Quick Reference

| Item | Convention | Example |
|------|------------|---------|
| Directories | lowercase-kebab-case | `project-scaffold/` |
| Root docs | UPPER_SNAKE_CASE.md | `ARCHITECTURE.md` |
| Nested docs | lowercase-kebab-case.md | `agent-design.md` |
| Date files | YYYY-MM-DD-name.md | `2026-01-26-topic.md` |
| Agents | lowercase-kebab-case.md | `security-reviewer.md` |
| Scripts | lowercase-kebab-case.sh | `new-project.sh` |
| Branches | type/description | `feature/add-agent` |
| Commits | type(scope): msg | `feat(agents): add...` |
| Tags | vX.Y.Z | `v1.0.0` |

---

## Updating This Document

Update when:
- New file types are introduced
- Conventions prove problematic
- Team feedback suggests improvements

**Last reviewed**: 2026-01-26
