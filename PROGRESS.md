# PROGRESS

## Current Truth
- Project: `kwin-touchpad-gestures`
- Purpose: KDE Wayland/KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak kurmak.
- Branch: `main`
- Runtime/stack: Arch PKGBUILD, KWin 6.7.0, C++/Qt/KDE patchleri
- Current architecture summary: Proje upstream KWin kaynaklarini repoya tasimaz; Arch PKGBUILD kaynak indirir, local patch uygular ve paket uretir.
- Primary validation: `cd packaging/arch && makepkg --nobuild --skippgpcheck`; full package icin `makepkg -e --skippgpcheck`
- Stable gesture behavior: 3 parmak yukari Overview, 3 parmak asagi Minimize All, 3 parmak sag/sol custom action yok, 4 parmak sag/sol virtual desktop switching.

## Active Follow-ups
- Alt-Tab/window switcher gesture davranisini stable patchten ayri tasarla.
- KWin/Plasma surumu degisince PKGBUILD ve patch uygulanabilirligini yeniden dogrula.

## Documentation Model
- Start with `docs/00-agent-orientation.md`; do not scan archive history first.
- `AGENTS.md` is the short mandatory rule surface.
- `PROGRESS.md` is current truth, active follow-ups, and recent short changelog only.
- Durable system behavior belongs in `docs/architecture/`, `docs/contracts/` if present, `docs/decisions/`, or project-specific docs.
- Full historical detail goes to `docs/history/progress-archive.md`; it is not current truth.
- Obsidian vault root is `docs/`; `.obsidian/` is local and ignored.

## Recent Changelog
- 2026-06-23: **3-finger down changed to Minimize All.** Replaced Show Desktop gesture action with direct KWin minimize-all behavior.
- 2026-06-23: **Project scaffold created.** Moved stable KWin touchpad gesture patch into a dedicated project layout with packaging, saved patches, and docs.

## Archive
- Older detailed entries belong in `docs/history/progress-archive.md`.
- Archive files are historical lookup material only.
