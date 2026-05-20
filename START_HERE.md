# Start Here

This repository is a starter kit for a local AI-readable knowledge base.

It combines:

- Andrej Karpathy's LLM Wiki pattern: raw sources plus an agent-maintained Markdown wiki.
- The Librarian layer: inbox, provenance, platform/date metadata, and a source register.

## Fastest Use

1. Download or clone this repository.
2. Open the folder in an AI coding agent.
3. Ask the agent:

```text
Read AGENTS.md and schema.md. Help me initialize this as my personal AI knowledge base.
```

4. Put a chat, note, or transcript into `inbox/`.
5. Ask:

```text
Librarian, process the inbox.
```

## What You Get

- original source preserved in `raw/`
- readable draft page in `wiki/sources/`
- concept pages in `wiki/concepts/` when useful
- map of the wiki in `wiki/index.md`
- change history in `wiki/log.md`
- provenance ledger in `wiki/source-register.md`

## What This Is Not

This is not a cloud app, vector database, or automatic connector system.

It is a practical local folder structure that AI agents can maintain.

## Attribution

Original LLM Wiki pattern: Andrej Karpathy's public gist.

Librarian layer: added extension for intake, provenance, and cross-platform recall.
