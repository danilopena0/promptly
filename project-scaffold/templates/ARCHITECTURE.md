# Architecture

> System-level documentation that survives context window limits.
> Update this when components change or new patterns emerge.

## System Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      [PROJECT_NAME]                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   [Component A]  ──────►  [Component B]  ──────►  [Output]  │
│        │                       │                            │
│        ▼                       ▼                            │
│   [Data Store]            [External Service]                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Components

### [Component Name]
**Purpose:** One sentence description
**Location:** `src/component_name/`
**Interface:**
- Input: [what it accepts]
- Output: [what it returns]
- Side effects: [if any]

**Key files:**
- `main_file.py` - [what it does]
- `helpers.py` - [what it does]

**Dependencies:** [other components it relies on]

### [Next Component]
...

## Data Flow

1. [Entry point]: User/system triggers [action]
2. [Step]: Data flows to [component] which [transformation]
3. [Step]: Result goes to [next component]
4. [Exit point]: Final output is [what]

## External Dependencies

| Dependency | Purpose | Version | Notes |
|------------|---------|---------|-------|
| [library] | [why we use it] | [version] | [any gotchas] |

## Configuration

### Environment Variables
| Variable | Purpose | Required | Default |
|----------|---------|----------|---------|
| `VAR_NAME` | [what it controls] | Yes/No | [default] |

### Config Files
- `.env` - Local environment (not committed)
- `config/settings.py` - Application defaults

## Integration Points

### APIs Consumed
- [Service]: [endpoint], [purpose], [auth method]

### APIs Exposed
- [Endpoint]: [method], [purpose], [request/response format]

## Error Handling Strategy

- **Validation errors**: Raised at boundaries, fail fast
- **External service errors**: Retry with backoff, then graceful degradation
- **Data errors**: Log, skip record, continue processing (or fail depending on severity)

## Performance Considerations

- **Bottleneck:** [where things slow down]
- **Mitigation:** [how we handle it]
- **Scaling path:** [what we'd do if volume increased 10x]

## Security Notes

- [Sensitive data handling approach]
- [Auth/authz model]
- [What NOT to log]

## Future Considerations

<!-- Things we know we'll need but aren't building yet -->
- [ ] [Future need]: [rough approach]
