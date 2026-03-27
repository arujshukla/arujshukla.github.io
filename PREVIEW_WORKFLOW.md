# Preview Workflow

Use this file to review milestone changes before launch.

## Local Preview

From the repo root:

```bash
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 bundle exec jekyll serve
```

Then open:

```text
http://127.0.0.1:4000/
```

If the page seems stale:

```bash
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 bundle exec jekyll build
```

Then hard refresh the browser.

## Milestone Review Pages

### 1. Backend Content Milestone

Review:

- `/`
- `/research/`
- `/teaching/`
- `/resources/`
- `/cv/`

Look for:

- correct file links
- correct external links
- exact abstract text where abstracts are shown
- stable, readable public file URLs

### 2. Research Page Frontend Milestone

Review:

- `/research/`
- `/publication/2025-08-25-urban-insurance-informal-networks`
- `/publication/2024-08-26-supplying-vocational-training-institutes`
- `/publication/2024-05-10-a-tough-call`

Look for:

- paper list scanability
- metadata hierarchy
- abstract toggle behavior
- integration of policy writing with the rest of the page

### 3. Homepage Frontend Milestone

Review:

- `/`

Look for:

- photo and intro alignment
- spacing between image, links, and blurb
- link styling and icon consistency
- calm, intentional hierarchy

### 4. Global Polish Milestone

Review:

- `/`
- `/research/`
- `/teaching/`
- `/resources/`
- `/cv/`

Look for:

- type consistency
- nav and footer polish
- consistent spacing
- mobile behavior
- final color use and contrast

### 5. Final QA Milestone

Check:

- internal links
- external links
- mobile layout
- content correctness
- consistency across all main pages
