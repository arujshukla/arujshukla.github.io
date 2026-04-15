# AGENTS.md

This file gives standing instructions to coding agents working in this repository.

The goal is to keep the site easy to maintain, visually stable, and safe to update without reintroducing template baggage or deployment churn.

## Mission

Maintain and incrementally improve Aruj Shukla's website.

Priorities, in order:

1. preserve the live site's approved look and behavior
2. avoid breaking GitHub Pages deployment
3. keep the repository lean and close to the actual live site
4. prefer simple, centralized solutions over scattered one-off fixes

## Active Site Surface

Treat these as the core pages:

- homepage/about
- research
- teaching
- resources
- cv redirect

Do not assume old academicpages template patterns are still active.

## Source Of Truth

Before making changes, check:

- `MAINTENANCE_NOTES.md`
- `_sass/_custom.scss`
- `_includes/scripts.html`
- `_includes/head/custom.html`
- `_data/navigation.yml`

`MAINTENANCE_NOTES.md` records what previously failed and what ultimately worked.

## Visual Rules

Preserve the current approved visual output unless the user explicitly asks for visual change.

Important rule:

- do not casually refactor layout code just because a cleaner abstraction seems possible
- if a refactor changes the visible output, it is not acceptable without approval

For `Research`, `Teaching`, and `Resources`:

- prefer shared upstream layout controls over page-specific nudges
- if all three should move together, change shared variables in `_sass/_custom.scss`
- avoid reintroducing page-by-page alignment hacks unless the user explicitly approves them

## Link Behavior

Current intended behavior:

- external links open in a new tab
- asset/file links open in a new tab
- internal site navigation stays in the same tab

This logic lives in:

- `_includes/scripts.html`

If link behavior changes, fix the central logic there rather than scattering `target="_blank"` across markup.

## Head / Icons / Metadata

The head configuration was simplified to avoid broken icon references.

If editing `_includes/head/custom.html`:

- only reference files that actually exist in `images/`
- do not reintroduce missing favicon/apple-touch/manifest paths without also adding the files

## Deployment Rules

GitHub Pages deployment is sensitive.

Assume:

- deployment should remain server-side
- keep the current working Pages setup unless the user explicitly asks to revisit deployment

Before changing deploy-related files:

- confirm whether the change is truly necessary
- prefer minimal fixes
- avoid experimenting with alternate deploy systems unless the user asks

## Safe Workflow

### Content updates

For normal quarterly/content updates:

1. update text/files first
2. preview locally
3. verify key pages
4. push only after content is correct

### Layout or styling updates

1. identify the one shared control responsible
2. change one thing at a time
3. preview before making additional edits
4. avoid mixing layout work with cleanup or deploy work

### Deploy-sensitive work

1. make the smallest possible change
2. verify local build/preview if relevant
3. do not change deployment architecture casually

## Repo Hygiene

Keep the repo close to the live site.

Avoid reintroducing:

- demo/template pages
- unused collections
- markdown generators unless actively needed
- talkmap/blog/template artifacts unless deliberately restored
- stray planning files that are no longer useful

When removing content:

- check `_config.yml`
- check navigation
- check includes/layouts for references
- remove empty folders if they are no longer needed

## When To Pause And Ask

Ask before:

- changing deployment strategy
- changing the top-level visual identity significantly
- deleting content that may still matter historically
- restoring large chunks of template functionality

Do not ask before:

- small content edits
- small CSS fixes with clear local scope
- cleanup of clearly unused template debris, as long as references are checked first

## Preferred Mindset

Work like a maintainer, not a theme author.

That means:

- preserve what works
- simplify where safe
- centralize behavior where possible
- do not chase elegance at the expense of a stable live site
