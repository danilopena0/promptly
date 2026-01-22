# AI Engineering Best Practices Plan for Promptly

## Executive Summary

Your Promptly framework is **well-architected** and aligns with many 2026 AI engineering best practices. This plan identifies areas where you're ahead of the curve and specific improvements to bring the framework to the cutting edge.

---

## What You're Doing Well ✓

### 1. Multi-Agent Architecture
Your 10-agent system (orchestrator, explorer, architect, implementer, tester, reviewer, principles-enforcer, optimizer, documenter) mirrors the industry shift toward specialized agent teams. Per [LangChain's State of Agent Engineering](https://www.langchain.com/state-of-agent-engineering), multi-agent inquiries surged 1,445% in 2025.

### 2. Context Persistence Strategy
Your CLAUDE.md and ARCHITECTURE.md approach directly addresses context window limitations—a critical concern for long-running agents. This aligns with [Anthropic's guidance on effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents).

### 3. Human-in-the-Loop Checkpoints
The orchestrator's checkpoints for human review reflect best practices—[59.8% of organizations](https://www.langchain.com/state-of-agent-engineering) rely on human review for high-stakes decisions.

### 4. Read-Only vs Write Separation
Your tool permission model (explorer/reviewer = read-only, implementer = write) follows principle of least privilege.

### 5. Explicit Principles Enforcement
The principles-enforcer agent and PRINCIPLES_REFERENCE.md codify architectural constraints, reducing "works but weird" outcomes.

---

## Improvement Areas & Recommendations

### Area 1: Claude 4.x Specific Optimizations

**Gap:** Your agent prompts don't leverage Claude 4.x-specific capabilities.

**Recommendations:**

1. **Add explicit uncertainty permissions** to agent prompts:
   ```markdown
   You may express uncertainty rather than guessing. Say "I'm not certain" when appropriate.
   ```
   This reduces hallucinations per [Anthropic's prompting best practices](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/claude-4-best-practices).

2. **Enable context awareness** in long-running workflows:
   ```markdown
   You have context awareness enabled. Track your remaining context window and manage work accordingly.
   ```

3. **Add incremental progress instructions** for complex tasks:
   ```markdown
   Focus on making steady advances on a few things at a time rather than attempting everything at once.
   ```

### Area 2: Observability & Tracing

**Gap:** No observability infrastructure mentioned.

**Recommendations:**

1. **Add a `SESSION_LOG.md` template** for tracing agent decisions:
   ```markdown
   ## Session Log - [DATE]

   ### Agent Invocations
   | Timestamp | Agent | Input Summary | Output Summary | Tokens |
   |-----------|-------|---------------|----------------|--------|

   ### Decision Points
   - [ ] Decision made: ...
   - [ ] Rationale: ...
   ```

2. **Create a `debug-agent.md`** specialized for investigating failures:
   ```yaml
   name: debugger
   description: Investigates agent failures and unexpected outputs
   tools: [Read]
   ```

3. **Consider integration hooks** for LangSmith, Weights & Biases, or similar observability platforms.

### Area 3: Cost Optimization Strategies

**Gap:** No model routing or cost optimization patterns.

**Recommendations:**

1. **Add model tier annotations** to agents:
   ```yaml
   # In agent frontmatter
   recommended_model: opus    # Complex reasoning (architect, orchestrator)
   recommended_model: sonnet  # Standard tasks (implementer, tester)
   recommended_model: haiku   # High-frequency (explorer, quick checks)
   ```

2. **Document the Plan-and-Execute pattern** in SYSTEMS_THINKING_GUIDE.md:
   - Use Opus for planning, Sonnet/Haiku for execution
   - Can reduce costs by 90% per [industry benchmarks](https://thenewstack.io/5-key-trends-shaping-agentic-development-in-2026/)

3. **Add caching guidance** for common operations:
   - Cache exploration results in SESSION_LOG.md
   - Reuse architectural decisions across sessions

### Area 4: Evaluation & Quality Gates

**Gap:** No formal evaluation framework for agent outputs.

**Recommendations:**

1. **Create an `evaluator-agent.md`**:
   ```yaml
   name: evaluator
   description: Assesses quality of agent outputs using LLM-as-judge
   tools: [Read]
   ```

   Core evaluation criteria:
   - Correctness (does it work?)
   - Completeness (did it address all requirements?)
   - Consistency (does it match existing patterns?)
   - Clarity (is it readable/maintainable?)

2. **Add acceptance criteria templates** to architect output:
   ```markdown
   ## Acceptance Criteria
   - [ ] Unit tests pass
   - [ ] Integration tests pass
   - [ ] No new linting errors
   - [ ] Documentation updated
   - [ ] Reviewer agent approval
   ```

3. **Implement a reviewer scoring rubric**:
   ```markdown
   Score 1-5 on:
   - Security (no vulnerabilities)
   - Performance (no obvious bottlenecks)
   - Maintainability (readable, documented)
   - Correctness (logic is sound)
   ```

### Area 5: Parallel Agent Workflows

**Gap:** Agents currently run sequentially; no parallel execution patterns.

**Recommendations:**

1. **Document parallel-safe combinations** in orchestrator:
   ```markdown
   ## Parallel Execution Patterns

   ### Safe to parallelize:
   - explorer + architect (both read-only)
   - tester + reviewer (different concerns)
   - documenter + optimizer (different files)

   ### Must be sequential:
   - architect → implementer (dependency)
   - implementer → tester (dependency)
   ```

2. **Add fork-join patterns** to orchestrator vocabulary:
   ```markdown
   PARALLEL:
     - [explorer]: Investigate authentication module
     - [explorer]: Investigate database schema
   JOIN → architect: Design based on both explorations
   ```

### Area 6: Error Handling & Recovery

**Gap:** No explicit error recovery patterns.

**Recommendations:**

1. **Add retry strategies** to agent definitions:
   ```markdown
   ## On Failure
   - If blocked by missing context: Request specific file/information
   - If blocked by ambiguity: Escalate to human with specific questions
   - If technical error: Log details and suggest manual intervention
   ```

2. **Create a `recovery-agent.md`**:
   ```yaml
   name: recovery
   description: Analyzes failed agent runs and proposes recovery strategies
   tools: [Read]
   ```

3. **Document rollback procedures** in SESSION_CHECKLIST.md:
   ```markdown
   ## If Something Goes Wrong
   1. Check git diff for unintended changes
   2. Run `git stash` to preserve current state
   3. Investigate with debugger agent
   4. Either: fix forward or `git stash drop && git checkout .`
   ```

### Area 7: Testing Strategy Enhancements

**Gap:** Tester agent exists but no test-first workflow enforcement.

**Recommendations:**

1. **Add TDD workflow to architect**:
   ```markdown
   ## Output Format
   1. Acceptance criteria
   2. Test specifications (BEFORE implementation plan)
   3. Implementation plan
   ```

2. **Enhance tester agent** with mutation testing awareness:
   ```markdown
   After writing tests, consider:
   - What mutations would tests catch?
   - What edge cases are missing?
   - Are tests testing behavior, not implementation?
   ```

3. **Add test coverage gates** to reviewer:
   ```markdown
   ## Review Checklist
   - [ ] New code has corresponding tests
   - [ ] Tests cover happy path AND error cases
   - [ ] No tests testing implementation details
   ```

### Area 8: Security-First Patterns

**Gap:** Limited security guidance beyond principles-enforcer.

**Recommendations:**

1. **Add OWASP awareness** to implementer agent:
   ```markdown
   ## Security Checklist (Auto-verify)
   - [ ] No hardcoded secrets
   - [ ] Input validation at boundaries
   - [ ] Parameterized queries (no SQL injection)
   - [ ] Output encoding (no XSS)
   - [ ] Authentication/authorization checks
   ```

2. **Create `security-reviewer.md`** agent:
   ```yaml
   name: security-reviewer
   description: Specialized security review using OWASP Top 10
   tools: [Read]
   ```

3. **Add secrets detection** to reviewer:
   ```markdown
   Flag any of: API keys, passwords, tokens, credentials in code
   ```

---

## Implementation Priority

### Phase 1: Quick Wins (Low effort, high impact)
1. Add uncertainty permissions to all agents
2. Add model tier annotations
3. Add security checklist to implementer
4. Document parallel-safe agent combinations

### Phase 2: Infrastructure (Medium effort)
1. Create SESSION_LOG.md template
2. Create evaluator agent
3. Create security-reviewer agent
4. Add error recovery patterns to agents

### Phase 3: Advanced (Higher effort)
1. Implement fork-join orchestration patterns
2. Add mutation testing awareness
3. Create debugger and recovery agents
4. Integrate observability platform hooks

---

## New Agent Recommendations

| Agent | Purpose | Priority |
|-------|---------|----------|
| `evaluator` | LLM-as-judge for output quality | High |
| `security-reviewer` | OWASP-focused security review | High |
| `debugger` | Investigate failures and unexpected outputs | Medium |
| `recovery` | Propose recovery strategies for failed runs | Medium |

---

## Configuration Additions

### Recommended `.claude/settings.json`:
```json
{
  "defaultModel": "sonnet",
  "agentModelOverrides": {
    "orchestrator": "opus",
    "architect": "opus",
    "implementer": "sonnet",
    "tester": "sonnet",
    "explorer": "haiku",
    "reviewer": "sonnet",
    "evaluator": "sonnet"
  },
  "enableContextAwareness": true,
  "maxRetries": 3
}
```

### Recommended MCP servers to consider:
- **filesystem** - File operations
- **github** - PR/issue management
- **postgres/sqlite** - Database introspection
- **brave-search** - Web research capabilities

---

## Sources

- [Anthropic: Claude 4.x Prompting Best Practices](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/claude-4-best-practices)
- [Anthropic: Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Anthropic: Effective Context Engineering for AI Agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [Anthropic: Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
- [LangChain: State of Agent Engineering](https://www.langchain.com/state-of-agent-engineering)
- [The New Stack: 5 Key Trends Shaping Agentic Development in 2026](https://thenewstack.io/5-key-trends-shaping-agentic-development-in-2026/)
- [Addy Osmani: LLM Coding Workflow Going Into 2026](https://addyosmani.com/blog/ai-coding-workflow/)
