# kwin-touchpad-gestures

KDE Plasma Wayland oturumunda KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak derlemek icin yerel proje.

## Current stable behavior

- 3 parmak yukari: Overview
- 3 parmak asagi: Minimize All
- 3 parmak sag/sol: TabBox overlay'i acmadan direct window switching
- 4 parmak sag/sol: KWin virtual desktop switching korunur
- System Settings icinde Touchpad Gestures KCM'i bu davranislari guvenli sabit seceneklerle ayarlar.
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
