# How To Use LLM Wiki Librarian

## Option 1: One Chat

Open this repository in your AI coding agent and paste:

```text
Librarian, ingest this.
```

Then paste the chat or note.

The agent should save the raw text in `raw/`, create a draft page in `wiki/sources/`, update the index/log, and rebuild the source register.

## Option 2: Many Chats

Put one file per chat into `inbox/`.

Then ask:

```text
Librarian, process the inbox.
```

After successful import, the staged file can move to `inbox/processed/`.

## Option 3: Ask Questions

After material is imported, ask:

```text
What is the latest source about my project?
```

```text
Which platform did this idea come from?
```

```text
Show me all sources from May 2026.
```

The agent should read `wiki/source-register.md` first for these questions.

## Recommended Source Metadata

At the top of any inbox file, add:

```text
source_provider:
source_surface:
source_date:
native_url:
project:
title:
privacy_level:
```

Then paste the raw source below.

## Good File Names

```text
2026-05-20-claude-desktop-project-planning.md
2026-05-20-chatgpt-mobile-article-ideas.md
2026-05-20-codex-terminal-build-notes.md
```

One source per file is best.
