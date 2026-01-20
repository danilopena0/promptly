# Project Scaffold

A personal scaffolding system for agent-assisted development.

## Philosophy

Modern development is about creating optimal **systems** that produce good code, not about writing code directly. This scaffold provides the components of that system:

- **Templates** that encode good defaults
- **Checklists** that catch common errors  
- **Documentation** that survives context window limits
- **Principles** that constrain agent output

## Contents

```
project-scaffold/
├── README.md                    # This file
├── SYSTEMS_THINKING_GUIDE.md    # The conceptual framework
├── PRINCIPLES_REFERENCE.md      # Software principles quick reference
├── SESSION_CHECKLIST.md         # Per-session workflow checklist
├── new-project.sh               # Bootstrap script for new projects
└── templates/
    ├── CLAUDE.md                # AI development context template
    └── ARCHITECTURE.md          # System documentation template
```

## Quick Start

### 1. Set up the scaffold

```bash
# Clone or copy this directory to your home folder
cp -r project-scaffold ~/project-scaffold

# Make the script executable
chmod +x ~/project-scaffold/new-project.sh

# Optional: Add to PATH for easy access
echo 'export PATH="$HOME/project-scaffold:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 2. Create a new project

```bash
# Basic usage
./new-project.sh my-project

# With project type
./new-project.sh canopy ml-pipeline
./new-project.sh my-api api-service
./new-project.sh data-etl data-tool
./new-project.sh portfolio-site web-app
```

### 3. Customize for your project

After creation:
1. Open `CLAUDE.md` and fill in the project-specific sections
2. Update `ARCHITECTURE.md` as you design the system
3. Review `README.md` and add project description

## Project Types

| Type | Structure | Use Case |
|------|-----------|----------|
| `ml-pipeline` | src/{data,features,models,evaluation}, notebooks/ | ML/AI projects |
| `api-service` | src/{routes,services,models,utils} | Backend APIs |
| `data-tool` | src/{extractors,transformers,loaders} | ETL, data processing |
| `web-app` | src/{components,pages,utils,hooks} | Frontend applications |
| `general` | src/, tests/, docs/ | Anything else |

## Workflow Integration

### Before starting work
1. Review `SESSION_CHECKLIST.md`
2. Define acceptance criteria
3. Load `CLAUDE.md` into context

### During development
- Keep `PRINCIPLES_REFERENCE.md` visible
- Work in bounded chunks
- Run checks after each generation

### End of session
- Update `CLAUDE.md` with any architectural changes
- Commit with meaningful message
- Note any WIP for next session

## Customization

### Adjusting templates
Edit files in `templates/` to match your preferences:
- Add your common dependencies
- Adjust code style preferences
- Include team-specific patterns

### Adding project types
Edit `new-project.sh` to add new project type cases with appropriate directory structures.

### Personal preferences
Consider adding to templates:
- Your preferred testing framework setup
- Common CI/CD configurations
- Team-specific documentation sections

## Key Documents

### CLAUDE.md
The most important file. This provides context to the AI assistant that persists across context window resets. Keep it updated as your project evolves.

### ARCHITECTURE.md  
System-level documentation. When the codebase gets large and exceeds context windows, this compressed view of the system becomes critical.

### SYSTEMS_THINKING_GUIDE.md
The conceptual framework behind this approach. Read it once to understand the philosophy, reference it when designing your workflows.

## Philosophy Notes

### Why documentation matters more now
Context windows have limits. When the full codebase doesn't fit, your documentation is what survives. It's not bureaucratic overhead—it's essential system memory.

### Why principles matter more now
Agents can generate any pattern. Without constraints, you get "works but weird" code. Principles are the guardrails that shape output toward maintainable solutions.

### Why process matters more now
The bottleneck has moved from writing to verifying. A good process catches agent errors systematically rather than hoping you notice them.

---

*Built from conversations about systems thinking in agent-assisted development.*
