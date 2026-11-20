# Decisions

- 2026-11-20 — **Pin instead of moving sessions to a "Working on" group.** A session belongs to one group only; moving it would take it out of the person's folder and, if the mod stopped halfway, leave it stranded. Pinning keeps the group intact.
- 2026-11-20 — **Only unpin what the mod itself pinned** (the `managed` list in `$.store`). Sessions the person pinned by hand are never touched.
- 2026-11-20 — **Fixed 5-minute interval, window chosen by the person** (15 min to 8 h, default 1 h). Fewer options, less confusion.
- 2026-11-20 — **`list_sessions` with a limit of 20.** With 100 the app returns a "result too large" error; sessions come newest first, so 20 is enough.
- 2026-11-20 — **Apache-2.0 license with a NOTICE**, for the widest reach while keeping credit to the author in redistributions.
- 2026-11-20 — **English first, then pt-BR** in README, docs, commits and PRs.

## Português

- 2026-11-20 — **Fixar em vez de mover para um grupo "Working on".** Cada sessão pertence a um grupo só; mover tiraria a sessão da pasta da pessoa e, se o mod parasse no meio, ela ficaria presa fora do lugar. Fixar mantém o grupo intacto.
- 2026-11-20 — **Só desafixar o que o próprio mod fixou** (lista `managed` no `$.store`). O que a pessoa fixou à mão nunca é tocado.
- 2026-11-20 — **Intervalo fixo de 5 min, janela escolhida pela pessoa** (15 min a 8 h, padrão 1 h). Menos opções, menos confusão.
- 2026-11-20 — **`list_sessions` com limite 20.** Com 100 o app devolve erro de resultado grande demais; as sessões vêm da mais recente para a mais antiga, então 20 basta.
- 2026-11-20 — **Licença Apache-2.0 com NOTICE**, para máximo alcance mantendo o crédito ao autor em redistribuições.
- 2026-11-20 — **Inglês primeiro, depois pt-BR** em README, docs, commits e PRs.
