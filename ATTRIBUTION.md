# Attribution

## Original Pattern

This repository is built on the public LLM Wiki pattern described by Andrej Karpathy:

- https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

Karpathy's core idea, in brief:

- keep raw sources immutable
- let an LLM maintain a persistent Markdown wiki
- use a schema/instructions file to discipline the agent
- query the compiled wiki instead of repeatedly rediscovering raw fragments
- let useful answers and syntheses be filed back into the wiki

This repository does not reproduce the full gist. It links to it and implements a practical template inspired by it.

## Added Extension

The Librarian layer is an extension by Petya Sarafova.

It adds a practical intake desk for real AI work:

- import packets
- inbox staging
- platform/source/date metadata
- raw provenance preservation
- a generated source register
- simple commands an agent can follow

The extension exists because many useful AI sessions happen outside the local wiki: Claude web, Claude mobile, ChatGPT, Codex, terminal sessions, voice notes, documents, and copied transcripts. The Librarian gives those materials a standard way to enter the wiki.

## Suggested Public Description

> Based on Andrej Karpathy's LLM Wiki pattern. This repository adds a Librarian layer for cross-platform intake, provenance, and chronological recall.
