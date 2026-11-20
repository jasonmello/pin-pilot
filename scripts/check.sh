#!/usr/bin/env bash
# Project checks, run from the repository root: valid JSON, required files,
# and every path and symbol AGENTS.md cites still exists. Read-only.
# Paths are written out one by one on purpose (no wildcards, no variables).
set -uo pipefail
fail=0

python3 -m json.tool .claude-plugin/plugin.json > /dev/null || { echo "invalid JSON: .claude-plugin/plugin.json"; fail=1; }
python3 -m json.tool .claude-plugin/marketplace.json > /dev/null || { echo "invalid JSON: .claude-plugin/marketplace.json"; fail=1; }
python3 -m json.tool hooks/hooks.json > /dev/null || { echo "invalid JSON: hooks/hooks.json"; fail=1; }

# Files that must exist (also the paths cited in AGENTS.md).
test -f LICENSE || { echo "missing: LICENSE"; fail=1; }
test -f NOTICE || { echo "missing: NOTICE"; fail=1; }
test -f README.md || { echo "missing: README.md"; fail=1; }
test -f hooks/register.ts || { echo "missing: hooks/register.ts"; fail=1; }
test -f hooks/hooks.json || { echo "missing: hooks/hooks.json"; fail=1; }
test -f .claude-plugin/plugin.json || { echo "missing: .claude-plugin/plugin.json"; fail=1; }
test -f .claude-plugin/marketplace.json || { echo "missing: .claude-plugin/marketplace.json"; fail=1; }
test -f .claude-plugin/icon.png || { echo "missing: .claude-plugin/icon.png"; fail=1; }
test -f scripts/check.sh || { echo "missing: scripts/check.sh"; fail=1; }
test -f docs/decisoes.md || { echo "missing: docs/decisoes.md"; fail=1; }
test -f assets/banner.png || { echo "missing: assets/banner.png"; fail=1; }
test -f assets/social-preview.png || { echo "missing: assets/social-preview.png"; fail=1; }

# Symbols AGENTS.md cites must exist in the code.
grep -q "LIST_LIMIT" hooks/register.ts || { echo "AGENTS.md cites a missing symbol: LIST_LIMIT"; fail=1; }
grep -q "managed" hooks/register.ts || { echo "AGENTS.md cites a missing symbol: managed"; fail=1; }

# Every backticked file path in AGENTS.md must be in the list checked above
# (compared as text only; a new path means adding a test -f line for it).
known="hooks/register.ts hooks/hooks.json .claude-plugin/plugin.json .claude-plugin/marketplace.json .claude-plugin/icon.png scripts/check.sh docs/decisoes.md assets/banner.png assets/social-preview.png"
for cited in $(grep -o '`[^` ]*/[^` ]*\.[a-z]*`' AGENTS.md | tr -d '`' | sort -u); do
  case " $known " in *" $cited "*) ;; *) echo "AGENTS.md cites a path not checked here: $cited"; fail=1 ;; esac
done

[ "$fail" -eq 0 ] && echo "ok"
exit "$fail"
