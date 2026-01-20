# Promptly

A collection of prompts, agents, and scaffolding templates for AI-assisted software development with Claude Code.

## Contents

### `/agents`
Specialized Claude Code agents for different development workflows:

| Agent | Purpose |
|-------|---------|
| orchestrator | Plans multi-agent workflows |
| explorer | Investigates existing code |
| architect | Designs implementation plans |
| implementer | Writes production code |
| tester | Creates tests |
| reviewer | Reviews code for issues |
| principles-enforcer | Checks SOLID, DRY, clean code |
| optimizer | Performance tuning |
| documenter | Writes documentation |

See [agents/README.md](agents/README.md) for installation and usage.

### `/project-scaffold`
A scaffolding system for bootstrapping new projects with AI-friendly documentation:

- `CLAUDE.md` template for AI context
- `ARCHITECTURE.md` template for system documentation
- `SESSION_CHECKLIST.md` for development workflow
- `PRINCIPLES_REFERENCE.md` for software principles
- `new-project.sh` bootstrap script

See [project-scaffold/README.md](project-scaffold/README.md) for details.

### Prompt Templates

- **mvp.md** - Repository initialization prompt generator for Claude Code
- **planning.md** - Prompts for careful plan review and revision

## Usage

1. Copy agents to your project's `.claude/agents/` folder or `~/.claude/agents/` for global access
2. Use the project scaffold to bootstrap new projects with proper documentation
3. Reference the prompt templates when starting new projects with Claude Code

## License

MIT
