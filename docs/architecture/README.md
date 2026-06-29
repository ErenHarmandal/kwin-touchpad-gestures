# Architecture Notes

Bu proje KWin'i komple fork olarak tasimaz. Arch/CachyOS paketleme akisi kullanilir: `PKGBUILD` upstream KWin kaynagini indirir, local patchleri uygular ve kurulum icin pacman paketi uretir.

## Sistem sinirlari

- Hedef ortam CachyOS/KDE Plasma Wayland ve KWin 6.7.1'dir.
- Proje runtime servisi calistirmaz; KWin patchi ve System Settings KCM'i ayni paket icinde gelir.
- Kurulum `sudo pacman -U` gerektirir ve kullanici terminalinde yapilir.
- Normal sistem guncellemeleri patchli KWin paketini ezebilir. Faz 1'de bu otomatik cozulmez; KWin surumu degisince patch yeni kaynak surumune yeniden tasinir.

## Ana moduller

- `packaging/arch/PKGBUILD`: upstream KWin kaynaklarini ve patch uygulama siralamasini tanimlar.
- `packaging/arch/kwin-touchpad-gestures.patch`: aktif stable davranisi kuran patch.
- `patches/stable/`: bilinen calisan patch snapshotlari.
- `patches/experimental/`: stable olmayan tasarim denemeleri.
- `scripts/`: patchli paket build ve kurulu paket durum kontrol yardimcilari.

## Stable gesture behavior

- Gesture atamalari `kwinrc` icindeki `[TouchpadGestures]` grubundan okunur. Bos veya gecersiz degerler stable defaultlara duser.
- Touchpad Gestures KCM'i generated kcfg kullanmaz; manuel `KQuickConfigModule` olarak ayni `kwinrc` grubunu okur/yazar.
- KCM yalnizca KWin patchinin config katmanini degistirir; Fusuma, global shortcut atamalari veya klavye kombinasyonlariyla is yapmaz.
- Overview effect 3 parmak yukari gesture'i default olarak kabul eder; KCM'de 3 parmak yukari ayni zamanda toggle/restore aksiyonlarina da atanabilir.
- Workspace 3 parmak asagi gesture default olarak Maximize/Minimize All Windows davranisini tetikler.
- Maximize/Minimize All Windows davranisi klavye kisayolu gondermez; KWin icinde uygun pencereleri dogrudan minimize eder ve gesture tarafindan minimize edilenleri tekrar geri acar.
- KCM 3 parmak yukari/asagi icin Maximize/Minimize All Windows ve tek yonlu Maximize Windows aksiyonlarini sunar. Saf tek yonlu Minimize Windows secenegi problemli KWin state davranisi nedeniyle stable yuzeyden kaldirilmistir; Maximize Windows mevcut masaustu/aktivitede minimize haldeki uygun normal kullanici pencerelerini geri getirir.
- Workspace 3/4 parmak sag/sol gesture'lar KCM'den pencere gecisi veya virtual desktop gecisi aksiyonlarina atanabilir.
- Default olarak 3 parmak sag/sol TabBox overlay'i acmadan mevcut masaustu/aktivitedeki uygun pencereler arasinda dogrudan gecis yapar.
- Touchpad pencere gecisi minimize, special, keep-above ve keep-below pencereleri aday listesinden cikarir.
- Art arda sag/sol swipe'larda KWin focus chain'i yeniden siralandigi icin kisa omurlu gesture cycle listesi kullanilir.
- KWin'in upstream 3 parmak virtual desktop swipe kayitlari kaldirilir; 3 parmak virtual desktop davranisi yalnizca KCM'de secilirse yeniden kaydedilir.
- Default olarak 4 parmak sag/sol virtual desktop swipe davranisi korunur.
- Gesture axis lock esigi yukseltilir; amac erken yanlis eksen secimini azaltmaktir.
- Discrete gesture action'lari cancel eventinde calismaz. Cancel eventinin QAction tetiklemesi sadece Overview/virtual desktop gibi progress callback kullanan realtime gesture'larda korunur.
- System Settings icindeki Touchpad Gestures KCM'i desteklenen guvenli secenekleri yazar; 3/4 parmak gesture'lari temsili touchpad onizlemesiyle gruplanir. Apply butonu KCM property snapshot'i ile takip edilir. Runtime re-register veya canli gesture izleme yoktur; gesture davranis degisiklikleri KWin/Plasma restart sonrasi uygulanir.

## Related

- [[../00-agent-orientation]]
- [[../standards/agent-documentation-rules]]
- [[../decisions/README]]
