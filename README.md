# Promptly

A collection of prompts, agents, and scaffolding templates for AI-assisted software development with Claude Code.

## Quick Start

### Option A: New Project (Recommended)

```bash
# Clone promptly
git clone <this-repo> promptly

# Bootstrap a new project
cd promptly/project-scaffold
./new-project.sh my-project web-app

# Start working
cd ~/projects/my-project
claude
```

### Option B: Existing Project

```bash
# Clone promptly
git clone <this-repo> promptly

# Copy agents to your project
cp -r promptly/agents/ /path/to/your-project/.claude/agents/

# Copy documentation templates
cp promptly/project-scaffold/templates/CLAUDE.md /path/to/your-project/
cp promptly/project-scaffold/templates/SESSION_LOG.md /path/to/your-project/

# Start working
cd /path/to/your-project
claude
```

---

## Integration Guide

### Step 1: Install Agents

Agents can be installed locally (per-project) or globally (all projects).

**Local install** (recommended for team projects):
```bash
mkdir -p /path/to/your-project/.claude/agents
cp -r promptly/agents/*.md /path/to/your-project/.claude/agents/
```

**Global install** (for personal use):
```bash
mkdir -p ~/.claude/agents
cp -r promptly/agents/*.md ~/.claude/agents/
```

### Step 2: Add Documentation Templates

Copy the essential templates to your project root:

```bash
cd /path/to/your-project

# Required: AI context file (customize this!)
cp promptly/project-scaffold/templates/CLAUDE.md .

# Required: Architecture documentation
cp promptly/project-scaffold/templates/ARCHITECTURE.md .

# Optional: Session tracking for complex tasks
cp promptly/project-scaffold/templates/SESSION_LOG.md .
```

### Step 3: Customize CLAUDE.md

Edit `CLAUDE.md` to describe YOUR project:

```markdown
# Project: [Your Project Name]

## Overview
[What does this project do?]

## Tech Stack
- Language: [e.g., Python 3.11]
- Framework: [e.g., Litestar]
- Database: [e.g., SQLite]

## Key Directories
- `src/` - Main source code
- `tests/` - Test files
- `docs/` - Documentation

## Development Commands
- `make test` - Run tests
- `make lint` - Run linter
- `make run` - Start dev server

## Important Patterns
[Describe patterns Claude should follow]

## Known Gotchas
[Things that might trip up an AI assistant]
```

### Step 4: Customize ARCHITECTURE.md

Document your system architecture:

```markdown
# Architecture

## System Overview
[High-level description]

## Components
[List major components and their responsibilities]

## Data Flow
[How data moves through the system]

## External Dependencies
[APIs, databases, services]
```

### Step 5: Verify Installation

Start Claude Code and verify agents are available:

```bash
cd /path/to/your-project
claude

# In Claude, try:
> Use the explorer agent to explain the project structure
```

If agents aren't recognized, check that `.claude/agents/` exists and contains the `.md` files.

---

## First Workflow: Adding a Feature

Here's how to use the agents for a typical feature:

### 1. Plan with Orchestrator

```
Use the orchestrator to plan adding [your feature]
```

The orchestrator will create an execution plan with phases and checkpoints.

### 2. Explore the Codebase

```
Use the explorer agent to investigate [relevant area]
```

### 3. Design the Implementation

```
Use the architect agent to design [the feature]
```

Review the plan, especially:
- Acceptance criteria
- Test specifications
- Implementation steps

### 4. Implement (TDD Style)

```
Use the tester agent to write failing tests for [feature]
```

Then:

```
Use the implementer agent to make the tests pass
```

### 5. Review

```
Run the reviewer, security-reviewer, and principles-enforcer in parallel on the changes
```

### 6. Evaluate

```
Use the evaluator agent to assess the implementation against the acceptance criteria
```

---

## Contents

### `/agents`
Specialized Claude Code agents for different development workflows:

| Agent | Purpose | Model Tier |
|-------|---------|------------|
| orchestrator | Plans multi-agent workflows | Opus |
| explorer | Investigates existing code | Haiku |
| architect | Designs implementation plans | Opus |
| implementer | Writes production code | Sonnet |
| tester | Creates tests | Sonnet |
| reviewer | Reviews code for issues | Sonnet |
| principles-enforcer | Checks SOLID, DRY, clean code | Sonnet |
| optimizer | Performance tuning | Sonnet |
| documenter | Writes documentation | Sonnet |
| evaluator | LLM-as-judge quality assessment | Sonnet |
| security-reviewer | OWASP security review | Sonnet |
| debugger | Investigates failures | Sonnet |
| recovery | Plans recovery from failures | Sonnet |

See [agents/README.md](agents/README.md) for detailed usage.

### `/project-scaffold`
A scaffolding system for bootstrapping new projects with AI-friendly documentation:

