# LLM Wiki Librarian

This is an idea skeleton, not a finished app.

It extends Andrej Karpathy's `llm-wiki` pattern with a Librarian intake layer for people whose AI work is scattered across Claude, ChatGPT, Codex, terminals, mobile sessions, and documents.

Use it as a starting structure. Give it to an AI coding agent and adapt it to your own private knowledge base.

Read the companion idea note on GitHub Gist:

- https://gist.github.com/Sarafova-AI/5cf5c886def7abcffa2872744b25dad2

Karpathy described the abstract LLM Wiki pattern: raw sources, an LLM-maintained Markdown wiki, and a schema that teaches the agent how to maintain it. This repo keeps that spirit and adds a practical Librarian layer for the part that breaks in real work: intake, provenance, source dates, AI surfaces, and handoff drift.

There is no server to run. There is no database to install. The core is Markdown, folders, Git, prompts, small helper scripts, and instructions that your AI coding agent can follow.

## Why This Exists

Some of the criticism I see around Karpathy's `llm-wiki` idea is that it sounds designed mainly for researchers.

But if your work requires daily operation across different AI work surfaces - Claude app, Claude web, Claude Code, terminal Claude Code, ChatGPT, Codex app, Codex terminal, Codex CLI, mobile sessions - the work accumulates day after day in places that do not talk to each other.

After a while it becomes hard to remember where a project phase was developed, where an idea first appeared, which session shaped it with you, and which context snapshot is the one you can trust before the whole thing turns into handoff drift.

For my own use case, I spent too many days and too many tokens trying to build the all-in-one seamless continuity system: vector DB, RAG-like retrieval, custom extraction, real-time capture from different AI surfaces, and all the bridges needed to make those pieces behave as one system.

It took too much effort and too many tokens to read the signal: this is not the right moment to force seamless automatic transfer. Not because the idea is wrong, but because the surrounding infrastructure is not aligned enough yet for flawless cross-platform continuity that can deliver the work goal with stability and efficiency.

That ambitious version stays in the private repo, waiting for its time.

What I am sharing today is the interim layer: a Librarian addition on top of Karpathy's `llm-wiki` pattern, meant to relieve some of the pain now while the big labs are still brewing the next capability jump.

And I think this is a pattern in AI development more generally. There are moments when the workaround needed to close a gap becomes bigger than the net value it gives back to the user. At that point, the pragmatic move is to stop investing there, put the larger idea on hold, and wait for the next jump in capabilities.

This layer does not pretend to be seamless AI memory. It improves tracking, collecting, preserving provenance, and calling back the specific topic when the next AI session needs to continue from where the work actually stopped.

## The Idea

This project has two layers.

### 1. The LLM Wiki Core

The foundation is Andrej Karpathy's public `llm-wiki` pattern:

- keep raw sources
- let an LLM maintain a persistent Markdown wiki
- use a schema file to discipline the agent
- query the compiled wiki instead of rediscovering the same fragments again and again
- file durable answers back into the wiki

Original source:

- Andrej Karpathy, `llm-wiki` gist: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

This repository does not copy the full gist text. It links to it and implements a clean starter template inspired by that pattern.

### 2. The Librarian Layer

The Librarian layer is an added extension by Petya Sarafova.

It exists for a practical reason: real AI work does not happen in one place, and it is usually not clean before it becomes useful.

You may have useful material from:

- Claude web or desktop
- Claude Code
- ChatGPT
- Codex
- Cursor or another coding agent
- terminal sessions
- mobile voice notes
- documents, articles, and meeting notes

The Librarian gives all of that material one standard intake door for both the human user and the next AI agent.

It adds:

- an `inbox/` for scattered incoming material
- a reusable import packet
- raw source preservation
- provider, surface, date, project, and title metadata
- a source register for chronological recall
- "start from here" context for the next agent
- simple agent instructions for turning raw material into wiki pages

The simple user phrase is:

```text
Librarian, ingest this.
```

For many files at once:

```text
Librarian, process the inbox.
```

## What Problem This Solves

This template is for people who want their AI work to compound instead of evaporate.

It helps answer questions like:

- Where did this idea happen?
- Which AI agent helped develop it?
- Was it in a chat, a terminal session, a code session, a voice note, or a draft?
- What project phase did it belong to?
- What was the original wording?
- What has already been decided?
- How do I bring the next AI back to the right context without re-explaining everything?

The important part is not only storage. It is traceability.

The Librarian keeps both:

- the raw source, so nothing important disappears
- the compiled wiki page, so the material becomes searchable, readable, and useful

## How This Feels In Use

You do not need to memorize a complicated command system.

The normal loop is:

1. Put a chat, transcript, note, or document into `inbox/`.
2. Open the folder in an AI coding agent.
3. Say `Librarian, process the inbox.`
4. The agent preserves the raw text.
5. The agent creates a readable draft page.
6. The agent updates the index, log, and source register.
7. Later, you ask questions against the wiki instead of searching every platform manually.

The wiki can also be opened in Obsidian, because everything is Markdown.

## Who This Is For

Use this if you:

