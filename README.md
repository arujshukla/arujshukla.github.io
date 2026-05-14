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
git push origin master
```

## CV Update Script

Create a local untracked config file at `scripts/update-cv.env` with your CV source path:

```bash
CV_SOURCE_PATH="/absolute/path/to/your/cv.pdf"
```

Then update the live CV in one step:

```bash
scripts/update-cv.sh
```

Optional flags:

```bash
scripts/update-cv.sh --source /path/to/another-cv.pdf
scripts/update-cv.sh --no-push
```
