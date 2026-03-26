# Document Summary & Arrangement

Legal document intake skill for Claude Code. Reads source documents (PDFs, scans, images, Word files), triages by importance, summarizes key documents, classifies by type, and produces a structured index.

## Install

Add to your Claude Code settings (`.claude/settings.local.json`):

```json
{
  "skills": ["./document-summary-arrangement/skill.md"]
}
```

Or copy `skill.md` into your project's `.claude/skills/` directory.

## What it does

1. **Intake** — Collects documents, understands the matter context (litigation, transactional, immigration, etc.)
2. **Triage** — Scans the full collection, classifies each file as Key Document / Corroborating / Low Value, plans processing batches to avoid size and rate limits
3. **Read & Extract** — Reads documents in size-aware batches (PDF, image/OCR, Word, email), extracts text and metadata
4. **Summarize & Classify** — Writes detailed summaries for key documents, brief notes for corroborating evidence, flags cross-document discrepancies
5. **Index & Arrange** — Produces a master document index with matter overview, discrepancy log, and strength assessment

## Arrangement options

- **Chronological** (default for litigation)
- **By document type** (default for transactional/due diligence)
- **By evidentiary criterion** (default for immigration — O-1, EB-1, EB-2 NIW)
- **By party/author**
- **By issue/topic**
- **Custom**

## Immigration support

Built-in evidentiary criterion templates for:
- **O-1A** — 8 criteria + filing docs
- **EB-1A** — 10 criteria + filing docs
- **EB-2 NIW** — 3 prongs + filing docs

Each criterion section gets a strength assessment (Strong/Moderate/Weak) based on document quality.

## Output

```
workspace/<matter-name>/
├── matter_context.md         # Matter details and parties
└── index/
    └── document_index.md     # Master index with inline summaries
```

## Key improvements from v1

- **Triage phase** — scans before reading; identifies key docs vs. screenshots; plans batches
- **Size-aware batching** — respects file size limits (max ~10MB per batch); splits on failure
- **Importance tiers** — Key Document / Corroborating / Low Value; summaries only for what matters
- **Discrepancy detection** — cross-checks titles, dates, amounts across documents; logs conflicts
- **Immigration-native** — criterion-based arrangement with built-in O-1/EB-1/EB-2 templates
- **No file sprawl** — inline summaries in the index; no 130 separate extracted text files

## Supported file types

| Type | Method | Batch Size |
|------|--------|-----------|
| PDF (text, < 20 pages) | Direct text extraction | 5-8 per batch |
| PDF (large, > 20 pages) | Page-range reading | 1-2 per batch |
| High-quality images | Multimodal vision | 3-4 per batch |
| Low-quality photos | Best-effort vision | 2-3 per batch |
| Email screenshots | Multimodal vision | 3-5 per batch |
| Word (.docx) | Text extraction | 5-8 per batch |
| Spreadsheets (.xlsx) | Structure extraction | 2-3 per batch |

## Privilege handling

Documents flagged as potentially privileged get minimal-detail entries — date, type, and parties only. No substantive summary until the lawyer clears privilege review.

## Usage

```
/document-summary-arrangement
```

Then provide your documents and matter context when prompted.
