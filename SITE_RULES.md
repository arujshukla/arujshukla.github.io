# Site Rules

This file captures the current visual and layout decisions for the site so future edits can be made without reopening settled choices.

## General

- Keep the site on Jekyll/GitHub Pages.
- Preserve the current top nav structure unless explicitly changed:
  - `Research`
  - `CV`
  - `Teaching`
  - `Resources`
- Do not move the top nav alignment unless explicitly requested.
- When in doubt, move page content to match the nav, not the nav to match the page.

## Typography

- Body and nav tabs use `Source Sans Pro`.
- The site name in the top nav uses `Cormorant Garamond`.
- Use the existing color palette:
  - background: `#F7F4EF`
  - primary text: `#2B2B2B`
  - headings/links/accent: `#841617`
  - secondary text: `#6B6B6B`
  - borders/dividers: `#E3DED6`

## Navigation

- The top nav is static, not collapsible, on desktop.
- Keep the gray hover underline on the nav tabs.
- Do not reintroduce the old hamburger/greedy-nav behavior for desktop.

## Homepage

- Keep the homepage simple:
  - photo on the left
  - intro blurb on the right
  - contact links beneath the blurb
- The homepage text block is aligned intentionally against the nav and should not be casually retuned.
- If homepage alignment needs tuning, adjust only the homepage content block, not the nav.

## Research Page

- Treat the research page as the alignment source of truth for interior pages.
- Keep the current research-page left/right geometry locked unless explicitly requested.
- The `Jump to` block position is intentional and should not be moved casually.
- Research entries should render as compact bullet-style items with a red triangle marker.
- Entry spacing should remain tight:
  - minimal gap between title, coauthors, metadata, and links
  - no large paragraph margins within entries
- Abstracts should expand inline from the `abstract` link.
- Only the designated working paper should have its own standalone paper page.

## Interior Page Template

- `Research`, `Teaching`, and `Resources` all use `layout: interior`.
- The dedicated wrapper is:
  - `interior-page-shell interior-unified-page`
- Inside the page body, the shared shell is:
  - `interior-page`
  - `interior-layout`
  - `interior-rail`
  - `interior-content`
  - `research-page-title`
- The left rail has two modes:
  - populated `interior-rail` for `Research`
  - blank `interior-rail interior-rail--blank` for `Teaching` and `Resources`
- The blank rail must preserve the same geometry as the research rail.
- Do not reintroduce `single.html` wrapper geometry for these pages.
- Do not reintroduce page-specific horizontal nudges for these pages.
- The shared positioning controls live in [`_sass/_custom.scss`](/Users/arujshuk/GitHub/arujshukla.github.io/_sass/_custom.scss):
  - `--interior-frame-shift`
  - `--interior-frame-max`
  - `--interior-rail-shift`
  - `--interior-content-offset`
  - `--interior-gap`
  - `--interior-content-right-pad`
- If these pages need to move together, change only the shared variables above.
- If spacing between the rail and content changes, change only the rail/content variables above.
- Non-research interior pages should use the shared content-entry layer:
  - `section-list`
  - `section-entry`
  - `section-entry__meta`
  - `section-entry__links`

## Teaching Page

- The teaching page should visually track the shared interior-page template.
- Keep the current content structure:
  - institution as `h2`
  - course entries beneath each institution
  - term on the muted metadata line
  - syllabus on the compact links line when present
- If teaching alignment drifts, fix the shared interior variables first, not the nav and not page-specific offsets.

## Resources Page

- Keep the resources page structurally simple unless new content is added.
- It should share the same overall feel as research/teaching, not revert to a default centered Jekyll page.

## Content Rules

- Do not copy CV prose directly onto the site unless explicitly intended.
- Abstracts shown on the site must match the paper abstracts exactly.
- Prefer clean, durable asset filenames under `files/pdf/...`.

## Editing Workflow

- Separate future work into one of these categories before editing:
  - content changes
  - layout changes
  - visual polish
  - interaction changes
- When a page is visually approved, consider its geometry locked.
- Use screenshots plus one-sentence alignment targets when doing visual tuning.

## Practical Guidance

- Best instruction format for visual work:
  - “match page X to page Y”
  - “move this block left/right a little”
  - annotated screenshot if possible
- For multi-page consistency, reuse the working interior-page structure instead of approximating it with new offsets.
