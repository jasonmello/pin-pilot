# Pin Pilot

**Always see what you are working on.** Pin Pilot keeps the Claude Code sessions you used recently pinned at the top of the Claude desktop app's sidebar, and unpins them on its own when they go quiet. No more scrolling through every group to find the conversations that are still running.

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

> Works in the **Claude desktop app** (Code tab), while the app is open. It does nothing in the terminal-only Claude Code.

## How it works

Every 5 minutes, Pin Pilot looks at your sessions:

- A session with activity in the last hour (you choose the window) gets **pinned**.
- A session **Pin Pilot pinned** that has gone quiet gets **unpinned**.
- Sessions **you** pinned by hand are never touched. Pin a session yourself to keep it at the top for good.
- Unpin one of its pins and Pin Pilot lets it be until you use that session again.

Your groups never change: a pinned session stays in its group. Pin Pilot uses no AI model and spends **no tokens**. It only calls the app's own pin and session-list functions, on your machine. It sends nothing anywhere.

## Install

**In the desktop app:** click **+** next to the prompt box, then **Plugins**, **Add marketplace**, type `jasonmello/pin-pilot`, then **Add plugin** on Pin Pilot.

**From a terminal session** (type `claude` first):

```
/plugin install pin-pilot --marketplace jasonmello/pin-pilot
```

**From a shell:**

```bash
claude plugin install pin-pilot --marketplace jasonmello/pin-pilot
```

It starts working in the next session you open, within a few seconds.

## Choose the time window

The window that counts as "recent" is a setting: 15 min, 30 min, 1 h (default), 2 h, 4 h or 8 h. Set it when you install, or later in the plugin's settings.

## Good to know

- It runs only while the desktop app is open with a session loaded. Close the app and nothing updates until you open it again.
- Uninstalling leaves at most a few sessions pinned; unpin them with a right-click.

## License

Apache License 2.0, see [LICENSE](LICENSE). Copyright 2026 Jason Mello. If you redistribute Pin Pilot or a work based on it, keep the [NOTICE](NOTICE) file with the original credit.

---

## Português

**Veja sempre no que você está trabalhando.** O Pin Pilot fixa no topo da barra lateral do app Claude (aba Code) as conversas que você usou recentemente, e desafixa sozinho quando elas ficam paradas. Chega de rolar todos os grupos para achar as conversas que ainda estão rodando.

> Funciona no **app desktop do Claude** (aba Code), com o app aberto. Não faz nada no Claude Code só de terminal.

### Como funciona

A cada 5 minutos, o Pin Pilot olha suas conversas:

- Conversa com atividade na última hora (você escolhe a janela) é **fixada**.
- Conversa que **o Pin Pilot fixou** e ficou parada é **desafixada**.
- O que **você** fixou à mão nunca é mexido. Fixe uma conversa você mesmo para ela ficar no topo de vez.
- Desafixou uma conversa que ele fixou? Ele deixa quieta até você voltar a usá-la.

Seus grupos não mudam: a conversa fixada continua no grupo dela. O Pin Pilot não usa modelo de IA e **não gasta tokens**. Ele só usa as funções do próprio app de fixar e listar conversas, no seu computador, e não envia nada para lugar nenhum.

### Instalar

**No app desktop:** clique em **+** ao lado da caixa de mensagem, depois **Plugins**, **Add marketplace**, digite `jasonmello/pin-pilot` e clique em **Add plugin** no Pin Pilot.

**Numa sessão de terminal** (digite `claude` antes):

```
/plugin install pin-pilot --marketplace jasonmello/pin-pilot
```

**Pelo shell:**

```bash
claude plugin install pin-pilot --marketplace jasonmello/pin-pilot
```

Ele começa a funcionar na próxima conversa que você abrir, em poucos segundos.

### Escolha a janela de tempo

O que conta como "recente" é uma configuração: 15 min, 30 min, 1 h (padrão), 2 h, 4 h ou 8 h. Escolha na instalação ou depois, nas configurações do plugin.

### Bom saber

- Só roda com o app desktop aberto e alguma conversa carregada. Com o app fechado, nada se atualiza até você abrir de novo.
- Ao desinstalar, sobram no máximo algumas conversas fixadas; desafixe com o botão direito.

### Licença

Apache License 2.0, veja [LICENSE](LICENSE). Copyright 2026 Jason Mello. Se você redistribuir o Pin Pilot ou um trabalho baseado nele, mantenha o arquivo [NOTICE](NOTICE) com o crédito original.
