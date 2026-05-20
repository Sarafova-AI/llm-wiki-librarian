# Project Handoff

Date: 2026-05-20

Repository: `llm-wiki-librarian`

Public URL: https://github.com/Sarafova-AI/llm-wiki-librarian

## Purpose

This repository is a public idea skeleton for a local-first AI knowledge base.

It combines Andrej Karpathy's LLM Wiki pattern with an added Librarian layer for intake, provenance, and cross-platform recall.

The goal is to give people a simple structure they can download, give to an AI coding agent, and adapt into their own private brain.

The public framing should stay close to Karpathy's gist format: a long-form idea artifact with a usable starter structure attached, not a polished app or production package.

The repo should be presented as a practical continuity layer, not as a finished AI memory product. Its strongest public framing is: if your work moves across Claude, ChatGPT, Codex, terminal sessions, mobile notes, and documents, this gives the next human or agent a traceable place to start.

## What Comes From Karpathy's Idea

The core pattern is inspired by Andrej Karpathy's public `llm-wiki` gist:

- raw sources are preserved
- a Markdown wiki is maintained by an LLM
- a schema file tells the LLM how to behave
- durable answers and syntheses can be filed back into the wiki
- the wiki becomes the memory layer for future agent sessions

Original source:

- https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

This template should continue to credit Karpathy clearly. It should not copy the full gist text into the repository.

## What The Librarian Adds

The Librarian extension solves the intake problem.

Karpathy's pattern gives the brain a durable structure. The Librarian adds a repeatable way to bring in messy material from many places:

- AI chats
- coding sessions
- terminal logs
- mobile transcripts
- article notes
- meeting notes
- documents and references

The Librarian layer adds:

- `inbox/` as the staging area
- an import packet prompt
- source metadata fields
- raw source preservation rules
- `wiki/source-register.md` as a chronological provenance ledger
- "start from here" context for the next agent
- helper scripts for intake and register rebuilding
- simple user phrases such as `Librarian, ingest this.`

## Why The Template Stays Simple

A more seamless version would use live connectors, vector search, automatic chat capture, and platform-specific extraction. That direction is useful, but it can become fragile before the surrounding AI-platform infrastructure is stable enough.

This template intentionally keeps the reliable layer:

- Markdown files
- raw source preservation
- explicit provenance
- readable indexes
- Git history
- agent instructions

Do not over-position the project as autonomous memory. Position it as the lower-friction layer that preserves continuity while more seamless AI-memory infrastructure is still evolving.

## Current Repository State

The public template contains structure only. It should not contain a user's private brain.

Current main pieces:

- `README.md`: public landing page and explanation
- `START_HERE.md`: shortest entrypoint
- `HOW_TO_USE.md`: practical use instructions
- `ATTRIBUTION.md`: credit and positioning
- `AGENTS.md`: instructions for Codex and other local agents
- `CLAUDE.md`: additional instruction pointer for Claude Code
- `schema.md`: operating rules for the wiki
- `prompts/brain-import-packet.md`: reusable external chat prompt
- `scripts/build-source-register.ps1`: provenance register builder
- `scripts/new-intake.ps1`: helper for creating intake packets
- `raw/`: empty source layer placeholder
- `wiki/`: empty wiki layer placeholder
- `inbox/`: empty intake layer placeholder

## Public vs Private Boundary

This repository is public and should stay clean.

Do include:

- general instructions
- synthetic examples
- reusable prompts
- scripts
- schema improvements
- public explanation of the method

Do not include:

- private chats
- private research notes
- private source registers
- personal project details
- local machine paths
- exported conversations from real platforms
- anything that would make the repo become someone's actual private brain

The public repository teaches the method. A private repository or local folder should hold the real material.

## Recommended Git Structure

Use two separate repositories when applying this for real:

```text
public-template-repo/
  empty folders
  instructions
  prompts
  scripts
  synthetic examples only

private-brain-repo/
  real raw sources
  real wiki pages
  real source register
  real project memory
```

The public template can be shared on LinkedIn or with friends.

The private brain should remain private unless the owner intentionally publishes selected material.

## Recommended Git Workflow

For the public template:

1. Keep `main` stable and readable.
2. Commit improvements to docs, schema, prompts, and scripts.
3. Before pushing, scan for private paths, real transcripts, and private project names.
4. Use tags only when the template reaches a meaningful version, for example `v0.1`.
5. Keep the README useful for non-technical visitors.

For a private brain:

1. Commit after successful ingest sessions.
2. Commit after schema or workflow improvements.
3. Do not force-push casually.
4. Use GitHub private repositories for backup if desired.
5. Treat raw source files as provenance and avoid rewriting them.

## How A New User Should Start

The simplest user flow:

1. Download the repository as a ZIP.
2. Unzip it locally.
3. Open the folder in Codex, Claude Code, Cursor, or another file-aware AI agent.
4. Ask the agent to read `AGENTS.md` and `schema.md`.
5. Put one source into `inbox/`.
6. Ask `Librarian, process the inbox.`
7. Review the generated wiki pages.
8. Open the folder in Obsidian if graph navigation is useful.

## How An Agent Should Behave

When acting as Librarian, the agent should:

- identify source provider, surface, date, title, project, and privacy level
- save the original text in `raw/`
- create a draft compiled page in `wiki/sources/`
- create concept pages only when they genuinely help
- update `wiki/index.md`
- append to `wiki/log.md`
- rebuild `wiki/source-register.md`
- report changed files

The agent should not claim it can search external platforms automatically. It can only use sources already imported into the repository.

## Future Improvements

Good next improvements:

- add a fully synthetic example import
- add a lightweight lint script
- add a privacy scan script for public-template safety
- add screenshots or diagrams to explain the workflow
- add a `docs/FAQ.md`
- add a short `docs/FOR_AGENTS.md`
- tag a first public version once the README and examples feel stable

Possible later improvements:

- Google Drive inbox bridge
- Obsidian setup guide
- optional vector index layer
- platform-specific export guides

These should stay optional. The core value is the simple Markdown and provenance workflow.

## One-Sentence Public Description

Based on Andrej Karpathy's LLM Wiki pattern, this template adds a Librarian layer for importing AI chats, notes, and terminal sessions from many platforms into one traceable Markdown knowledge base.