- `CLAUDE.md` template for AI context
- `ARCHITECTURE.md` template for system documentation
- `SESSION_LOG.md` template for observability
- `SESSION_CHECKLIST.md` for development workflow
- `PRINCIPLES_REFERENCE.md` for software principles
- `SYSTEMS_THINKING_GUIDE.md` for methodology
- `new-project.sh` bootstrap script

See [project-scaffold/README.md](project-scaffold/README.md) for details.

### Prompt Templates

- **mvp.md** - Repository initialization prompt generator for Claude Code
- **planning.md** - Prompts for careful plan review and revision

### Skill Guides

- **AI_ENGINEERING_SKILLS.md** - Comprehensive guide to working effectively with AI coding assistants:
  - Context Engineering (structuring information for AI)
  - Prompt Engineering (asking effectively)
  - Verification & Validation (trusting but verifying)
  - Debugging AI Output (when things go wrong)
  - Trust Calibration (when to verify vs trust)
  - Session Management (maintaining context)
  - Collaboration Patterns (AI as pair programmer)

### Methodology & Standards

- **[METHOD.md](METHOD.md)** - Development methodology and context engineering principles
  - Core philosophy: "Do the simplest thing that works"
  - Context engineering tips from [Anthropic's guide](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
  - Tool design principles
  - Long-horizon task strategies

- **[NAMING_CONVENTIONS.md](NAMING_CONVENTIONS.md)** - File and folder naming standards
  - Directory and file naming patterns
  - Git branch and commit conventions
  - Language-specific conventions
  - Anti-patterns to avoid

- **[ITERATION_WORKFLOW.md](ITERATION_WORKFLOW.md)** - Structured iteration cycle
  - Plan → Do → Capture → Checkpoint → Reflect
  - Learning capture templates
  - Periodic review checklists

### Knowledge Base

- **[LEARNINGS/](LEARNINGS/)** - Accumulated knowledge and patterns
  - [patterns/agent-design.md](LEARNINGS/patterns/agent-design.md) - Agent design patterns
  - [patterns/prompt-engineering.md](LEARNINGS/patterns/prompt-engineering.md) - Prompt engineering patterns
  - [patterns/workflow-patterns.md](LEARNINGS/patterns/workflow-patterns.md) - Workflow patterns

---

## Project Structure After Integration

Your project should look like this:

```
your-project/
├── .claude/
│   └── agents/
│       ├── orchestrator.md
│       ├── explorer.md
│       ├── architect.md
│       ├── implementer.md
│       ├── tester.md
│       ├── reviewer.md
│       ├── principles-enforcer.md
│       ├── optimizer.md
│       ├── documenter.md
│       ├── evaluator.md
│       ├── security-reviewer.md
│       ├── debugger.md
│       └── recovery.md
├── CLAUDE.md              # AI context (customize!)
├── ARCHITECTURE.md        # System docs (customize!)
├── SESSION_LOG.md         # Session tracking (optional)
├── src/
│   └── ...
├── tests/
│   └── ...
└── ...
```

---

## Customizing for Your Tech Stack

The default agents are configured for:
- **Python**: Polars, NumPy, Numba, DuckDB
- **APIs**: Litestar
- **Database**: SQLite with sqlite-vec
- **Frontend**: React + Vite

To customize for your stack, edit the agent files:

```bash
# Example: Change from Litestar to FastAPI
sed -i 's/Litestar/FastAPI/g' .claude/agents/*.md
```

Or manually edit the "Tech stack" sections in:
- `architect.md`
- `implementer.md`
- `tester.md`
- `optimizer.md`

---

## Tips for Success

1. **Keep CLAUDE.md updated** - This is your AI's memory across sessions
2. **Use SESSION_LOG.md for complex tasks** - Helps with recovery and handoffs
3. **Run reviewers in parallel** - Save time with `reviewer + security-reviewer + principles-enforcer`
4. **Use orchestrator when unsure** - Let it plan the workflow for you
5. **Commit at checkpoints** - Makes recovery easier if something goes wrong
6. **Evaluate before merging** - Use the evaluator agent for quality gates
7. **Capture learnings in real-time** - Document insights as they occur, not retrospectively
8. **Review methodology periodically** - Update METHOD.md and LEARNINGS/ every 3-5 iterations
9. **Follow naming conventions** - Consistent naming helps both humans and AI navigate the codebase

---

## Troubleshooting

### Agents not recognized

1. Check agents are in `.claude/agents/` (local) or `~/.claude/agents/` (global)
2. Verify files have `.md` extension
3. Restart Claude Code

### Agent produces unexpected output

1. Check CLAUDE.md has accurate project context
2. Be more specific in your request
3. Use the debugger agent to investigate

### Context seems lost mid-session

1. Save progress to SESSION_LOG.md
2. Explicitly reload context: "Read CLAUDE.md and SESSION_LOG.md"
3. For very long tasks, consider breaking into multiple sessions

---

## License

MIT
