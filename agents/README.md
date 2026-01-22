# Claude Code Agents

A collection of specialized agents for software development workflows.

## Installation

Copy the `agents/` directory to your project's `.claude/agents/` folder:

```bash
cp -r agents/ /path/to/your/project/.claude/agents/
```

Or for global availability, copy to `~/.claude/agents/`.

## Available agents

| Agent | Purpose | Tools | Model Tier |
|-------|---------|-------|------------|
| **orchestrator** | Plans multi-agent workflows | Read-only | Opus |
| **explorer** | Investigates existing code | Read-only | Haiku |
| **architect** | Designs implementation plans | Read-only | Opus |
| **implementer** | Writes production code | Read/Write/Bash | Sonnet |
| **tester** | Creates tests | Read/Write/Bash | Sonnet |
| **reviewer** | Reviews code for issues | Read-only | Sonnet |
| **principles-enforcer** | Checks SOLID, DRY, clean code | Read-only | Sonnet |
| **optimizer** | Performance tuning | Read/Write/Bash | Sonnet |
| **documenter** | Writes documentation | Read/Write | Sonnet |
| **evaluator** | LLM-as-judge quality assessment | Read-only | Sonnet |
| **security-reviewer** | OWASP security review | Read-only | Sonnet |
| **debugger** | Investigates failures | Read-only | Sonnet |
| **recovery** | Plans recovery from failures | Read-only | Sonnet |

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
3. **Run reviewers in parallel** to save time (reviewer + security-reviewer + principles-enforcer)
4. **Use orchestrator** when you're not sure which agents to use
5. **Keep context focused** - invoke fresh agents for distinct tasks rather than continuing long sessions
6. **Use evaluator** before marking work complete to ensure quality
7. **Use debugger and recovery** when things go wrong instead of improvising
8. **Track progress** in SESSION_LOG.md for complex multi-session tasks

## Cost Optimization

Agents have recommended model tiers to balance cost and capability:

- **Opus** (expensive): Complex reasoning - orchestrator, architect
- **Sonnet** (balanced): Standard tasks - implementer, tester, reviewer, etc.
- **Haiku** (cheap): Simple/frequent tasks - explorer

Use the Plan-and-Execute pattern: plan with Opus, execute with Sonnet/Haiku.

## Error Recovery

When an agent fails or produces unexpected output:

1. **STOP** - Don't proceed with dependent tasks
2. **Assess** - Use debugger agent to investigate
3. **Recover** - Use recovery agent to plan next steps
4. **Document** - Log in SESSION_LOG.md for future reference

## Claude 4.x Features

All agents include Claude 4.x guidelines:
- **Express uncertainty**: Say "I'm not certain" rather than guessing
- **Incremental progress**: Complete one step at a time
- **Context awareness**: Track remaining context, suggest session breaks
