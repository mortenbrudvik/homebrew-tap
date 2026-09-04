#!/bin/zsh
# Usage: ./bump.sh 0.1.3
# Points the cask at the GitHub release for that version: downloads the asset to prove it
# exists, records its sha256, checks the style, and commits. Push afterwards.
set -euo pipefail
version=${1:?usage: bump.sh <version>}
url="https://github.com/mortenbrudvik/loadstone/releases/download/v${version}/Loadstone-${version}.zip"
cask=Casks/loadstone.rb
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

curl -fsSL -o "$tmp" "$url"
sha=$(shasum -a 256 "$tmp" | cut -d' ' -f1)
sed -i '' -E "s/^  version \".*\"$/  version \"${version}\"/; s/^  sha256 \".*\"$/  sha256 \"${sha}\"/" "$cask"
brew style "$cask"
git add "$cask"
git commit -m "Update loadstone to ${version}"
echo "Committed loadstone ${version} (${sha}). Now run: git push"
