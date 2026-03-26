# Petition Audit

Audits a generated petition letter for factual accuracy, unsupported claims, legal errors, and internal consistency. The last line of defense before the attorney signs.

## Install

```json
{
  "skills": ["./petition-audit/skill.md"]
}
```

## What it does

1. **Claim Extraction** — Extracts every factual claim from the letter (numbers, dates, titles, metrics, legal citations, superlatives)
2. **Verification** — Checks each claim against source documents and web sources
3. **Legal Review** — Checks for missing legal elements, criterion misapplication, and structural errors
4. **Consistency Check** — Cross-checks names, dates, titles, amounts across the entire letter
5. **Report** — Produces a severity-rated audit report with a claim-by-claim verification log

## Severity ratings

| Severity | Meaning | Example |
|----------|---------|---------|
| **CRITICAL** | Could cause denial or fraud finding — must fix | "50K monthly users" when source says "50K total" |
| **WARNING** | Weakens the petition — should fix | Unsupported superlative, outdated statistic |
| **INFO** | Attorney should be aware | Web source URL may expire, argument could be strengthened |

## Verdicts

- **READY FOR REVIEW** — 0 critical findings, attorney can review and sign
- **NEEDS FIXES** — 1+ critical or 3+ warnings, must address before filing
- **MAJOR ISSUES** — structural errors or fabricated claims, needs rework

## Workflow

```
o1-petition-narrative   →  petition package  →  petition-audit  →  audit report
eb1a-petition-narrative →  petition package  →  petition-audit  →  audit report
niw-petition-narrative  →  petition package  →  petition-audit  →  audit report
```

Always run the audit AFTER drafting and BEFORE attorney review.

## Usage

```
/petition-audit
```
