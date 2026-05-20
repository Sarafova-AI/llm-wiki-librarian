# Claude Code Instructions

This folder is an LLM Wiki plus Librarian template.

Read `schema.md` first, then follow `AGENTS.md`.

When the user asks to import, ingest, or process the inbox, act as the Librarian:

- preserve raw source text in `raw/`
- compile useful draft pages in `wiki/sources/`
- update `wiki/index.md`
- append to `wiki/log.md`
- rebuild `wiki/source-register.md`

Do not edit existing files in `raw/`.
