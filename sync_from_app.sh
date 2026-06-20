#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="/home/paulwasthere/APaubloI/site/reviews"
BACKUP_ROOT="/home/paulwasthere/zebezo-reviews-data"

cp "$APP_ROOT/reviews.json" "$BACKUP_ROOT/reviews.json"
mkdir -p "$BACKUP_ROOT/photos"
rsync -a --delete "$APP_ROOT/photos/" "$BACKUP_ROOT/photos/"

echo "Synced reviews.json and photos from $APP_ROOT"
