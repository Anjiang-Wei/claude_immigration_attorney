# Claude for Legal

Skills and knowledge base for immigration petition work. Covers O-1A, EB-1A, and EB-2 NIW.

## Knowledge Base — READ THIS FIRST

**Before drafting any petition, read the relevant knowledge files.** They contain best practices, evidence hierarchies, and argument patterns distilled from real cases.

```
knowledge/
├── overview-o1a-eb1a.md       # O-1A/EB-1A standard, Kazarian two-step, adjudicator behavior
├── overview-niw.md            # NIW standard, Dhanasar three-prong, letter structure
├── criteria/                  # O-1A/EB-1A criteria (used by o1-petition-narrative)
│   ├── 01-awards.md
│   ├── 02-membership.md
│   ├── 03-published-material.md
│   ├── 04-original-contributions.md
│   ├── 05-scholarly-articles.md
│   ├── 06-critical-employment.md
│   ├── 07-high-remuneration.md
│   └── 08-judging.md
├── prongs/                    # NIW Dhanasar prongs (used by niw-petition-narrative)
│   ├── 01-substantial-merit.md
│   ├── 02-well-positioned.md
│   └── 03-national-interest-balance.md
├── evidence-hierarchy.md      # Universal evidence weighting (Tier 1-4)
├── argument-patterns.md       # Reusable argument structures
└── uscis-policy-alerts.md     # Key policy citations (PA-2022-03, Kazarian, Dhanasar)
```

**When to read what:**
- Drafting O-1A/EB-1A → read `overview-o1a-eb1a.md` + all relevant `criteria/` files + `argument-patterns.md`
- Drafting NIW → read `overview-niw.md` + all `prongs/` files + `argument-patterns.md`
- Any petition → read `evidence-hierarchy.md` + `uscis-policy-alerts.md`

## Skills

| Skill | What It Does | Reads Knowledge |
|-------|-------------|-----------------|
| `document-summary-arrangement` | Indexes source documents, triages by importance, classifies by type | — |
| `o1-petition-narrative` | Drafts O-1A/O-1B support letters with evidence enrichment | `criteria/`, `overview-o1a-eb1a.md` |
| `eb1a-petition-narrative` | Drafts EB-1A green card petitions — stricter than O-1A, adds sustained acclaim + totality argument | `criteria/`, `overview-o1a-eb1a.md` |
| `niw-national-importance-research` | Researches gov sources, national plans, federal funding for the NIW national importance argument | `prongs/01-substantial-merit.md`, `overview-niw.md` |
| `niw-petition-narrative` | Drafts EB-2 NIW self-petition letters (Dhanasar framework) | `prongs/`, `overview-niw.md` |

## Workflow

```
Source documents → document-summary-arrangement → document index
                                                       ↓
              knowledge/ (read first) → o1-petition-narrative            → O-1A petition package
                                      → eb1a-petition-narrative          → EB-1A petition package
                                      → niw-national-importance-research → research document
                                        → niw-petition-narrative         → NIW petition package
```

## Planned Skills

- **Expert Letter Drafter** — Drafts expert/advisory opinion letters for immigration petitions
- **Case Chronology** — Builds a timeline from the document index
- **Contract Review** — Clause-by-clause analysis with risk flags

## Key Rules

- **Every claim backed by evidence** — document exhibit or verified web source, no exceptions
- **No fabrication** — if it's not in the documents, don't invent it
- **No client PII in knowledge/** — all case lessons must be anonymized
- **Lawyer decides** — skills produce drafts for attorney review, not legal advice

## workspace/

Gitignored. Client work goes here: `workspace/<matter-name>/`. Never commit client data.
