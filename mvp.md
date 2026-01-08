# Claude Code Repository Initialization Prompt Generator

## Input Questions

### 1. Project Basics
- **Project Name**: [Your project name]
- **Primary Language/Framework**: [e.g., Python, React, Next.js, Django]
- **Project Type**: [e.g., web app, API, CLI tool, library, mobile app]

### 2. Core Functionality
**In 2-3 sentences, describe what your application does:**
[Your description here]

### 3. Key Features
**List the 3-5 most important features:**
1. [Feature 1]
2. [Feature 2]
3. [Feature 3]
4. [Feature 4 - optional]
5. [Feature 5 - optional]

### 4. Technical Requirements
**Select all that apply:**
- [ ] Database (specify: PostgreSQL, MongoDB, SQLite, etc.)
- [ ] Authentication/Authorization
- [ ] API integration (specify which APIs)
- [ ] File uploads/storage
- [ ] Real-time features (WebSockets, SSE)
- [ ] Background jobs/queues
- [ ] Testing framework
- [ ] CI/CD pipeline
- [ ] Docker/containerization
- [ ] Other: [specify]

### 5. Development Preferences
- **Code Style**: [e.g., TypeScript strict mode, Python type hints, specific linter rules]
- **Architecture**: [e.g., MVC, microservices, monolithic, serverless]
- **Testing**: [e.g., unit tests required, integration tests, E2E tests]

### 6. Constraints or Special Considerations
[Any specific requirements, limitations, or preferences]

---

## Generated Prompt Template

Once you've filled in the questions above, use this template to create your Claude Code prompt:

```
Create a new [PROJECT_TYPE] called [PROJECT_NAME] using [PRIMARY_LANGUAGE/FRAMEWORK].

## Project Overview
[CORE_FUNCTIONALITY_DESCRIPTION]

## Core Features
Implement the following features:
1. [FEATURE_1]
2. [FEATURE_2]
3. [FEATURE_3]
[Add remaining features if applicable]

## Technical Stack
- Primary: [PRIMARY_LANGUAGE/FRAMEWORK]
[For each selected technical requirement, add a bullet point]
- Database: [DATABASE_TYPE] for persistent storage
- Authentication: Implement secure user authentication using [AUTH_METHOD]
- [Continue for each requirement...]

## Project Structure
Set up a professional project structure with:
- Clear separation of concerns
- Proper configuration management
- Environment variable handling
- Comprehensive .gitignore

## Code Quality Standards
- [CODE_STYLE_PREFERENCES]
- [ARCHITECTURE_PREFERENCES]
- [TESTING_REQUIREMENTS]
- Include inline documentation for complex logic
- Follow [LANGUAGE]-specific best practices

## Development Setup
Include:
- README.md with setup instructions
- requirements.txt / package.json with all dependencies
- Development environment configuration
- [If Docker selected: Docker setup for local development]

## Special Requirements
[CONSTRAINTS_OR_SPECIAL_CONSIDERATIONS]

## Deliverables
1. Fully initialized repository with proper structure
2. Working skeleton with core features outlined
3. Basic tests for critical functionality
4. Documentation for getting started

Please create the repository structure, implement the core features, and ensure everything is ready for development.
```

---

## Example: Todo API

### Filled Input
- **Project Name**: todo-api
- **Primary Language/Framework**: Python/FastAPI
- **Project Type**: REST API
- **Core Functionality**: A RESTful API for managing todo items with user authentication, allowing users to create, read, update, and delete their personal todo lists.
- **Key Features**:
  1. User registration and JWT authentication
  2. CRUD operations for todo items
  3. Todo categorization with tags
  4. Search and filtering capabilities
  5. Rate limiting and API documentation
- **Technical Requirements**: 
  - ✓ Database (PostgreSQL)
  - ✓ Authentication/Authorization
  - ✓ Testing framework
  - ✓ Docker/containerization
- **Code Style**: Python type hints, Black formatting, strict linting with Ruff
- **Architecture**: Clean architecture with repository pattern
- **Testing**: Unit tests required, integration tests for API endpoints

### Generated Prompt
```
Create a new REST API called todo-api using Python/FastAPI.

## Project Overview
A RESTful API for managing todo items with user authentication, allowing users to create, read, update, and delete their personal todo lists.

## Core Features
Implement the following features:
1. User registration and JWT authentication
2. CRUD operations for todo items
3. Todo categorization with tags
4. Search and filtering capabilities
5. Rate limiting and API documentation

## Technical Stack
- Primary: Python 3.11+ with FastAPI
- Database: PostgreSQL for persistent storage with SQLAlchemy ORM
- Authentication: JWT-based authentication with password hashing
- Testing: pytest with coverage reporting
- API Documentation: Auto-generated OpenAPI/Swagger docs
- Containerization: Docker and docker-compose for development

## Project Structure
Set up a professional project structure with:
- Clear separation of concerns (routes, services, repositories, models)
- Proper configuration management using pydantic-settings
- Environment variable handling with .env files
- Comprehensive .gitignore for Python projects
- Alembic for database migrations

## Code Quality Standards
- Use Python type hints throughout
- Format code with Black
- Lint with Ruff (strict mode)
- Follow clean architecture principles with repository pattern
- Include unit tests for business logic and integration tests for API endpoints
- Include inline documentation for complex logic
- Follow PEP 8 and FastAPI best practices

## Development Setup
Include:
- README.md with setup instructions and API documentation
- requirements.txt with all dependencies pinned
- Development environment configuration
- Docker setup with multi-stage builds for local development
- docker-compose.yml for running the full stack locally

## Special Requirements
- Implement rate limiting to prevent API abuse
- Use dependency injection for testability
- Ensure all endpoints return consistent error responses
- Include request/response validation with Pydantic models

## Deliverables
1. Fully initialized repository with proper structure
2. Working skeleton with all core features implemented
3. Comprehensive test suite with >80% coverage
4. Documentation for getting started and API usage

Please create the repository structure, implement the core features, and ensure everything is ready for development.
```

---

## Tips for Success

1. **Be Specific**: The more detail you provide, the better Claude Code can understand your needs
2. **Prioritize Features**: List features in order of importance
3. **Include Examples**: If you have specific patterns or examples in mind, mention them
4. **Specify Constraints**: Be upfront about limitations (budget, timeline, tech stack restrictions)
5. **Iterate**: Start with core features, then add complexity in follow-up prompts
6. **Review Generated Code**: Always review the initial structure and provide feedback

## Common Pitfalls to Avoid

- ❌ Being too vague: "Create a website" 
- ✅ Being specific: "Create a Next.js blog with MDX support and dark mode"

- ❌ Listing every possible feature
- ✅ Focusing on MVP features first

- ❌ Forgetting about testing and documentation
- ✅ Explicitly requesting tests and docs

- ❌ Not mentioning technical preferences
- ✅ Specifying code style, architecture patterns, and tooling
