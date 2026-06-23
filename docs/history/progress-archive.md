# Progress Archive

## 2026-06-22 - Initial local experiment

- Fusuma was tested for KDE Wayland touchpad gestures but could not reliably override built-in KWin gestures.
- A local Arch KWin package tree was created under `/home/erenh/src/kwin-touchpad-patch/kwin`.
- Stable patch reached package version `kwin 6.7.0-4.3`: 3-finger up Overview, 3-finger down Show Desktop, no custom 3-finger left/right action, 4-finger desktop switching preserved.
- An experimental 3-finger left/right Alt-Tab patch was saved but removed from stable behavior because axis misclassification made it unreliable.
