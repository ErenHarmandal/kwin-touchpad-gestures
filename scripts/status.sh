#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
pkgdir="$repo_root/packaging/arch"

installed_version="$(pacman -Q kwin 2>/dev/null | awk '{print $2}' || true)"
latest_package="$(find "$pkgdir" -maxdepth 1 -type f -name 'kwin-*.pkg.tar.zst' -printf '%T@ %p\n' | sort -n | tail -n 1 | cut -d' ' -f2-)"

printf 'Installed kwin: %s\n' "${installed_version:-not installed}"

if [[ -z "$latest_package" ]]; then
    printf 'Latest local package: none\n'
    exit 0
fi

package_version="$(pacman -Qip "$latest_package" 2>/dev/null | awk -F: '/^Version/ {gsub(/^[ \t]+/, "", $2); print $2; exit}')"
printf 'Latest local package: %s\n' "$latest_package"
printf 'Latest local version: %s\n' "${package_version:-unknown}"

if [[ -n "$installed_version" && -n "$package_version" && "$installed_version" == "$package_version" ]]; then
    printf 'Status: installed version matches latest local package\n'
else
    printf 'Status: reinstall latest local package after system updates\n'
    printf 'Command: sudo pacman -U %s\n' "$latest_package"
fi
