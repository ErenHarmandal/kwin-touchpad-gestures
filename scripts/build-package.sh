#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
pkgdir="$repo_root/packaging/arch"

cd "$pkgdir"
makepkg --verifysource --skippgpcheck -f
makepkg -e --skippgpcheck -f

latest_package="$(find "$pkgdir" -maxdepth 1 -type f -name 'kwin-*.pkg.tar.zst' -printf '%T@ %p\n' | sort -n | tail -n 1 | cut -d' ' -f2-)"
if [[ -n "$latest_package" ]]; then
    printf 'Built package: %s\n' "$latest_package"
fi
