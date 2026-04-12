# NIW National Importance Research

Researches authoritative U.S. government sources to build the national importance argument for an EB-2 NIW petition. Finds quotable statistics, national plans, and federal initiatives — then matches them to the petitioner's specific background.

## Install

```json
{
  "skills": ["./niw-national-importance-research/skill.md"]
}
```

## What it does

1. **Intake** — Understand the petitioner's field, endeavor, background
2. **Source Research** — Find government statistics on the national problem (CDC, NIH, BLS, NSF, etc.)
3. **Policy Research** — Find executive orders, national plans, federal funding aligned with the endeavor
4. **Match** — Connect each source to the petitioner's specific work with a quotable connection statement
5. **Output** — Single research document ranked by relevance

## Source priority

| Tier | Source Type | Examples |
|------|-----------|---------|
| 1 | Government statistics | CDC data, BLS projections, NIH reports |
| 2 | Government policy & plans | Executive orders, CHIPS Act, Cancer Moonshot, national strategies |
| 3 | Published research | GAO reports, National Academies, peer-reviewed studies |
| 4 | Industry data | McKinsey, Deloitte, WEF (supplement only) |

## Output

Single file: `national_importance_research.md` containing:
- Problem statement with top statistics
- Ranked sources with exact quotes and connection to petitioner
- National plans and initiatives with alignment statements
- Federal funding data
- Workforce and competitiveness data
- Sources searched but not used (prevents duplicate research)

## Workflow

```
document-summary-arrangement  →  document index
                                       ↓
                    /niw-national-importance-research  →  research document
                                       ↓
                         /niw-petition-narrative  →  petition package
```

Run **niw-national-importance-research** before drafting the NIW petition. The petition skill consumes this research.

**Optional (skip by default):** `/case-strength-assessor` on the document index — only if you want a separate pre-draft strength report; **not required** for this workflow.

## Usage

```
/niw-national-importance-research
```
