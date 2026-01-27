# Learnings Index

> Knowledge accumulated while building and iterating on Promptly.

---

## By Topic

### Agent Design
- [Agent Design Patterns](patterns/agent-design.md)

### Prompt Engineering
- [Prompt Engineering Patterns](patterns/prompt-engineering.md)

### Context Engineering
- [METHOD.md](../METHOD.md) - Full methodology including context engineering principles
- [Anthropic: Effective Context Engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)

### Workflow
- [Workflow Patterns](patterns/workflow-patterns.md)

### Meta (Learning about Learning)
- [Meta-Workflow Patterns](patterns/meta-workflow.md)

### Standards
- [NAMING_CONVENTIONS.md](../NAMING_CONVENTIONS.md) - File/folder naming standards

---

## Chronological

<!-- Add new entries at the top -->

| Date | Topic | Confidence | Summary |
|------|-------|------------|---------|
| 2026-01-22 | Workflow Setup | validated | Established iteration workflow for capturing learnings |

---

## Key Insights (Quick Reference)

<!-- Top 5-10 most important learnings -->

1. **Context persistence is critical** - CLAUDE.md and ARCHITECTURE.md survive context resets; raw session memory doesn't
2. **Capture learnings in real-time** - Retrospective documentation misses nuance; write it when you discover it
3. **Checkpoints enable experimentation** - Frequent commits let you try risky changes safely
4. *(Add more as you discover them)*

---

## How to Add Learnings

1. **During a session**: Dump raw insights into `ITERATION_LOG.md`
2. **After iteration**: Promote valuable insights to `LEARNINGS/YYYY-MM-DD-topic.md`
3. **When patterns emerge**: Extract to `LEARNINGS/patterns/*.md`
4. **Update this index** to keep it navigable
