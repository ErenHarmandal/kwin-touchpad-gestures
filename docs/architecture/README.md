# Architecture Notes

Bu proje KWin'i komple fork olarak tasimaz. Arch/CachyOS paketleme akisi kullanilir: `PKGBUILD` upstream KWin kaynagini indirir, local patchleri uygular ve kurulum icin pacman paketi uretir.

## Sistem sinirlari

- Hedef ortam CachyOS/KDE Plasma Wayland ve KWin 6.7.0'dur.
- Proje runtime servisi calistirmaz; sadece KWin paketini derleyen kaynak/paketleme deposudur.
- Kurulum `sudo pacman -U` gerektirir ve kullanici terminalinde yapilir.

## Ana moduller

- `packaging/arch/PKGBUILD`: upstream KWin kaynaklarini ve patch uygulama siralamasini tanimlar.
- `packaging/arch/kwin-touchpad-gestures.patch`: aktif stable davranisi kuran patch.
- `patches/stable/`: bilinen calisan patch snapshotlari.
- `patches/experimental/`: stable olmayan tasarim denemeleri.

## Stable gesture behavior

- Overview effect 3 parmak yukari gesture kabul eder.
- Workspace 3 parmak asagi gesture ile Minimize All davranisini tetikler.
- Minimize All davranisi klavye kisayolu gondermez; KWin icinde uygun pencereleri dogrudan minimize eder ve gesture tarafindan minimize edilenleri tekrar geri acar.
- KWin'in 3 parmak virtual desktop swipe kayitlari kaldirilir.
- 4 parmak virtual desktop swipe davranisi korunur.
- Gesture axis lock esigi yukseltilir; amac erken yanlis eksen secimini azaltmaktir.

## Related

- [[../00-agent-orientation]]
- [[../standards/agent-documentation-rules]]
- [[../decisions/README]]
