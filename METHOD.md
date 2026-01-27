# Methodology: AI-Assisted Development with Promptly

> A living document capturing our development philosophy and context engineering approach.

---

## Core Philosophy

**Do the simplest thing that works.** Given rapid improvements in model capabilities, over-engineering agent systems creates maintenance burden without proportional benefit.

---

## Context Engineering Principles

Context is finite. Every token competes for the model's attention. These principles guide how we manage context effectively.

### 1. Minimum Viable Context

Find the smallest set of high-signal tokens that maximize the likelihood of your desired outcome.

**In practice:**
- Load only what's needed for the current task
- Use lightweight identifiers (file paths, function names) and retrieve details on demand
- Summarize long conversations before context limits hit

### 2. Calibrate the Altitude

Avoid extremes:
- **Too specific**: Brittle if-then rules that break on edge cases
- **Too vague**: High-level guidance that assumes shared understanding

Strike a balance between specificity and flexibility.

### 3. Structured Formatting

Organize prompts and documentation with clear sections:
- Use XML tags or Markdown headers for separation
- Group related information together
- Make hierarchy explicit

### 4. Start Minimal, Then Iterate

1. Test with a bare-bones prompt
2. Observe failures
3. Add instructions/examples based on actual problems
4. Repeat

---

## Tool Design Principles

### Minimize Overlap

If humans can't definitively say which tool to use in a situation, neither can an AI agent.

**In Promptly:**
- Each agent has a single, clear responsibility
- Tool permissions are explicit and minimal
- Overlapping capabilities are avoided

### Token Efficiency

Tools should:
- Return compact, relevant information
- Encourage efficient agent behaviors
- Avoid bloated functionality sets

### Explicit Purpose

- Input parameters should be descriptive and unambiguous
- Leverage the model's strengths (understanding natural language descriptions)
- Avoid cryptic parameter names

---

## Long-Horizon Task Strategies

### Compaction

When approaching context limits:
- Summarize conversation history
- Preserve architectural decisions and critical details
- Discard redundant outputs and intermediate steps

### Structured Note-Taking

Maintain persistent memory outside the context window:
- `CLAUDE.md` - Project context that survives resets
- `ARCHITECTURE.md` - System documentation
- `ITERATION_LOG.md` - Current session state

Agents can reference and build upon previous work.

### Sub-Agent Architecture

Delegate specialized tasks to focused sub-agents:
- Each agent returns condensed summaries (1,000-2,000 tokens)
- Parent agents orchestrate without holding all details
- Prevents context bloat in complex workflows

---

## Dynamic Context Retrieval

### Just-In-Time Loading

Rather than pre-loading all data:
- Maintain lightweight identifiers (file paths, URLs, queries)
- Load information dynamically via tools
- Let agents explore as needed

### Leverage Metadata

Use structural signals:
- File hierarchies indicate relationships
- Naming conventions reveal purpose
- Timestamps show recency

### Hybrid Approach

- Pre-load critical data for speed (CLAUDE.md, ARCHITECTURE.md)
- Allow agent autonomy to explore further when needed

---

## Example Curation

Examples are worth a thousand words for LLMs.

**Effective examples:**
- Diverse and canonical (not exhaustive edge cases)
- Show the pattern, not every variation
- Include both positive and negative examples

---

## Iteration Methodology

See [ITERATION_WORKFLOW.md](./ITERATION_WORKFLOW.md) for the complete cycle:

```
Plan → Do → Capture → Checkpoint → Reflect
```

### Key Practices

1. **Real-time learning capture** - Document insights when they occur, not retrospectively
2. **Frequent checkpoints** - Enable safe experimentation
3. **Pattern extraction** - Promote recurring learnings to reusable patterns
4. **Periodic review** - Revisit this document and LEARNINGS/ when methodology evolves

---

## Updating This Document

This document should evolve. Update it when:

- [ ] You discover a new context engineering technique that works
- [ ] An existing approach proves ineffective
- [ ] Industry best practices shift (review quarterly)
- [ ] New model capabilities change what's possible

**Last reviewed**: 2026-01-26

---

## References

- [Anthropic: Effective Context Engineering for AI Agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [ITERATION_WORKFLOW.md](./ITERATION_WORKFLOW.md)
- [LEARNINGS/](./LEARNINGS/)
- [BEST_PRACTICES_PLAN.md](./BEST_PRACTICES_PLAN.md)
