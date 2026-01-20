# Claude Code Agents

A collection of specialized agents for software development workflows.

## Installation

Copy the `agents/` directory to your project's `.claude/agents/` folder:

```bash
cp -r agents/ /path/to/your/project/.claude/agents/
```

Or for global availability, copy to `~/.claude/agents/`.

## Available agents

| Agent | Purpose | Tools |
|-------|---------|-------|
| **orchestrator** | Plans multi-agent workflows | Read-only |
| **explorer** | Investigates existing code | Read-only |
| **architect** | Designs implementation plans | Read-only |
| **implementer** | Writes production code | Read/Write/Bash |
| **tester** | Creates tests | Read/Write/Bash |
| **reviewer** | Reviews code for issues | Read-only |
| **principles-enforcer** | Checks SOLID, DRY, clean code | Read-only |
| **optimizer** | Performance tuning | Read/Write/Bash |
| **documenter** | Writes documentation | Read/Write |

## Usage

### Let Claude decide

Just describe your task and Claude will invoke appropriate agents:

```
Add a position sizing module to the backtesting engine with Kelly criterion support
```

Claude will recognize this needs architect → implementer → tester → reviewer.

### Explicit invocation

Request specific agents:

```
Use the explorer agent to explain how the job scraper handles pagination
```

```
Have the principles-enforcer review the trading engine module
```

### Using the orchestrator

For complex tasks, start with the orchestrator:

```
Use the orchestrator to plan out how to add user authentication to the API
```

The orchestrator will analyze the task and create an execution plan with checkpoints.

### Chaining agents

```
Use the code-reviewer to find issues, then use the implementer to fix them
```

### Parallel execution

```
Run the reviewer and principles-enforcer in parallel on the src/engine/ directory
```

## Workflow examples

### New feature (standard)
```
1. "Use explorer to understand the current data pipeline"
2. [Review findings]
3. "Use architect to plan adding the new filter feature"
4. [Approve plan]
5. "Use implementer to build it following the plan"
6. "Use tester to write tests for the new feature"
7. "Have reviewer and principles-enforcer check the changes"
8. "Use documenter to update the README"
```

### Quick bug fix
```
1. "Use explorer to find why the API returns 500 on empty input"
2. "Use tester to write a failing test for this case"
3. "Use implementer to fix it"
```

### Code quality audit
```
1. "Use principles-enforcer to analyze the entire src/ directory"
2. "Use architect to prioritize the refactoring recommendations"
```

## Customization

### Modifying agents

Edit the markdown files to:
- Add project-specific context
- Change tool permissions
- Adjust output formats
- Add domain-specific checks

### Creating new agents

1. Create a new `.md` file in `.claude/agents/`
2. Add YAML frontmatter with `name`, `description`, and `tools`
3. Write the system prompt with clear instructions

Example:
```markdown
---
name: security-auditor
description: Reviews code for security vulnerabilities. Use before deploying to production.
tools: Read, Grep, Glob
---

You are a security expert reviewing code for vulnerabilities...
```

## Tech stack context

These agents are configured for:
- **Python**: Polars, NumPy, Numba, DuckDB
- **APIs**: Litestar
- **Database**: SQLite with sqlite-vec
- **Frontend**: React + Vite
- **LLM**: Perplexity API

Modify the agent files if your stack differs.

## Tips

1. **Start with explorer** for non-trivial tasks to build shared understanding
2. **Use checkpoints** in complex workflows to review before proceeding
3. **Run reviewers in parallel** to save time
4. **Use orchestrator** when you're not sure which agents to use
5. **Keep context focused** - invoke fresh agents for distinct tasks rather than continuing long sessions
