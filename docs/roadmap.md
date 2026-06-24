# Roadmap

Bu roadmap, gesture patchinin once stabil davranisa, sonra daha tasinabilir ve yonetilebilir bir urune donusmesini hedefler.

## Faz 1: Stable core gestures

- KWin 6.7.1 tabaninda patchin temiz uygulanmasini ve paketlenmesini koru.
- 3 parmak yukari Overview, 3 parmak asagi Minimize All, 3 parmak sag/sol pencere gecisi, 4 parmak sag/sol virtual desktop gecisi davranislarini stabil tut.
- Yanlis eksen secimini azaltan axis lock esigini koru.

## Faz 2: Window switching polish

- 3 parmak sag/sol pencere gecisinin gercek kullanimda dogru sirada, tekrarli swipe'larda tahmin edilebilir ve kazara tetiklemelere dayanikli oldugunu dogrula.
- Alt-Tab overlay/timer yaklasimini stable hatta geri alma; gerekiyorsa ayri deneysel patch olarak tut.

## Faz 3: Update dayanimi ve ayrisma

- KWin sistem guncellemeleri patchli paketi ezdigi icin bu durumu otomatik yakalayan veya patchi daha ayri bir katmanda tutan secenekleri arastir.
- Ilk adim olarak paket build/status scriptleri kullanilir; KWin surumu degisince patch yeni kaynak surumune manuel rebase edilir.

## Faz 4: GUI configuration

- System Settings icinde Touchpad Gestures KCM'i bulunur.
- GUI, KWin patchinin sinirlarini gizlemez; sadece desteklenen davranislari guvenli sekilde acip kapatir ve restart gerektigini belirtir.

## Faz 5: Packaging and rollback

- Paket uretim, kurulum, onceki pakete donus ve update sonrasi tekrar kurulum akisini daha az manuel hale getir.
- Snapper/pacman rollback notlari ve surum uyumluluk kurallari dokumante edilir.

## Related

- [[architecture/README]]
- [[decisions/README]]
- [[../PROGRESS]]
