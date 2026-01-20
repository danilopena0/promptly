#!/bin/bash
# new-project.sh - Bootstrap a new project with scaffolding
#
# Usage: ./new-project.sh <project-name> [project-type]
# Example: ./new-project.sh canopy ml-pipeline
#
# Project types: ml-pipeline, web-app, data-tool, api-service, general

set -e

# Configuration - update these paths to match your system
SCAFFOLD_DIR="$HOME/project-scaffold"
PROJECTS_DIR="$HOME/projects"  # Where new projects are created

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Validate arguments
if [ -z "$1" ]; then
    echo -e "${RED}Error: Project name required${NC}"
    echo "Usage: ./new-project.sh <project-name> [project-type]"
    exit 1
fi

PROJECT_NAME="$1"
PROJECT_TYPE="${2:-general}"
PROJECT_PATH="$PROJECTS_DIR/$PROJECT_NAME"

# Check if project already exists
if [ -d "$PROJECT_PATH" ]; then
    echo -e "${RED}Error: Project '$PROJECT_NAME' already exists at $PROJECT_PATH${NC}"
    exit 1
fi

echo -e "${GREEN}Creating project: $PROJECT_NAME${NC}"
echo "Type: $PROJECT_TYPE"
echo "Location: $PROJECT_PATH"
echo ""

# Create project directory
mkdir -p "$PROJECT_PATH"
cd "$PROJECT_PATH"

# Copy template files
echo "Copying templates..."
cp "$SCAFFOLD_DIR/templates/CLAUDE.md" .
cp "$SCAFFOLD_DIR/templates/ARCHITECTURE.md" .

# Replace placeholders in CLAUDE.md
sed -i "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" CLAUDE.md
sed -i "s/\[ml-pipeline | web-app | data-tool | api-service | other\]/$PROJECT_TYPE/g" CLAUDE.md

# Replace placeholder in ARCHITECTURE.md
sed -i "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" ARCHITECTURE.md

# Create directory structure based on project type
echo "Creating directory structure..."

case "$PROJECT_TYPE" in
    ml-pipeline)
        mkdir -p src/{data,features,models,evaluation}
        mkdir -p tests/{unit,integration}
        mkdir -p notebooks
        mkdir -p data/{raw,processed,outputs}
        mkdir -p configs
        touch src/__init__.py
        touch src/data/__init__.py
        touch src/features/__init__.py
        touch src/models/__init__.py
        touch src/evaluation/__init__.py
        echo "# Data directory - not committed" > data/.gitkeep
        ;;
    web-app)
        mkdir -p src/{components,pages,utils,hooks}
        mkdir -p tests
        mkdir -p public
        mkdir -p styles
        ;;
    api-service)
        mkdir -p src/{routes,services,models,utils}
        mkdir -p tests/{unit,integration}
        mkdir -p configs
        touch src/__init__.py
        ;;
    data-tool)
        mkdir -p src/{extractors,transformers,loaders,utils}
        mkdir -p tests
        mkdir -p data/{input,output}
        mkdir -p configs
        touch src/__init__.py
        ;;
    *)
        mkdir -p src
        mkdir -p tests
        mkdir -p docs
        ;;
esac

# Create .gitignore
echo "Creating .gitignore..."
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
.Python
venv/
.venv/
ENV/
.eggs/
*.egg-info/
dist/
build/

# Data
data/raw/
data/processed/
*.csv
*.parquet
*.pkl
*.joblib

# Environment
.env
.env.local
*.local

# IDE
.idea/
.vscode/
*.swp
*.swo
.DS_Store

# Testing
.pytest_cache/
.coverage
htmlcov/
.tox/

# Notebooks
.ipynb_checkpoints/

# Models
*.h5
*.pt
*.pth
*.ckpt
models/*.pkl

# Logs
logs/
*.log

# Node (if applicable)
node_modules/
EOF

# Create README.md
echo "Creating README.md..."
cat > README.md << EOF
# $PROJECT_NAME

> [One-line description]

## Quick Start

\`\`\`bash
# Setup
[setup commands]

# Run
[run commands]
\`\`\`

## Overview

[What this project does and why]

## Development

See [CLAUDE.md](CLAUDE.md) for AI-assisted development guidelines.
See [ARCHITECTURE.md](ARCHITECTURE.md) for system design documentation.

## License

[License info]
EOF

# Create basic Python setup files for Python projects
if [[ "$PROJECT_TYPE" == "ml-pipeline" || "$PROJECT_TYPE" == "api-service" || "$PROJECT_TYPE" == "data-tool" ]]; then
    echo "Creating Python configuration..."
    
    # pyproject.toml
    cat > pyproject.toml << EOF
[project]
name = "$PROJECT_NAME"
version = "0.1.0"
description = ""
requires-python = ">=3.10"
dependencies = []

[project.optional-dependencies]
dev = [
    "pytest>=7.0",
    "pytest-cov",
    "ruff",
    "mypy",
    "pre-commit",
]

[tool.ruff]
line-length = 88
target-version = "py310"

[tool.ruff.lint]
select = ["E", "F", "I", "N", "W", "UP"]

[tool.mypy]
python_version = "3.10"
warn_return_any = true
warn_unused_ignores = true
disallow_untyped_defs = true

[tool.pytest.ini_options]
testpaths = ["tests"]
addopts = "-v --tb=short"
EOF

    # Pre-commit config
    cat > .pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.6
    hooks:
      - id: ruff
        args: [--fix]
      - id: ruff-format

  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v1.7.1
    hooks:
      - id: mypy
        additional_dependencies: []

  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files
EOF
fi

# Create Makefile for common commands
echo "Creating Makefile..."
cat > Makefile << 'EOF'
.PHONY: setup test lint format clean

setup:
	python -m venv .venv
	. .venv/bin/activate && pip install -e ".[dev]"
	. .venv/bin/activate && pre-commit install

test:
	pytest tests/ -v

test-cov:
	pytest tests/ --cov=src --cov-report=html

lint:
	ruff check src/ tests/
	mypy src/

format:
	ruff format src/ tests/
	ruff check --fix src/ tests/

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -rf .pytest_cache .mypy_cache .ruff_cache htmlcov .coverage
EOF

# Initialize git
echo "Initializing git repository..."
git init
git add .
git commit -m "Initial project setup from scaffold"

# Summary
echo ""
echo -e "${GREEN}✓ Project '$PROJECT_NAME' created successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. cd $PROJECT_PATH"
echo "  2. Review and customize CLAUDE.md"
echo "  3. Update README.md with project description"
echo "  4. Run 'make setup' to create virtual environment"
echo ""
echo -e "${YELLOW}Remember: Update CLAUDE.md as your project evolves!${NC}"
EOF
