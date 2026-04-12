# Case Strength Assessor

**Optional skill — not required for any pipeline.** Pre-draft assessment of case strength using only the **document index** from `document-summary-arrangement`. Rates each O-1A/EB-1A criterion or each NIW Dhanasar prong (STRONG / MODERATE / WEAK / INSUFFICIENT) when the team wants a separate read before investing in narrative drafting.

## Install

```json
{
  "skills": ["./case-strength-assessor/skill.md"]
}
```

## What it does

1. **Maps** indexed documents to the correct criteria (O-1A/EB-1A) or prongs (NIW)  
2. **Weights** evidence using the universal Tier 1–4 hierarchy from `knowledge/evidence-hierarchy.md`  
3. **Flags** misclassified evidence, letter-only stacks, and missing corroboration  
4. **Synthesizes** overall drafting readiness, prioritized gaps, and recommended sequencing  

## What it is not

- **Not legal advice** and **not a prediction of USCIS approval**  
- **Not a substitute** for attorney judgment on strategy  
- **Does not** read full exhibit PDFs unless you provide them — it is designed for the **document index** output  

## Workflow

Default path: `document-summary-arrangement` → document index → narrative skills (no assessor required).

```
document-summary-arrangement  →  document index
         │
         └── (optional only) case-strength-assessor  →  strength assessment
```

After that, continue with `o1-petition-narrative`, `eb1a-petition-narrative`, or `niw-petition-narrative` as you would have without this skill.

## Usage

```
/case-strength-assessor
```

Provide the path to your `document_index.md` (or equivalent) and the target petition type (O-1A, EB-1A, NIW).
