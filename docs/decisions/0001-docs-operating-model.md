# 0001 - Docs Operating Model

## Decision

Bu proje agent-optimized Markdown modelini kullanir: `AGENTS.md` kisa zorunlu kural yuzeyi, `PROGRESS.md` kisa current truth, kalici bilgi `docs/`, tarihce `docs/history/`.

## Rationale

Coding agent'lar ilk kez projeyi actiklarinda uzun changelog yerine current truth ve goreve ozel docs okumali. Bu model context israfini ve eski bilginin current truth sanilmasini azaltir.

## Consequences

- Her anlamli degisiklikte ilgili docs notu ve kisa `PROGRESS.md` changelog'u guncellenir.
- Eski uzun detaylar arsivlenir.
- Obsidian graph icin notlar wikilink ve `Related` bolumleriyle baglanir.

## Related

- [[README]]
- [[../00-agent-orientation]]
- [[../standards/agent-documentation-rules]]
