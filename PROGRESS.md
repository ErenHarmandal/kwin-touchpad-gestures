# PROGRESS

## Current Truth
- Project: `kwin-touchpad-gestures`
- Purpose: KDE Wayland/KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak kurmak.
- Branch: `main`
- Runtime/stack: Arch PKGBUILD, KWin 6.7.1, C++/Qt/KDE patchleri
- Current architecture summary: Proje upstream KWin kaynaklarini repoya tasimaz; Arch PKGBUILD kaynak indirir, local patch uygular, Touchpad Gestures KCM'i ekler ve paket uretir.
- Primary validation: `scripts/build-package.sh`; full package `packaging/arch/kwin-6.7.1-1.7-x86_64.pkg.tar.zst` olarak dogrulandi.
- Stable gesture behavior: 3 parmak yukari Overview, 3 parmak asagi Minimize All, 3 parmak sag/sol direct window switching, 4 parmak sag/sol virtual desktop switching; bunlar System Settings KCM ile guvenli sabit secenekler arasinda ayarlanabilir.
- KCM behavior: Touchpad Gestures KCM manuel `KQuickConfigModule` kullanir; sadece `kwinrc` `[TouchpadGestures]` grubunu okur/yazar ve Apply state'ini kendi property snapshot'i ile yonetir.
- Known limitation: KWin sistem guncellemeleri patchli paketi ezebilir. Faz 1'de otomatik cozum yok; yeni KWin surumu geldikce patch rebase edilir.

## Active Follow-ups
- 3 parmak sag/sol pencere gecisini kullanici testinden sonra gerekirse siralama/hassasiyet acisindan ayarla.
- Yatay swipe testinde sag/sol artik minimize tetiklememeli; sorun surerse sonraki hedef pencere siralama/cycle modeli olacak.
- KWin update dayanimi icin guvenli rebuild asistani tasarla: status/build otomatik olabilir, upstream kaynak surumu degisirse riskli rebase olarak isaretlenir, `sudo pacman -U` manuel onayda kalir.

## Documentation Model
- Start with `docs/00-agent-orientation.md`; do not scan archive history first.
- `AGENTS.md` is the short mandatory rule surface.
- `PROGRESS.md` is current truth, active follow-ups, and recent short changelog only.
- Durable system behavior belongs in `docs/architecture/`, `docs/contracts/` if present, `docs/decisions/`, or project-specific docs.
- Full historical detail goes to `docs/history/progress-archive.md`; it is not current truth.
- Obsidian vault root is `docs/`; `.obsidian/` is local and ignored.

## Recent Changelog
- 2026-06-24: **KCM config handling fixed.** Touchpad Gestures KCM `KQuickManagedConfigModule`/generated kcfg hattindan manuel `KQuickConfigModule` hattina tasindi; mevcut `kwinrc` degerleri dogru gorunur ve Apply butonu degisiklikleri algilar.
- 2026-06-24: **Config layer and KCM added.** Gesture defaultlari `kwinrc` `[TouchpadGestures]` grubuna tasindi, System Settings KCM eklendi, paket build/status yardimcilari eklendi.
- 2026-06-24: **Discrete gesture cancel handling fixed.** 3 parmak sag/sol secilirken iptal edilen asagi gesture'in Minimize All tetiklemesini engelledi; cancel action sadece realtime/progress gesture'larda kalir.
- 2026-06-23: **KWin 6.7.1 rebase and direct window switching.** Moved PKGBUILD to 6.7.1, removed obsolete upstream color-pipeline patch, and added TabBox-free 3-finger left/right direct window switching.
- 2026-06-23: **Roadmap added.** Documented later phases for update resilience, GUI configuration, and packaging/rollback improvements.
- 2026-06-23: **3-finger down changed to Minimize All.** Replaced Show Desktop gesture action with direct KWin minimize-all behavior.
- 2026-06-23: **Project scaffold created.** Moved stable KWin touchpad gesture patch into a dedicated project layout with packaging, saved patches, and docs.

## Archive
- Older detailed entries belong in `docs/history/progress-archive.md`.
- Archive files are historical lookup material only.
