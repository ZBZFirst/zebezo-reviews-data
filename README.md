# ZeBeZo Reviews Data

This repository is the durable backup/source mirror for ZeBeZo review content.

It stores:

- `reviews.json` - review metadata, status, history, recommendations, and photo references.
- `photos/` - review photos referenced by `reviews.json`.

The Pi still serves the ZeBeZo HTML application. The desktop review editor writes to the Pi and updates this mirror so the review content can also live in GitHub.

## Status Values

- `draft` - local/private work in progress.
- `listed` - visible on `/reviews/` as a non-clickable Coming Soon card.
- `published` - visible and clickable as a live review.
- `hidden` - not shown publicly.

## Workflow

1. Edit in the desktop ZeBeZo Review Editor.
2. Use `Publish to List` for a Coming Soon card.
3. Use `Push Live Review` / `Push Updated Review` for a public clickable review.
4. Run `./sync_from_app.sh` if you need to refresh this mirror manually.
5. Run `./push_backup.sh` after configuring a GitHub remote.

## Configure GitHub Remote

Create a GitHub repository, then run:

```bash
git remote add origin git@github.com:OWNER/REPO.git
git branch -M main
./push_backup.sh
```

