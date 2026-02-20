#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/release.sh <patch|minor|major> "Changelog entry line 1" "Line 2" ...
# Example: ./scripts/release.sh minor "Added new token scopes for Python" "Fixed bracket colors"
#
# This script bumps the version, updates CHANGELOG.md, and commits.
# Then push to main and create a GitHub Release to trigger publishing.

BUMP="${1:?Usage: release.sh <patch|minor|major> \"change 1\" \"change 2\" ...}"
shift

if [ $# -eq 0 ]; then
  echo "Error: provide at least one changelog entry"
  exit 1
fi

# Ensure working tree is clean
if [ -n "$(git status --porcelain)" ]; then
  echo "Error: working tree is not clean. Commit or stash changes first."
  exit 1
fi

# Read current version
CURRENT=$(node -p "require('./package.json').version")
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT"

case "$BUMP" in
  patch) PATCH=$((PATCH + 1)) ;;
  minor) MINOR=$((MINOR + 1)); PATCH=0 ;;
  major) MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0 ;;
  *) echo "Error: first argument must be patch, minor, or major"; exit 1 ;;
esac

NEW_VERSION="${MAJOR}.${MINOR}.${PATCH}"
TODAY=$(date +%Y-%m-%d)

echo "Bumping $CURRENT → $NEW_VERSION"

# Update package.json version
node -e "
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
pkg.version = '${NEW_VERSION}';
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
"

# Build changelog entry
ENTRY="## [${NEW_VERSION}] - ${TODAY}\n\n### Changed\n"
for line in "$@"; do
  ENTRY="${ENTRY}\n- ${line}"
done
ENTRY="${ENTRY}\n"

# Insert after "# Changelog\n"
node -e "
const fs = require('fs');
let cl = fs.readFileSync('CHANGELOG.md', 'utf8');
cl = cl.replace('# Changelog\n', '# Changelog\n\n${ENTRY}');
fs.writeFileSync('CHANGELOG.md', cl);
"

# Commit
git add package.json CHANGELOG.md
git commit -m "chore: release v${NEW_VERSION}"

echo ""
echo "Released v${NEW_VERSION}"
echo ""
echo "Next steps:"
echo "  1. git push"
echo "  2. Create a GitHub Release at: https://github.com/agzertuche/chilaquiles-theme/releases/new"
echo "     Tag: v${NEW_VERSION}  |  Title: v${NEW_VERSION}"
