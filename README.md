# kwin-touchpad-gestures

KDE Plasma Wayland oturumunda KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak derlemek icin yerel proje.

## Current stable behavior

- 3 parmak yukari: default olarak Overview
- 3 parmak asagi: default olarak Maximize/Minimize All Windows
- 3 parmak sag/sol: default olarak TabBox overlay'i acmadan direct window switching
- 4 parmak sag/sol: default olarak KWin virtual desktop switching
- System Settings icindeki Touchpad Gestures KCM'i 3 parmak yukari/asagi icin overview/toggle/restore aksiyonlarini, yatay gesture'larda pencere gecisi veya virtual desktop gecisi aksiyonlarini sectirir.
- KCM sadece `kwinrc` `[TouchpadGestures]` grubunu degistirir; davranis degisiklikleri Plasma/KWin restart sonrasi uygulanir.

## Layout

- `packaging/arch/`: aktif PKGBUILD ve kurulan patch.
- `patches/stable/`: bilinen calisan patch snapshotlari.
- `patches/experimental/`: ertelenen veya basarisiz deneme patchleri.
- `scripts/`: paket build ve update sonrasi durum kontrol yardimcilari.
- `docs/`: agent ve insan okunur proje dokumantasyonu.

## Build

```bash
cd packaging/arch
makepkg --nobuild --skippgpcheck
makepkg -e --skippgpcheck
```

Olusan paket kullanici tarafindan Konsole'da `sudo pacman -U ...` ile kurulur.

Kisa yol:

```bash
scripts/build-package.sh
scripts/status.sh
```

## License

The KWin gesture patches are provided under GPL-2.0-or-later. See [COPYING](COPYING) for the GNU GPL version 2 text. The patches preserve the copyright and SPDX notices from [upstream KWin](https://invent.kde.org/plasma/kwin).

The `license` field in the Arch `PKGBUILD` identifies the packaged upstream software. This section documents the license for the patches distributed in this repository.
