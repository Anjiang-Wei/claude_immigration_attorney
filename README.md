# Claude for Legal

Claude Code skills for immigration attorneys. Draft O-1A, EB-1A, and EB-2 NIW petitions with AI — every claim backed by evidence.

## What This Is

A set of [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills that handle the most time-consuming parts of immigration petition work:

1. **Read and organize 100+ source documents** into a structured index
2. **Research every entity** (organizations, awards, publications) for verified facts
3. **Draft the petition letter** criterion-by-criterion with exhibit references
4. **Flag evidence gaps** so the attorney knows exactly what's missing

The skills follow the argument structures used by established immigration law firms, with one improvement: every factual claim must trace back to a document exhibit or a verified web source. No vague adjectives, no unsourced numbers.

## Skills

| Skill | What It Does |
|-------|-------------|
| [`document-summary-arrangement`](document-summary-arrangement/) | Ingests source documents (PDFs, images, scans), triages by importance, summarizes key documents, and produces a structured index arranged by evidentiary criterion |
| [`o1-petition-narrative`](o1-petition-narrative/) | Drafts O-1A/O-1B petition support letters — criterion-by-criterion arguments with exhibit references and evidence enrichment |
| [`eb1a-petition-narrative`](eb1a-petition-narrative/) | Drafts EB-1A green card petitions — same criteria as O-1A but stricter scrutiny, adds sustained acclaim totality argument, intent to continue work, and substantial U.S. benefit |
| [`niw-national-importance-research`](niw-national-importance-research/) | Researches authoritative gov sources, national plans, and federal funding — produces a quotable research document matched to the petitioner's background |
| [`niw-petition-narrative`](niw-petition-narrative/) | Drafts EB-2 NIW self-petition support letters using the Dhanasar three-prong framework |
| [`petition-audit`](petition-audit/) | Audits any petition letter — verifies every factual claim against source documents, flags legal errors, checks internal consistency, produces severity-rated report |
| [`expert-letter-drafter`](expert-letter-drafter/) | Drafts expert/reference/recommendation letters — assigns criteria to experts by credential, ensures no two letters overlap, produces ready-to-customize drafts |

## Knowledge Base

The `knowledge/` directory contains best practices distilled from real cases and USCIS adjudication patterns. Skills read these files before drafting.

```
knowledge/
├── overview-o1a-eb1a.md       # O-1A/EB-1A standard, Kazarian framework
├── overview-niw.md            # NIW standard, Dhanasar framework
├── criteria/                  # Best practices per O-1A/EB-1A criterion
│   ├── 01-awards.md
│   ├── 02-membership.md
│   ├── 03-published-material.md
│   ├── 04-original-contributions.md
│   ├── 05-scholarly-articles.md
│   ├── 06-critical-employment.md
│   ├── 07-high-remuneration.md
│   └── 08-judging.md
├── prongs/                    # Best practices per NIW Dhanasar prong
│   ├── 01-substantial-merit.md
│   ├── 02-well-positioned.md
│   └── 03-national-interest-balance.md
├── evidence-hierarchy.md      # How USCIS weighs evidence (Tier 1–4)
├── argument-patterns.md       # Reusable argument structures
└── uscis-policy-alerts.md     # Key citations (PA-2022-03, Kazarian, Dhanasar)
```

## Workflow

```
Source documents
       ↓
document-summary-arrangement → document index (arranged by criterion)
       ↓
knowledge/ (read best practices)
       ↓
o1-petition-narrative   → O-1A petition package
eb1a-petition-narrative          → EB-1A petition package (stricter)  ─┐
niw-national-importance-research → gov sources research document       │
  → niw-petition-narrative       → NIW petition package              ──┤
                                                                       ↓
                                                          petition-audit → audit report
```

Each petition package is a single file containing:
- The full support letter draft
- Source registry (every fact traced to a document or URL)
- Web sources the attorney needs to print for filing
- Evidence gaps and strength assessment

## Quick Start

1. Install [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
2. Clone this repo
3. Install dependencies:
   ```bash
   ./document-summary-arrangement/scripts/setup.sh
   ```
4. Scan your document collection:
   ```bash
   ./document-summary-arrangement/scripts/scan-collection.sh /path/to/client/documents
   ```
5. Index the documents:
   ```
   /document-summary-arrangement
   ```
6. Draft the petition:
   ```
   /o1-petition-narrative     # O-1A temporary visa
   /eb1a-petition-narrative   # EB-1A green card (stricter)
   /niw-petition-narrative    # EB-2 NIW national interest waiver
   ```

## Scripts

Helper scripts for document processing in `document-summary-arrangement/scripts/`:

| Script | What It Does |
|--------|-------------|
| `setup.sh` | Installs dependencies (poppler for PDF tools) |
| `scan-collection.sh` | Scans a directory — reports file types, sizes, page counts, batch plan |
| `pdf-to-text.sh` | Extracts text from PDF (auto-detects scanned vs. text) |
| `pdf-to-images.sh` | Converts PDF pages to PNG for multimodal reading |
| `docx-to-text.sh` | Extracts text from .docx (macOS/Linux) |

## Who This Is For

- Immigration attorneys drafting extraordinary ability and national interest waiver petitions
- Legal teams that want to reduce the time spent on document organization and initial drafting
- Attorneys who want a structured, evidence-backed first draft they can review and refine

## What This Is NOT

- Not legal advice. Every output is a draft for attorney review.
- Not a replacement for legal judgment. The attorney decides what to file.
- Not a document filing system. It drafts — you review, edit, and file.

## Contributing

The knowledge base improves with every case. After a case outcome:
- Add anonymized best practices to the relevant `criteria/` or `prongs/` file
- Never commit client names, company names, or identifying details
- Keep entries concise and actionable

## License

MIT
