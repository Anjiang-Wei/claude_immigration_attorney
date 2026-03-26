# Claude for Legal — Skills

Claude Code skills for lawyers. Each skill handles a specific legal workflow, designed to be used on real matters.

## Skills

1. **`document-summary-arrangement`** — Reads source documents (PDF, scans, images), triages by importance, summarizes key documents, classifies by type, and produces a structured document index. The foundational skill — every other legal workflow starts here. Supports immigration-native arrangement by evidentiary criterion (O-1, EB-1, EB-2 NIW).

2. **`o1-petition-narrative`** — Drafts the O-1A/O-1B support letter (cover letter / petition brief) from a document index. Criterion-by-criterion argument with exhibit references, following the standard immigration law firm format. Consumes output from document-summary-arrangement.

## Knowledge Base

`knowledge/` — Reference playbook that gets smarter with every case. The o1-petition-narrative skill reads these files to produce better arguments.

```
knowledge/
├── o1a/
│   ├── overview.md              # O-1A standard, Kazarian framework, adjudicator mindset
│   ├── criteria/01-08           # Each criterion: legal standard, evidence hierarchy,
│   │                              argument patterns, RFE triggers, facts bank
│   └── rfe-patterns.md          # Cross-criterion RFE patterns + RFE log
├── eb1a/                        # (planned — same structure, 10 criteria)
├── eb2-niw/                     # (planned — 3 Dhanasar prongs)
└── shared/
    ├── evidence-hierarchy.md    # Universal evidence weighting (Tier 1-4)
    ├── argument-patterns.md     # Reusable argument structures
    └── uscis-policy-alerts.md   # Key policy citations (PA-2022-03, Kazarian, Dhanasar)
```

**How to improve the knowledge base:**
- After an RFE: add to the relevant criterion file + `rfe-patterns.md`
- After a win: add anonymized argument patterns
- After web research: add verified org stats to the Facts Bank

## Workflow

```
Source documents → document-summary-arrangement → document index
                                                       ↓
                  knowledge/ (criterion playbooks) → o1-petition-narrative → petition package
```

## Planned Skills

- **Case Chronology** — Builds a timeline from the document index
- **Contract Review** — Clause-by-clause analysis with risk flags
- **Expert Letter Drafter** — Drafts expert/advisory opinion letters for immigration petitions
- **Deposition Prep** — Identifies exhibits, contradiction points, and question outlines
- **Discovery Response** — Matches documents to discovery requests
- **Privilege Log** — Drafts privilege log entries from flagged documents
- **Legal Research Memo** — Issue-spotting and authority research
- **Client Letter** — Plain-language summary of legal status for clients

## Skill Structure

```
<skill-name>/
├── skill.md      ← Agent prompt
└── README.md     ← Install instructions
```

## `workspace/` Directory

Gitignored. Client work goes here: `workspace/<matter-name>/`. Contains extracted text, summaries, and indexes per matter. Never commit client data.

## Key Rules

- **Factual and neutral** — skills describe what documents say, never draw legal conclusions
- **Privilege-aware** — potentially privileged docs are flagged with minimal detail
- **No fabrication** — if it's not in the document, don't invent it
- **Lawyer decides** — skills produce organized information for the lawyer's judgment, not legal advice