- work with several AI platforms
- want one local source of truth
- want a project memory that survives new chat sessions
- want AI agents to read your prior work before helping you
- want GitHub backup or sharing without building an app
- want an Obsidian-friendly knowledge base

This is especially useful for research, writing, product thinking, technical projects, personal operating systems, and long-running work where ideas evolve over months.

## What This Is Not

This is not:

- a vector database
- a SaaS app
- an automatic connector to Claude, ChatGPT, or mobile apps
- a seamless AI memory product
- a replacement for Obsidian
- a chatbot UI
- a promise that the agent can see material you have not imported

The Librarian can only search and organize material that has already been placed into this repository.

## Quick Start For Non-Technical Users

1. Download this repository as a ZIP from GitHub.
2. Unzip it somewhere on your computer.
3. Open that folder in an AI coding agent such as Codex, Claude Code, Cursor, or another agent that can read and edit local files.
4. Tell the agent:

```text
Read AGENTS.md and schema.md. Help me set this up as my personal AI knowledge base.
```

5. Put one chat, note, or transcript into `inbox/`.
6. Tell the agent:

```text
Librarian, process the inbox.
```

That is the basic loop.

## Quick Start For Agents

At the start of a session, read:

1. `AGENTS.md`
2. `schema.md`
3. `wiki/index.md`
4. `wiki/source-register.md`
5. `prompts/brain-import-packet.md`

Then follow the import workflow in `AGENTS.md`.

Do not modify existing files in `raw/`. Raw sources are provenance.

## The Import Packet

When you are in an external AI chat and want to preserve the conversation, paste this:

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

Then copy the packet into `inbox/` or paste it into your local agent session.

The packet is not magic. It is just a clean shape that makes later import easier and more reliable.

## The Librarian Contract

When an agent acts as Librarian, it should:

- preserve the original wording in `raw/`
- never rewrite existing raw files
- create draft source pages in `wiki/sources/`
- create concept pages in `wiki/concepts/` when useful
- update `wiki/index.md`
- append to `wiki/log.md`
- rebuild `wiki/source-register.md`
- report exactly what changed

This creates a clear chain:

```text
external chat or note -> inbox -> raw source -> compiled wiki page -> source register
```

## Folder Structure

```text
llm-wiki-librarian/
  raw/                   immutable source material
  wiki/                  agent-maintained Markdown wiki
    sources/             compiled source summaries
    concepts/            reusable concept pages
    index.md             content-oriented map
    log.md               chronological change log
    source-register.md   provenance ledger
  inbox/                 temporary staging area for material to import
    processed/           imported inbox files
    needs-metadata/      files that need missing date/provider/raw text
  prompts/               reusable prompts for external AI platforms
  scripts/               helper scripts
  AGENTS.md              instructions for Codex and other agents
  CLAUDE.md              instructions for Claude Code
  schema.md              operating rules for the wiki
  NEW_INTAKE.cmd         optional Windows helper for creating an inbox packet
  UPDATE_SOURCE_REGISTER.cmd optional Windows helper for rebuilding provenance
```

## What Each Folder Means

`raw/` keeps original source material. Agents read these files but should not edit existing raw files.

`wiki/` is the readable knowledge base.

`wiki/sources/` holds compiled summaries of imported chats, notes, and documents.

`wiki/concepts/` holds reusable ideas that appear across many sources.

`wiki/index.md` is the map of the wiki.

`wiki/log.md` is the chronological change log.

`wiki/source-register.md` is the provenance ledger. It records date, provider, surface, project, title, raw file, and compiled page.

`inbox/` is the drop zone for new material waiting to be imported.

`prompts/` contains copy-paste prompts for external AI platforms.

`scripts/` contains small helper scripts.

`AGENTS.md`, `CLAUDE.md`, and `schema.md` tell AI agents how to work with the repository.

## Git And GitHub Structure

This repository is designed to be useful in Git.

Recommended practice:

- Keep the template public if you want to share the method.
- Keep your personal populated brain private.
- Commit changes when the structure, schema, prompts, or scripts improve.
- Do not commit private raw chats into a public template repository.
- Use synthetic examples only if you add examples later.
- Use GitHub as backup, version history, and distribution.

A clean pattern is:

```text
public-template-repo/
  empty structure
  instructions
  prompts
  scripts
  synthetic examples only

private-brain-repo/
  your real raw sources
  your real wiki pages
  your real source register
```

The public repo teaches the method. The private repo holds the life.

## What You Can Ask Later

After sources are imported, you can ask your local agent:

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

## Project Handoff

For a more detailed maintainer handoff, see:

- `docs/PROJECT_HANDOFF.md`

## Status

Status: v0 idea skeleton.

This repository is intentionally generic. It does not include my private populated brain, the more ambitious automation experiments, or real source material. Those stay private. The public repo shares the structure and the Librarian pattern so others can adapt it inside their own environment.

## Attribution

The underlying LLM Wiki pattern should be credited to Andrej Karpathy's original public gist:

- https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

This repository adds the Librarian layer for cross-platform intake, provenance, and chronological recall.

## License

This template is released under the MIT License. The underlying LLM Wiki idea should be credited to Andrej Karpathy's original gist. This repository does not grant rights over Karpathy's original text.
