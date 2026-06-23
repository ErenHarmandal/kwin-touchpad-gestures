# AGENTS.md

## Project Identity
- Project name: `kwin-touchpad-gestures`
- Purpose: KDE Wayland/KWin touchpad gesture davranisini patch tabanli gelistirmek ve Arch/CachyOS paketi olarak kurmak.
- Primary stack/runtime: Arch PKGBUILD, KWin 6.7.0, C++/Qt/KDE patchleri
- Owner/context: erenh local CachyOS/KDE Wayland setup

## Must-follow constraints
- Start every task by reading `docs/00-agent-orientation.md` and the task-relevant docs.
- Keep `AGENTS.md` short: mandatory rules, validation commands, and entrypoints only.
- Do not put long architecture explanations in `AGENTS.md`; put durable knowledge under `docs/`.
- Never commit real hostnames, usernames, passwords, tokens, API keys, private keys, certificates, VPN details, production config values, or customer/private data.
- Preserve user changes. Do not revert unrelated work unless the user explicitly asks.
- Follow existing project patterns before adding new abstractions.
- If behavior changes, update the relevant docs and add a short dated `PROGRESS.md` changelog entry.
- If a decision should be remembered after the current task, add an ADR under `docs/decisions/`.

## Read first
- Agent entrypoint: `docs/00-agent-orientation.md`
- Documentation rules: `docs/standards/agent-documentation-rules.md`
- Architecture docs: `docs/architecture/`
- Decisions: `docs/decisions/`
- Current status: `PROGRESS.md`
- Historical detail: `docs/history/progress-archive.md`

## Validation before finishing
- Primary validation commands:
  - `cd packaging/arch && makepkg --nobuild --skippgpcheck`
  - `cd packaging/arch && makepkg -e --skippgpcheck`
- For docs-only changes, run Markdown/link/secret checks; runtime build/test is not required unless code or contracts changed.

## Important locations
- Source root: `packaging/arch`
- Main entrypoint: `packaging/arch/PKGBUILD`
- Active KWin patch: `packaging/arch/kwin-touchpad-gestures.patch`
- Saved stable patch: `patches/stable/kwin-touchpad-gestures-vertical-only-stable.patch`
- Saved experimental patch: `patches/experimental/kwin-touchpad-gestures-alt-tab-experimental.patch`
