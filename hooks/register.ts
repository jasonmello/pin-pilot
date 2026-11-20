import type { Register } from 'claude-code'

// How often to refresh; the window that counts as "recent" is the person's choice.
const EVERY_MS = 5 * 60 * 1000
// Only the most recent sessions matter; a big list is refused by the app.
const LIST_LIMIT = 20
// Keys in $.store (kept across sessions, shared by every session running the mod).
const MANAGED = 'managed' // ids this mod pinned; it never unpins anything else
const LAST_RUN = 'lastRun' // so several open sessions don't all run each tick

type Row = { sessionId: string; lastActivityAt?: string; pinned?: boolean; isArchived?: boolean }

const WINDOWS: Record<string, number> = {
  '15m': 15, '30m': 30, '1h': 60, '2h': 120, '4h': 240, '8h': 480,
}

export const register: Register = (on, options) => {
  const WINDOW_MS = (WINDOWS[String(options?.window)] ?? 60) * 60 * 1000
  let lastTurnAt = 0
  let running = false

  on('turn.start', async ($, e, next) => {
    lastTurnAt = await $.clock.now()
    return next(e)
  })

  on('session.start', async ($, e, next) => {
    const result = await next(e)

    const tick = async () => {
      if (running) return
      running = true
      try {
        const now = await $.clock.now()
        const last = Number((await $.store.get(LAST_RUN)) ?? 0)
        if (now - last < EVERY_MS * 0.8) return
        await $.store.set(LAST_RUN, now)

        const res = await $.mcp.call('ccd_session_mgmt', 'list_sessions', { limit: LIST_LIMIT })
        const block = res.content.find(b => b.type === 'text') as { text?: string } | undefined
        if (res.isError || !block?.text?.trim().startsWith('[')) return
        const rows = JSON.parse(block.text) as Row[]
        const managed = new Set((await $.store.get(MANAGED)) as string[] | undefined)

        for (const s of rows) {
          if (s.isArchived) continue
          const at = s.lastActivityAt ? Date.parse(s.lastActivityAt) : 0
          const recent = now - at < WINDOW_MS
          if (recent && !s.pinned) {
            await $.mcp.call('ccd_sidebar', 'set_pinned', { session_id: s.sessionId, pinned: true })
            managed.add(s.sessionId)
          } else if (!recent && s.pinned && managed.has(s.sessionId)) {
            await $.mcp.call('ccd_sidebar', 'set_pinned', { session_id: s.sessionId, pinned: false })
            managed.delete(s.sessionId)
          } else if (!s.pinned) {
            managed.delete(s.sessionId) // the person unpinned it; forget it
          }
        }
        // list_sessions leaves out the session it runs in: pin this one while it is in use.
        if (now - lastTurnAt < WINDOW_MS) {
          await $.mcp.call('ccd_sidebar', 'set_pinned', { session_id: 'self', pinned: true })
        }
        await $.store.set(MANAGED, [...managed])
      } catch (err) {
        $.ui.status(`pin-pilot: ${String(err).slice(0, 60)}`)
      } finally {
        running = false
      }
    }

    $.clock.after(3000, () => void tick())
    $.clock.every(EVERY_MS, () => void tick())
    return result
  })
}
