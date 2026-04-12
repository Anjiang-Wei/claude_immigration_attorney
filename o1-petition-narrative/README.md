# O-1 Petition Narrative Drafter

Drafts the O-1A/O-1B petition support letter with full evidence verification. Every factual claim must be backed by a document exhibit or a verified web source — zero unverified claims allowed.

## Install

```json
{
  "skills": ["./o1-petition-narrative/skill.md"]
}
```

## What it does

1. **Case Setup** — Gathers petition details, confirms which criteria are being argued
2. **Exhibit Table** — Maps documents to numbered exhibits, grouped by criterion
3. **Evidence Enrichment** — Web-searches every entity (org, award, publication, employer) for verifiable facts: acceptance rates, member counts, founding dates, AUM, circulation figures. Builds a source registry.
4. **Criterion Arguments** — Drafts each criterion using ONLY sourced facts. Vague adjectives replaced with cited numbers.
5. **Assembly** — Produces one consolidated document for attorney review

## Output: Single file

Everything in one document — `petition_package.md`:

| Part | Contents |
|------|----------|
| **Part 1: Support Letter** | Full petition brief with exhibit table + all criterion arguments |
| **Part 2: Source Registry** | Every fact traced to either a client document or web URL with exact quote |
| **Part 3: Web Sources** | Attorney action checklist — verify URL, print, assign exhibit number |
| **Part 4: Evidence Gaps & Flags** | Missing exhibits, unverified claims, document discrepancies, strength assessment |

## The cardinal rule

Every factual assertion → must have a source:

| Bad (unsourced) | Good (sourced) |
|-----------------|----------------|
| "renowned for its rigorous selection criteria" | "maintains an acceptance rate of ~10-11% (See Exhibit 20)" |
| "one of the most prominent VC firms" | "managing over $35B in assets with 1,000+ portfolio companies (Web Source 3)" |
| "a highly selective fellowship" | "reviewed thousands of applications to select the ODF19 cohort (See Exhibit 26)" |

## Evidence tiers

| Tag | Meaning | Citation in letter |
|-----|---------|-------------------|
| `DOC` | From client's documents | "(See Exhibit X)" |
| `WEB` | From web research with URL | "(Web Source N)" — attorney converts to exhibit after printing |
| `UNVERIFIED` | Searched but not found | **OMITTED from letter** — flagged for attorney |

## Prerequisites

Run **document-summary-arrangement** first to build the document index.

**Optional:** Run **case-strength-assessor** on the index for a pre-draft frank assessment of which criteria look strong, moderate, or weak before you invest in narrative drafting (`/case-strength-assessor`).

## Usage

```
/o1-petition-narrative
```
