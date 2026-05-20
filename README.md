# LLM Wiki Librarian

A local-first template for building a Markdown knowledge base that your AI agents can read, update, and cite.

In plain language: this is a starter kit for giving your AI work a **home**.

Instead of leaving useful ideas scattered across Claude, ChatGPT, Codex, terminal sessions, documents, and notes, you put them into one folder. The AI preserves the original source, turns it into readable wiki pages, and keeps a chronological register of where each idea came from.

This project has two parts:

1. **LLM Wiki core**: a plain-text knowledge base pattern inspired by Andrej Karpathy's public `llm-wiki` gist.
2. **Librarian layer**: an added intake and provenance workflow for bringing in chats, notes, terminal transcripts, and source material from many AI platforms without losing where they came from.

The goal is simple: give yourself and your AI agents a one-stop shop for memory that is readable, editable, linkable, and versionable with Git.

## Start Here

If you are non-technical, use it like this:

1. Download this repository as a ZIP from GitHub.
2. Unzip it somewhere on your computer.
3. Open that folder in an AI coding agent such as Codex, Claude Code, Cursor, or another agent that can read and edit local files.
4. Tell the agent:

```text
Read AGENTS.md and schema.md. Help me set this up as my personal AI knowledge base.
```

5. Put chats or notes into `inbox/`.
6. Tell the agent:

```text
Librarian, process the inbox.
```

That is the basic loop.

There is no server to run and no database to install. This is a folder of Markdown files plus instructions your AI agent can follow.

## Attribution

The LLM Wiki pattern is Andrej Karpathy's idea. Please read and credit the original:

- Andrej Karpathy, `llm-wiki` gist: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

This repository does not copy the full gist text. It implements a clean template based on the public pattern: immutable raw sources, an agent-maintained Markdown wiki, and a schema/instructions file for AI agents.

The **Librarian layer** is an extension by Petya Sarafova. It adds:

- a universal inbox for messy material from many platforms
- import packets for Claude, ChatGPT, Codex, terminal sessions, and notes
- source/date/platform metadata
- a source register for chronological recall
- simple scripts that help agents maintain provenance

## What This Is For

Use this if you want:

- one local folder where your AI work compounds
- source traceability instead of scattered chats
- an Obsidian-friendly Markdown wiki
- a way to ask "where did this idea come from?"
- a repeatable workflow your AI agent can follow

This is not a vector database, SaaS app, or automatic connector system. It is a practical file-based memory layer that any coding agent can read and maintain.

## Why It Is Helpful

Modern AI work happens everywhere. One day the useful thread is in Claude mobile. The next day it is in ChatGPT, Codex, a terminal log, a meeting transcript, or a document.

The problem is not only storage. The problem is traceability:

- Where did this idea come from?
- Which platform was it in?
- What date did it happen?
- What was the original wording?
- What is the latest source about this project?

The Librarian layer answers those questions by keeping both the raw source and the processed wiki page.

## What Each Folder Means

- `raw/` keeps the original source material. The AI should not rewrite these files.
- `wiki/` is the readable knowledge base.
- `wiki/sources/` holds compiled summaries of imported chats, notes, and documents.
- `wiki/concepts/` holds reusable ideas that appear across sources.
- `wiki/index.md` is the map of the wiki.
- `wiki/log.md` is the chronological change log.
- `wiki/source-register.md` is the provenance ledger: date, platform, project, raw file, draft page.
- `inbox/` is the drop zone for new material waiting to be imported.
- `prompts/` contains copy-paste prompts for external AI platforms.
- `scripts/` contains small helper scripts.
- `AGENTS.md`, `CLAUDE.md`, and `schema.md` tell AI agents how to work with the repository.

## Folder Structure

```text
llm-wiki-librarian/
  raw/                 immutable source material
  wiki/                agent-maintained Markdown wiki
    sources/           compiled source summaries
    concepts/          concept pages
    index.md           content-oriented map
    log.md             chronological change log
    source-register.md chronological provenance ledger
  inbox/               temporary staging area for material to import
    processed/         imported inbox files
    needs-metadata/    files that need missing date/provider/raw text
  prompts/             reusable prompts for external AI platforms
  scripts/             helper scripts for source register and inbox packets
  AGENTS.md            instructions for Codex and other agents
  CLAUDE.md            instructions for Claude Code
  schema.md            operating rules for the wiki
  NEW_INTAKE.cmd        optional Windows helper for creating an inbox packet
  UPDATE_SOURCE_REGISTER.cmd optional Windows helper for rebuilding provenance
```

## Quick Start

1. Clone or download this repository.
2. Open the folder in your AI coding agent: Codex, Claude Code, Cursor, OpenCode, etc.
3. Tell the agent:

```text
Read AGENTS.md and schema.md. Then help me initialize this wiki for my domain.
```

4. Put one source file in `inbox/` or `raw/`.
5. Ask:

```text
Librarian, ingest this.
```

or:

```text
Librarian, process the inbox.
```

On Windows, you can also double-click `NEW_INTAKE.cmd` to create a prefilled inbox packet.

## How To Give This To An Agent

Use this prompt:

```text
This folder is my LLM Wiki Librarian.

Read AGENTS.md, schema.md, wiki/index.md, and wiki/source-register.md.

When I give you new chats or notes, preserve the raw text in raw/, compile a draft page in wiki/sources/, update wiki/index.md and wiki/log.md, and rebuild wiki/source-register.md.
```

For Claude Code specifically, the agent should also read `CLAUDE.md`.

## Fast Import Packet

At the end of any AI chat you want to save, paste:

```text
Prepare this conversation for my LLM Wiki Librarian.

Return only a BRAIN_IMPORT_PACKET with:

source_provider:
source_surface:
source_date:
native_url:
project:
title:
privacy_level:
why_this_matters:
key_takeaways:
candidate_tags:
candidate_wikilinks:
limitations:
raw_transcript_or_source_text:
```

Then copy the packet into `inbox/` or paste it directly into your local agent session.

## The Librarian Contract

The Librarian should:

- preserve raw wording in `raw/`
- never modify existing raw files
- create draft source pages in `wiki/sources/`
- create concept pages in `wiki/concepts/` when obvious
- update `wiki/index.md`
- append to `wiki/log.md`
- rebuild `wiki/source-register.md`
- report what changed

## Important Limits

The Librarian can only search and organize material that has already been imported into the repository. It does not automatically see your Claude, ChatGPT, phone, browser, or terminal history.

To make a source searchable, you must put it into `inbox/` or paste it into a local agent session and ask the Librarian to ingest it.

## What You Can Ask Later

Once sources are imported, you can ask:

```text
What is the latest source about this project?
```

```text
Which platform did this idea come from?
```

```text
Show me all sources from April 2026.
```

```text
Which source pages mention this concept?
```

The answer is only as complete as the material already imported into the repository.

## Recommended Tools

- Obsidian for reading and graph navigation
- GitHub for backup and sharing
- Codex or Claude Code for maintaining the wiki
- Any text editor for raw source capture

## License

This template is released under the MIT License. The underlying LLM Wiki idea should be credited to Andrej Karpathy's original gist. This repository does not grant rights over Karpathy's original text.
