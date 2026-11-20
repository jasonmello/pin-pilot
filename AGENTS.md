# Pin Pilot — map

Claude Code mod (plugin) for the desktop app: pins sessions with recent activity at the top of the sidebar and unpins the ones it pinned once they go quiet. No model, no tokens, no network.

## Where things are
- `hooks/register.ts`: all the logic (5-min timer, session list, pin/unpin).
- `hooks/hooks.json`: points to the module.
- `.claude-plugin/plugin.json`: manifest, author, license, `window` option (userConfig).
- `.claude-plugin/marketplace.json`: makes the repository installable.
- `scripts/check.sh`: checks (valid JSON, paths and symbols cited in docs exist).
- `docs/decisoes.md`: decisions with date and reason.
- `assets/social-preview.png`: GitHub social preview (1280×640), set by hand in the repo settings.
- `assets/banner.png`: README banner (its claims must match the code: 5-min refresh, 15 min–8 h window).

## Commands
- Check: `bash scripts/check.sh`
- Validate the plugin: `claude plugin validate .`

## Rules that don't break
- Never unpin what the person pinned: only ids kept in `managed`.
- Never move sessions between groups (see `docs/decisoes.md`).
- No personal data in code; the author appears only in `plugin.json`, `NOTICE` and the README.
- Keep `list_sessions` at a low limit (`LIST_LIMIT`): a big list comes back as an error.
- English first, then pt-BR, in every public text.

## Not verified
- Install through the official directory (GitHub marketplace install was tested on 2026-11-20).
- Behavior after the app stays closed for hours and is reopened.

## Before X, read Y
| Before | Read |
|---|---|
| Changing what gets pinned or unpinned | `docs/decisoes.md` |
| Commit, PR, license | skill `fluxo-github` |

## Português
Mod do Claude Code para o app desktop: fixa no topo as sessões recentes e desafixa as que ele fixou quando ficam paradas. Mesmas regras acima: nunca desafixar o que a pessoa fixou, nunca mover sessões entre grupos, nada de dado pessoal, inglês primeiro e depois pt-BR.
