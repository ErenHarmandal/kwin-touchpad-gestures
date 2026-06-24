# Architecture Notes

Bu proje KWin'i komple fork olarak tasimaz. Arch/CachyOS paketleme akisi kullanilir: `PKGBUILD` upstream KWin kaynagini indirir, local patchleri uygular ve kurulum icin pacman paketi uretir.

## Sistem sinirlari

- Hedef ortam CachyOS/KDE Plasma Wayland ve KWin 6.7.1'dir.
- Proje runtime servisi calistirmaz; sadece KWin paketini derleyen kaynak/paketleme deposudur.
- Kurulum `sudo pacman -U` gerektirir ve kullanici terminalinde yapilir.
- Normal sistem guncellemeleri patchli KWin paketini ezebilir. Faz 1'de bu otomatik cozulmez; KWin surumu degisince patch yeni kaynak surumune yeniden tasinir.

## Ana moduller

- `packaging/arch/PKGBUILD`: upstream KWin kaynaklarini ve patch uygulama siralamasini tanimlar.
- `packaging/arch/kwin-touchpad-gestures.patch`: aktif stable davranisi kuran patch.
- `patches/stable/`: bilinen calisan patch snapshotlari.
- `patches/experimental/`: stable olmayan tasarim denemeleri.

## Stable gesture behavior

- Overview effect 3 parmak yukari gesture kabul eder.
- Workspace 3 parmak asagi gesture ile Minimize All davranisini tetikler.
- Minimize All davranisi klavye kisayolu gondermez; KWin icinde uygun pencereleri dogrudan minimize eder ve gesture tarafindan minimize edilenleri tekrar geri acar.
- Workspace 3 parmak sag/sol gesture ile TabBox overlay'i acmadan mevcut masaustu/aktivitedeki uygun pencereler arasinda dogrudan gecis yapar.
- Touchpad pencere gecisi minimize, special, keep-above ve keep-below pencereleri aday listesinden cikarir.
- Art arda sag/sol swipe'larda KWin focus chain'i yeniden siralandigi icin kisa omurlu gesture cycle listesi kullanilir.
- KWin'in 3 parmak virtual desktop swipe kayitlari kaldirilir.
- 4 parmak virtual desktop swipe davranisi korunur.
- Gesture axis lock esigi yukseltilir; amac erken yanlis eksen secimini azaltmaktir.
- Discrete gesture action'lari cancel eventinde calismaz. Cancel eventinin QAction tetiklemesi sadece Overview/virtual desktop gibi progress callback kullanan realtime gesture'larda korunur.

## Related

- [[../00-agent-orientation]]
- [[../standards/agent-documentation-rules]]
- [[../decisions/README]]
