# RFE Response Drafter

Analyzes a USCIS Request for Evidence, diagnoses what went wrong in the original petition, and drafts a point-by-point response with new evidence strategy.

## Install

```json
{
  "skills": ["./rfe-response-drafter/skill.md"]
}
```

## What it does

1. **RFE Intake** — Reads the RFE letter, extracts every deficiency with exact USCIS language
2. **Original Case Analysis** — Reads the original petition, identifies root causes (wrong evidence type, missing sub-element, self-serving evidence only, legal misframing, etc.)
3. **Gap Analysis** — Maps each deficiency to what's fixable vs. what should be dropped, with strategic assessment and risk level
4. **Response Strategy** — Plans new evidence for each deficiency, assigns action items to attorney and client
5. **Draft Response** — Writes the response letter point by point, mirroring USCIS's structure
6. **Output** — Single package with analysis, evidence checklist, response draft, and action items with deadline

## Root cause diagnosis

The skill identifies WHY each criterion failed:

| Root Cause | What Happened |
|-----------|--------------|
| No evidence submitted | Criterion claimed but nothing supported it |
| Wrong evidence type | E.g., Crunchbase profile submitted as "published material" |
| Evidence too weak | Support letters with no independent corroboration |
| Missing sub-element | Proved membership but not that org "requires outstanding achievements" |
| Legal misframing | VC funding argued as "award" without meeting regulatory definition |
| Self-serving evidence only | All letters from co-founders/colleagues |
| Stale or irrelevant | Evidence doesn't relate to field or is too old |

## The three rules

1. **Address EVERY deficiency** — don't skip any
2. **Submit NEW evidence** — repeating original exhibits almost always fails
3. **Don't just reargue — add** — every point needs both argument AND new evidence

## Output

Single file: `rfe_response_package.md` with RFE analysis, new evidence checklist (with action items), response letter draft, and deadline tracking.

## Workflow

```
RFE letter + original petition
       ↓
rfe-response-drafter → analysis + response draft
       ↓
petition-audit → verify response
       ↓
Attorney reviews, gathers new evidence, files by deadline
```

## Usage

```
/rfe-response-drafter
```
