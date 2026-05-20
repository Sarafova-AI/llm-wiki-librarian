# Schema

This file tells the AI agent how to maintain the wiki.

## Architecture

There are four layers:

1. `raw/`: immutable source material.
2. `wiki/`: agent-maintained Markdown pages.
3. `inbox/`: temporary staging for material not yet imported.
4. `schema.md` plus `AGENTS.md`: the operating rules.

This follows Andrej Karpathy's LLM Wiki pattern: raw sources, wiki, schema. The Librarian layer adds inbox intake and source provenance.

## Raw Sources

Files in `raw/` are the source of truth. The agent reads them but never modifies existing raw files.

A raw source file should include:

```yaml
---
title:
source_provider:
source_surface:
source_date:
native_url:
project:
privacy_level:
imported:
status: raw
---
```

Then include the original text under:

```markdown
## Raw transcript
```

or:

```markdown
## Raw source text
```

## Wiki Pages

Compiled pages live under `wiki/`.

Recommended frontmatter:

```yaml
---
title:
created:
updated:
tags: []
sources: []
confidence: high | medium | low | speculative
status: draft
---
```

Use `status: draft` for agent-created pages awaiting human review.

## Index

`wiki/index.md` is the content map. Update it on every ingest.

## Log

`wiki/log.md` is chronological. Append one entry per meaningful change.

Use this shape:

```markdown
## [YYYY-MM-DD] ingest | Title

Imported source from provider/surface/date into `raw/...`. Drafted `wiki/sources/...`.
```

## Source Register

`wiki/source-register.md` is the provenance ledger. It lists date, provider, surface, project, title, raw file, and draft file.

Rebuild it after each ingest:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/build-source-register.ps1
```

## Inbox

`inbox/` is a temporary drop zone.

One file equals one source.

If metadata is missing, ask the user before importing or move the file to `inbox/needs-metadata/`.

After successful import, move the staged file to `inbox/processed/`.

## Links

Use Obsidian-style links:

```markdown
[[concept-name]]
```

Prefer bare filenames over folder paths so pages can move later.

## Confidence

- `high`: directly supported by source material
- `medium`: supported by one source or strong inference
- `low`: weak inference
- `speculative`: idea or hypothesis

## Query

When answering questions:

1. Read `wiki/index.md`.
2. Read `wiki/source-register.md` if the question involves date, platform, provenance, or "latest".
3. Open relevant wiki/source pages.
4. Cite filenames.
5. Offer to file the answer back into the wiki if it is durable.
