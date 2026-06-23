# 0002 - Patch-first Arch Packaging Workflow

## Decision

Bu proje upstream KWin kaynaklarini komple fork olarak surumlemek yerine patch-first Arch packaging modeli kullanir. Aktif davranis `packaging/arch/kwin-touchpad-gestures.patch` icinde tutulur ve `packaging/arch/PKGBUILD` bu patchi upstream KWin tarball uzerine uygular.

## Rationale

KWin buyuk ve hizli degisen bir compositor kod tabanidir. Yerel hedef dar: KDE Wayland touchpad gesture davranisini degistirmek. Kucuk patch + PKGBUILD akisi, upstream paket guncellemeleriyle farki gorunur tutar ve gereksiz kaynak kopyasini engeller.

## Consequences

- Stable patch kucuk ve okunur kalmali.
- Deneysel davranislar `patches/experimental/` altinda tutulmali, aktif patch'e ancak dogrulandiktan sonra alinmali.
- KWin/Plasma surumu degistiginde patch uygulanabilirligi ve PKGBUILD checksumlari yeniden dogrulanmali.
- Build outputlari Git'e alinmaz.

## Related

- [[README]]
- [[../architecture/README]]
- [[../standards/agent-documentation-rules]]
