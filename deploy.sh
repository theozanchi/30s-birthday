#!/bin/sh
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="/var/www/30s-birthday"

echo "Making sure dest exists..."
sudo mkdir -p "$DEST"

echo "Syncing files..."
sudo rsync -av --delete \
  --exclude '.git' \
  --exclude 'deploy.sh' \
  "$REPO_DIR/" "$DEST/"

echo "Updating permissions..."
sudo chown -R caddy:caddy "$DEST"

echo "Done!"
