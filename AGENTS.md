# Agent Instructions

This repository is an LLM Wiki plus Librarian template.

At the start of a session, read:

1. `schema.md`
2. `wiki/index.md`
3. `wiki/source-register.md`
4. `prompts/brain-import-packet.md`

## Core Rule

Raw sources are provenance. Do not edit existing files in `raw/`.

You may create a new raw file only when the user explicitly asks to import or ingest a source.

## User Phrases

- `Librarian, ingest this.` means preserve the pasted source in `raw/`, then compile a draft source page if appropriate.
- `Librarian, process the inbox.` means process files staged in `inbox/`.
- `What is the latest source about X?` means read `wiki/source-register.md` first.
- `Run lint` means check for broken links, missing index entries, orphan pages, and unprocessed raw files. If no lint script exists yet, perform the check manually.

## Standard Workflow

For each import:

1. Identify provider, surface, date, title, project, privacy level, and raw text.
2. Save raw text in `raw/YYYY-MM-DD-provider-surface-topic.md`.
3. Create a draft compiled page in `wiki/sources/`.
4. Create or update concept pages in `wiki/concepts/` only when useful.
5. Update `wiki/index.md`.
6. Append to `wiki/log.md`.
7. Rebuild `wiki/source-register.md`.
8. Report exactly what changed.

Do not commit or push unless the user asks.
