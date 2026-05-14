#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$ROOT_DIR/scripts/update-cv.env"
TARGET_REL="files/pdf/cv/aruj-shukla-cv-2026.pdf"
TARGET_PATH="$ROOT_DIR/$TARGET_REL"
SOURCE_PATH="${CV_SOURCE_PATH:-}"
COMMIT_MESSAGE="${COMMIT_MESSAGE:-Update CV PDF}"
PUSH_REMOTE="${PUSH_REMOTE:-origin}"
PUSH_BRANCH="${PUSH_BRANCH:-master}"
DO_PUSH=1

if [[ -f "$ENV_FILE" ]]; then
  # shellcheck disable=SC1090
  source "$ENV_FILE"
fi

usage() {
  cat <<'EOF'
Usage: scripts/update-cv.sh [--source /path/to/cv.pdf] [--no-push]

Copies the latest CV PDF into the website, commits it, and pushes to GitHub Pages.

Options:
  --source PATH   Override the default Dropbox CV source path.
  --no-push       Commit locally but skip the final git push.
  -h, --help      Show this help message.

Environment overrides:
  CV_SOURCE_PATH  Path to the source CV PDF.
  COMMIT_MESSAGE  Commit message to use. Default: "Update CV PDF"
  PUSH_REMOTE     Git remote to push to. Default: "origin"
  PUSH_BRANCH     Git branch to push to. Default: "master"

Optional local config:
  scripts/update-cv.env
    Example contents:
      CV_SOURCE_PATH="/absolute/path/to/your/cv.pdf"
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --source)
      if [[ $# -lt 2 ]]; then
        echo "error: --source requires a path" >&2
        exit 1
      fi
      SOURCE_PATH="$2"
      shift 2
      ;;
    --no-push)
      DO_PUSH=0
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "error: unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "${SOURCE_PATH:-}" ]]; then
  echo "error: source path not set" >&2
  echo "Set CV_SOURCE_PATH, create scripts/update-cv.env, or pass --source PATH." >&2
  exit 1
fi

if [[ ! -f "$SOURCE_PATH" ]]; then
  echo "error: source file not found: $SOURCE_PATH" >&2
  exit 1
fi

if [[ ! -f "$TARGET_PATH" ]]; then
  echo "error: target file not found: $TARGET_PATH" >&2
  exit 1
fi

SOURCE_SHA="$(shasum -a 256 "$SOURCE_PATH" | awk '{print $1}')"
TARGET_SHA="$(shasum -a 256 "$TARGET_PATH" | awk '{print $1}')"

echo "Source: $SOURCE_PATH"
echo "Target: $TARGET_PATH"
echo "Source SHA256: $SOURCE_SHA"
echo "Target SHA256: $TARGET_SHA"

if [[ "$SOURCE_SHA" == "$TARGET_SHA" ]]; then
  echo "CV is unchanged. Nothing to do."
  exit 0
fi

cp "$SOURCE_PATH" "$TARGET_PATH"
echo "Copied updated CV into $TARGET_REL"

git -C "$ROOT_DIR" add "$TARGET_REL"

if git -C "$ROOT_DIR" diff --cached --quiet -- "$TARGET_REL"; then
  echo "No staged changes detected after copy. Nothing to commit."
  exit 0
fi

git -C "$ROOT_DIR" commit -m "$COMMIT_MESSAGE"

if [[ "$DO_PUSH" -eq 1 ]]; then
  git -C "$ROOT_DIR" push "$PUSH_REMOTE" "$PUSH_BRANCH"
  echo "Pushed $PUSH_BRANCH to $PUSH_REMOTE."
else
  echo "Skipped push. Commit is local only."
fi
