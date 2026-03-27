# REVAMP_SPEC.md

## Implementation Rules (MANDATORY)

- Keep Jekyll and GitHub Pages compatibility.
- Do NOT introduce new frameworks or major dependencies.
- Do NOT rewrite the entire codebase.
- Only modify files necessary for this redesign.
- Preserve existing URLs unless absolutely necessary.
- Work strictly in phases. Do NOT combine phases.
- After completing each phase, STOP and report changes.

## Task Instructions for Codex

Then:

1. Summarize the current site structure in 5 bullets.
2. Identify which files will need modification.
3. Implement Phase 1 ONLY.
4. Ensure the site builds successfully.
5. Stop and wait for review.

## Design Direction

The site should feel like a modern research homepage, not a default academic template.

Visual language:
- text-led
- generous white space
- strong typography
- minimal ornament
- subtle interaction only where useful

Tone:
- editorial
- rigorous
- calm
- professional

NOT:
- startup landing page
- portfolio site
- blog-heavy design

## Non-Goals

- No heavy animations
- No carousels
- No card-based dashboard UI
- No flashy visual effects
- No template-heavy academic theme feel
- No dominant sidebar layout on key pages

## Primary Goals

- Emphasize research and papers
- Improve clarity and scanability
- Reduce template feel
- Maintain easy Markdown-based updates

## Information Architecture (FIXED)

Top navigation:

- Research
- Publications
- Teaching
- Resources
- CV

Homepage will function as About page.

## Page Roles

### Home
- Name
- Role and affiliation
- 2–4 sentence research summary
- Links: CV, email, Google Scholar, GitHub
- 2–5 featured works (with optional abstract toggle)
- Optional: short updates or teaching snapshot

### Research
- Working papers and projects
- Grouped by status:
  - Working Papers
  - Work in Progress

### Publications
- Published work only
- Clean archive-style layout

### Teaching
- Concise list + links

### Resources
- Notes, datasets, links

### CV
- Direct PDF link or simple HTML summary

## Data Model (IMPORTANT)

Required fields:
- title
- year
- status
- link

Optional fields:
- coauthors
- abstract
- code
- appendix
- tags

## Homepage Layout Rules

- Single main reading column (no dominant sidebar)
- No large hero image
- Optional small profile image only if non-dominant

## Phase Plan

### Phase 1 — Structure ONLY
- Navigation update
- Homepage sections defined
- Data model standardized
- Sidebar decisions implemented

### Phase 2 — Presentation
- Typography
- Spacing
- Widths

### Phase 3 — Research UX
- Publication layout redesign
- Abstract toggle

### Phase 4 — Polish
- Mobile improvements
- Visual consistency

## Verification Checklist

- Site builds successfully
- No broken links
- Navigation works correctly

## Success Criteria

- Homepage feels intentional
- Publications are scannable
- Site no longer resembles default template
