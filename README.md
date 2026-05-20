# LLM Wiki Librarian

A small, local-first template for building a Markdown knowledge base with an AI agent.

This project has two parts:

1. **LLM Wiki core**: a plain-text knowledge base pattern inspired by Andrej Karpathy's public `llm-wiki` gist.
2. **Librarian layer**: an added intake and provenance workflow for bringing in chats, notes, terminal transcripts, and source material from many AI platforms without losing where they came from.

The goal is simple: give yourself and your AI agents a one-stop shop for memory that is readable, editable, linkable, and versionable with Git.

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
