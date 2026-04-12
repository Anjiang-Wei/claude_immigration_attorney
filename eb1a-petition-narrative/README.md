# EB-1A Petition Narrative Drafter

Drafts EB-1A (extraordinary ability green card) petition support letters. Same criteria as O-1A but stricter — requires sustained acclaim, intent to continue work, and substantial U.S. benefit.

## Install

```json
{
  "skills": ["./eb1a-petition-narrative/skill.md"]
}
```

## How EB-1A differs from O-1A

| | O-1A | EB-1A |
|---|---|---|
| Type | Temporary visa | Green card |
| Form | I-129 | I-140 |
| Criteria | 3 of 8 | 3 of 10 (+commercial success, +display of work) |
| Scrutiny | More lenient | Stricter |
| Step 2 (totality) | Important | Critical — most denials happen here |
| Extra requirements | Advisory opinion | Continue to work + substantially benefit U.S. |

## What it adds beyond O-1A skill

- **Step 2 totality argument** — dedicated section proving "sustained" acclaim across multiple years
- **"Continue to work" section** — with documentary evidence
- **"Substantially benefit U.S." section** — with employer/industry letters
- **Two additional criteria** — display of work (artists/designers) and commercial success (performing arts)
- **Stricter evidence standard** — independent evidence required for every criterion, letters alone insufficient
- **EB-1A-specific checklist** — ensures nothing unique to EB-1A is missed

## Output

Single file: `eb1a_petition_package.md` — support letter, source registry, web sources, evidence gaps, and EB-1A-specific checklist.

## Prerequisites

Run **document-summary-arrangement** first to build the document index.

**Optional:** Run **case-strength-assessor** on the index before drafting for a pre-draft assessment of criterion strength and EB-1A Step 2 readiness (`/case-strength-assessor`).

## Usage

```
/eb1a-petition-narrative
```
