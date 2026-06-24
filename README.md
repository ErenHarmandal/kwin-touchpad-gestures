# kwin-touchpad-gestures

KDE Plasma Wayland oturumunda KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak derlemek icin yerel proje.

## Current stable behavior

- 3 parmak yukari: Overview
- 3 parmak asagi: Minimize All
- 3 parmak sag/sol: TabBox overlay'i acmadan direct window switching
- 4 parmak sag/sol: KWin virtual desktop switching korunur

## Layout

- `packaging/arch/`: aktif PKGBUILD ve kurulan patch.
- `patches/stable/`: bilinen calisan patch snapshotlari.
- `patches/experimental/`: ertelenen veya basarisiz deneme patchleri.
- `docs/`: agent ve insan okunur proje dokumantasyonu.

## Build

```bash
cd packaging/arch
makepkg --nobuild --skippgpcheck
makepkg -e --skippgpcheck
```

Olusan paket kullanici tarafindan Konsole'da `sudo pacman -U ...` ile kurulur.
