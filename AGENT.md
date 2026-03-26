# Claude for Legal — Skills

Claude Code skills for lawyers. Each skill handles a specific legal workflow, designed to be used on real matters.

## Skills

1. **`document-summary-arrangement`** — Reads source documents (PDF, scans, images), triages by importance, summarizes key documents, classifies by type, and produces a structured document index. The foundational skill — every other legal workflow starts here. Supports immigration-native arrangement by evidentiary criterion (O-1, EB-1, EB-2 NIW).

2. **`o1-petition-narrative`** — Drafts O-1A/O-1B support letters from a document index. Criterion-by-criterion with exhibit references and evidence enrichment.

3. **`niw-petition-narrative`** — Drafts EB-2 NIW self-petition support letters using the Dhanasar three-prong framework. First-person, forward-looking, with national importance argument backed by government statistics.

## Knowledge Base

`knowledge/` — Reference playbook for O-1A, EB-1A, and EB-2 NIW. Gets smarter with every case.

```
knowledge/shared/
├── overview-o1a-eb1a.md         # Extraordinary ability standard + Kazarian framework
├── overview-niw.md              # NIW standard + Dhanasar framework + letter structure
├── criteria/01-08               # Shared O-1A/EB-1A criteria: legal standard, evidence
│                                  hierarchy, argument patterns, best practices
├── prongs/01-03                 # NIW Dhanasar prongs: substantial merit, well positioned,
│                                  national interest balance
├── evidence-hierarchy.md        # Universal evidence weighting (Tier 1-4)
├── argument-patterns.md         # Reusable argument structures
└── uscis-policy-alerts.md       # Key policy citations
```

**How to improve:**
- After a case: add best practices to the relevant criterion/prong file
- After a win: add anonymized argument patterns

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
