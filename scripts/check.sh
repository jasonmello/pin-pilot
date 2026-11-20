#!/usr/bin/env bash
# Checagens do projeto: JSON válido e caminhos citados nos docs existem.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0

for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json hooks/hooks.json; do
  python3 -m json.tool "$f" > /dev/null || { echo "JSON inválido: $f"; fail=1; }
done

for f in LICENSE NOTICE README.md; do
  [ -f "$f" ] || { echo "Falta: $f"; fail=1; }
done

# Todo caminho entre crases em AGENTS.md que pareça um arquivo do repositório precisa existir.
while read -r p; do
  [ -e "$p" ] || { echo "AGENTS.md cita caminho que não existe: $p"; fail=1; }
done < <(grep -o '`[^` ]*/[^` ]*\.[a-z]*`' AGENTS.md | tr -d '`' | sort -u)

# Símbolos citados em AGENTS.md precisam existir no código.
for sym in LIST_LIMIT managed; do
  grep -q "$sym" hooks/register.ts || { echo "AGENTS.md cita símbolo que não existe: $sym"; fail=1; }
done

[ "$fail" -eq 0 ] && echo "ok"
exit "$fail"
