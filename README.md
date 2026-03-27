# Aruj Shukla Website

Personal academic website for Aruj Shukla.

Live site:
- `https://arujshukla.github.io/`

This repository contains the Jekyll source for the public site, including:
- homepage and navigation
- research, teaching, and resources pages
- publication pages and PDF assets

## Local Preview

Run the site locally with:

```bash
LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 bundle exec jekyll serve
```

Then open:

```text
http://127.0.0.1:4000/
```

## Deployment

GitHub Pages is configured to deploy from:
- branch: `master`
- folder: `/ (root)`

Typical deploy flow:

```bash
git checkout master
git merge --ff-only interior-pages-approved
git push origin master
```

## Layout Notes

The interior pages (`Research`, `Teaching`, `Resources`) use a shared layout system documented in [`SITE_RULES.md`](SITE_RULES.md).

The main positioning controls live in:
- [`_sass/_custom.scss`](_sass/_custom.scss)

The key shared variables are:
- `--interior-frame-shift`
- `--interior-frame-max`
- `--interior-rail-shift`
- `--interior-content-offset`
- `--interior-gap`
- `--interior-content-right-pad`

## Repo Notes

- Internal planning files are kept in the repo for maintenance, but should not be published to the site.
- This repo is the source of truth for the live site, not a generic template.
