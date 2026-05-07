#!/bin/bash
cd "$(dirname "$0")"
echo "🔄 Syncing custom items to GitHub..."
if [ -f items.txt ]; then
  ITEMS=$(cat items.txt | jq -R . | jq -s .)
  echo "{\"items\": $ITEMS}" | jq . > config.json
  git add config.json
  git commit -m "sync items $(date +%Y-%m-%d)" 2>/dev/null
  git push 2>&1
  echo "✅ Synced!"
else
  echo "❌ items.txt not found. Add items first."
fi
