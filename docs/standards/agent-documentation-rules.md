# Agent Documentation Rules

Bu dosya, yeni projelerde coding agent'larin tutarli ve verimli calismasi icin canonical dokumantasyon modelidir.

## Source of Truth

- `AGENTS.md`: zorunlu kurallar, validation komutlari ve ilk okuma entrypoint'leri.
- `PROGRESS.md`: current truth, aktif follow-up'lar ve son kisa changelog.
- `docs/architecture/`: kalici mimari ve sistem davranisi.
- `docs/contracts/`: varsa public API, veri modeli, wire format veya cross-project contract.
- `docs/decisions/`: ADR tarzinda kalici karar kayitlari.
- `docs/history/`: arxiv. Current truth degildir.

## Agent Reading Order

1. `AGENTS.md`
2. `docs/00-agent-orientation.md`
3. Goreve ozel docs notlari
4. `PROGRESS.md`
5. Gerekirse `docs/history/`

## Update Matrix

- Runtime behavior change: update related architecture/module docs and `PROGRESS.md`.
- API/contract/data model change: update contract docs, consumer docs, and `PROGRESS.md`.
- Permanent decision: add or update `docs/decisions/*`; summarize in `PROGRESS.md`.
- Docs-only cleanup: update links, `Related` sections, and `PROGRESS.md` if meaningful.
- Old detailed changelog: move to `docs/history/progress-archive.md`.

## PROGRESS.md Rules

- Keep it short enough for first-read agent context.
- Put current truth at the top.
- Keep recent changelog short.
- Do not store real secrets, hostnames, production config, or private customer data.
- Archived history must not be treated as current guidance.

## Obsidian Rules

- Open `docs/` as vault root.
- Every durable note should link to at least one hub or related note.
- Use vault-root wikilinks such as `[[architecture/README]]`.
- Do not use parent-directory wikilinks.
- Do not commit `.obsidian/`.

## Related

- [[../00-agent-orientation]]
- [[../README]]
- [[../architecture/README]]
- [[../decisions/README]]
