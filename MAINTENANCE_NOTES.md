# Maintenance Notes

This file captures the main lessons from the March 2026 site rebuild/cleanup so future edits start from the working assumptions.

## Current Site Shape

The live site is intentionally lean. The active surface area is:

- homepage/about
- research
- teaching
- econ 203 evaluations
- resources
- cv redirect

Most legacy academicpages content was removed:

- old collections (`_teaching`, `_talks`, `_portfolio`, `_publications`)
- posts/blog sample content
- talkmap tooling
- markdown generator tooling
- demo/template pages

## Interior Page Layout: What Finally Worked

The breakthrough was moving the main interior pages off the inherited `single.html` wrapper interaction and onto a dedicated interior layout system.

Pages using the shared system:

- `/_pages/research.md`
- `/_pages/teaching.md`
- `/_pages/resources.md`

Key idea:

- use one shared interior positioning system
- adjust layout with shared knobs in `_sass/_custom.scss`
- avoid page-by-page nudges unless there is a very strong reason

Important shared variables live in:

- `/_sass/_custom.scss`

Notable controls:

- `--interior-frame-shift`
- `--interior-frame-max`
- `--interior-rail-shift`
- `--interior-content-offset`
- `--interior-gap`
- `--interior-content-right-pad`

Rule of thumb:

- if all three interior pages should move together, change the shared variables
- do not reintroduce per-page horizontal nudges unless absolutely necessary

## What Caused Trouble

### 1. Wrapper interactions

The old theme wrapper stack (`single.html`, `.page`, `.page__inner-wrap`, `.page__content`) interacted badly with the custom interior alignment work.

Lesson:

- if alignment behaves strangely again, inspect wrapper inheritance first
- do not assume the visible content block is the root cause

### 2. Incremental visual tweaks without a stable reference

We lost time trying to nudge `Teaching` into alignment while multiple layout systems were overlapping.

Lesson:

- preserve one known-good reference page
- compare against it methodically
- avoid introducing a new abstraction unless it reproduces the existing approved look

### 3. Unicode and old Pages Sass

The old GitHub Pages/Jekyll stack is brittle with encoding. Raw Unicode glyphs in Sass caused failures.

What we changed:

- replaced raw triangle glyphs in Sass with escaped CSS content values

Lesson:

- prefer ASCII in source files unless there is a strong reason not to
- especially in Sass/CSS that may run through older build tooling

### 4. Missing vendored Sass files

The clean-history repo initially missed vendored Susy Sass `output/` files, which broke builds.

Lesson:

- if CSS compilation suddenly fails after a repo migration, verify vendored asset trees, not just top-level source files

### 5. Deploy portability

The old repo "worked" partly because it was living inside a very specific GitHub Pages environment. It was not as portable as it looked.

Lesson:

- when migrating repos, verify the build contract explicitly
- do not assume "worked before" means "portable as-is"

## GitHub Pages Notes

Current deployment path:

- branch-based GitHub Pages
- `master`
- `/ (root)`

We experimented with GitHub Actions deployment and backed away from it.

Lesson:

- for this site, prefer the simpler branch builder unless there is a compelling reason to change
- if Pages ever breaks again, confirm which build system GitHub is actually using before debugging

## Link Behavior

Current rule:

- external links open in a new tab
- asset/file links open in a new tab
- internal site navigation stays in the same tab

Logic lives in:

- `/_includes/scripts.html`

If this regresses:

- inspect hard-coded `target="_blank"` first
- then inspect the same-site detection logic in `scripts.html`

## Teaching / Evaluations Notes

Teaching page source:

- `/_pages/teaching.md`

ECON 203 evaluations live on a dedicated page:

- `/_pages/econ-203-evaluations.md`

Structured evaluation content lives in:

- `/_data/teaching_evaluations.yml`

Current intended pattern:

- keep the main Teaching page light
- link `evaluations` from the ECON 203 entry to the dedicated page
- keep evaluation summary numbers hand-curated in YAML
- keep selected student feedback curated manually rather than auto-extracted

Asset layout:

- syllabi in `/files/pdf/teaching/syllabus/`
- evaluation PDFs in `/files/pdf/teaching/evaluations/`

For ECON 203:

- each semester is aggregated from two section PDFs
- the dedicated page shows archive-wide summary metrics, selected student feedback, and semester-level cards with links to both raw PDFs

Rule of thumb:

- if updating evaluations, edit the YAML first
- if changing presentation, edit `/_pages/econ-203-evaluations.md` and `/_sass/_custom.scss`
- avoid introducing a parsing pipeline unless the manual workflow becomes genuinely burdensome

## Repo Hygiene Principles

This repo should stay close to the real live site.

Avoid reintroducing:

- demo/template pages
- unused collections
- one-off tooling that is no longer part of the workflow
- broken asset references in head metadata

When removing content:

- check `_config.yml`
- check navigation
- check includes/layouts for any `site.<collection>` references

## Safe Workflow For Future Changes

For visual/layout work:

1. pick one reference page
2. change one variable/system at a time
3. preview locally
4. avoid mixing layout refactors with content rewrites

For deploy-sensitive work:

1. test `bundle exec jekyll serve` or `bundle exec jekyll build` locally
2. keep changes small
3. push only after the local build passes

## If We Return To This Months Later

Start here:

1. read this file
2. inspect `_sass/_custom.scss`
3. inspect `_includes/scripts.html`
4. verify `Settings > Pages` still points to branch deploy from `master`

Default mindset:

- preserve the current visual output
- prefer shared upstream knobs over page-specific CSS
- keep the repo lean
