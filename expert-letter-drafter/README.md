# Expert Letter Drafter

Drafts expert, reference, and recommendation letters for immigration petitions. Strategically assigns criteria to experts based on credentials, ensures no overlap between letters, and produces ready-to-customize drafts.

## Install

```json
{
  "skills": ["./expert-letter-drafter/skill.md"]
}
```

## What it does

1. **Intake** — Gather expert roster with credentials and relationship to beneficiary
2. **Strategy** — Assign criteria/topics to each expert based on what they can credibly speak to
3. **Draft** — Write each letter with a unique angle, natural voice, and specific verifiable facts
4. **Review** — Verify no overlap, full criteria coverage, and at least one independent expert

## Expert strength ranking

| Type | Strength |
|------|----------|
| Independent expert (no business relationship) | Strongest |
| Industry leader (different company, same field) | Strong |
| Collaborator/partner (different org) | Good |
| Former supervisor (direct knowledge) | Good |
| Current colleague/co-founder | Weakest |

## What makes a strong letter

- Writer has impressive, verifiable credentials
- Explains specifically HOW they know the beneficiary's work
- Cites specific facts and projects, not generic praise
- Offers expert comparison to others in the field
- Sounds like the EXPERT wrote it — not a lawyer
- References verifiable facts the expert can defend if questioned

## Output

Single file: `expert_letters.md` with strategy matrix, coverage check, all letter drafts, and notes for attorney.

## Workflow

```
document index + petition package
       ↓
expert-letter-drafter → letter drafts
       ↓
Expert reviews, customizes, signs
       ↓
Letters become exhibits in the petition
```

## Usage

```
/expert-letter-drafter
```
