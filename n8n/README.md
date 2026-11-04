# n8n Workflows

| File | Owner | Branch | What it does |
|---|---|---|---|
| `expiry-check.json` | Member 3 | `feat/n8n-expiry` | Every day 8 AM: calculate & save discounts → get expiring products → email manager |
| `notifications.json` | Member 4 | `feat/notifications` | Department alerts to employees (+ optional Gemini AI) |

## Import a workflow
1. Open the `.json` file in Notepad → **Ctrl+A**, **Ctrl+C**.
2. In n8n, create a new workflow → click the canvas → **Ctrl+V**.
3. Open each Postgres node → **Credential → Create New** → use the Supabase details.
4. Open the Gmail node → connect your Google account → set the recipient.

## Export after changes (do this before every commit)
1. In n8n: **⋯ menu → Download**.
2. Replace the file in this folder with the same name.
3. Check the file has no passwords (n8n exports credential **names** only, not the passwords).
