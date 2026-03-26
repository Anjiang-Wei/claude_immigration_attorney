# Immigration Petition Knowledge Base

Reference playbook for O-1A, EB-1A, and EB-2 NIW petitions. Gets smarter with every case.

## How to use

1. **Before drafting a petition** — read the relevant criterion files. Check the evidence hierarchy, RFE triggers, and Facts Bank.
2. **After an RFE** — add the RFE to the relevant criterion file under "Lessons from RFEs." Capture: what was argued, exact RFE language, how it was fixed, result.
3. **After an approval** — add anonymized winning argument patterns to the criterion file.
4. **After web research** — add verified org stats to the Facts Bank so the next case doesn't re-research them.

## Structure

```
knowledge/
├── o1a/
│   ├── overview.md              # O-1A standard, burden, adjudicator mindset
│   ├── criteria/
│   │   ├── 01-awards.md         # Each criterion: legal standard, evidence hierarchy,
│   │   ├── 02-membership.md       argument patterns, RFE triggers, facts bank
│   │   ├── ...
│   │   └── 08-judging.md
│   ├── rfe-patterns.md          # Cross-criterion RFE patterns
│   └── case-studies/            # Anonymized win/loss case notes
├── eb1a/                        # Same structure (10 criteria)
├── eb2-niw/                     # 3 Dhanasar prongs
└── shared/
    ├── evidence-hierarchy.md    # Universal evidence weighting
    ├── argument-patterns.md     # Reusable argument structures
    └── uscis-policy-alerts.md   # Key policy citations
```

## Rules

- **No client PII** — anonymize all case references (e.g., "a tech founder" not a real name)
- **Cite sources** — every fact in the Facts Bank needs a URL and verification date
- **RFEs are gold** — always add RFE lessons, even from denied cases
- **Update, don't duplicate** — if an org already exists in the Facts Bank, update the row
