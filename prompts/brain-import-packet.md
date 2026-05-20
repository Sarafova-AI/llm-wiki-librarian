# Brain Import Packet Prompt

Paste this at the end of any chat you want to save into your LLM Wiki Librarian.

```text
Prepare this conversation for my LLM Wiki Librarian.

Do not replace, erase, or summarize away my original wording. Preserve the raw conversation text as fully as the platform allows.

Return only a BRAIN_IMPORT_PACKET with these fields:

BRAIN_IMPORT_PACKET
source_provider:
source_surface: web | mobile app | desktop app | terminal | voice note | document | web page | other
source_date:
native_url:
project:
title:
privacy_level: private | internal | publishable | unknown
why_this_matters:
key_takeaways:
candidate_tags:
candidate_wikilinks:
limitations:
raw_transcript_or_source_text:

If the conversation is too long, split it into PART 1/N, PART 2/N, etc. Keep the same metadata in every part and include the raw text for that part.
```
