# Expiry Date Monitoring & Food Waste Reduction

A low-code system that helps a supermarket sell products before they expire.

- **Employees** update the stock (quantity, expiry date) for their department.
- **n8n** checks expiry dates every morning, suggests discounts and emails the manager.
- **The manager** sees everything and manages departments and employees.
- **Customers** see today's discount offers on a public page.

## Tech stack

| Part | Tool |
|---|---|
| Database | PostgreSQL (Supabase) |
| Automation | n8n |
| Dashboards + login | Budibase |
| Email | Gmail |

## Folder structure

```
database/      SQL schema + sample data            (Member 2)
n8n/           n8n workflow JSON exports           (Members 3, 4)
dashboards/    Budibase app export + screenshots   (Members 5, 6, 7)
docs/          Report sections, diagrams, slides   (Members 1, 7 + everyone)
archive/       Old Google Sheets version (not used)
PROJECT_PLAN.md   1-week schedule and tasks
```

## Quick start (for every member)

1. Clone the repo and switch to your branch:
   ```
   git clone <repo-url>
   cd <repo-folder>
   git checkout <your-branch>
   ```
2. Create a free [Supabase](https://supabase.com) project → **SQL Editor** → paste `database/database.sql` → **Run**.
3. Build your part (see `PROJECT_PLAN.md` and the README in your folder).
4. Commit and push to your branch, then open a Pull Request to `main`.

Never commit passwords or API keys. Use `.env.example` as a guide and keep real values in the group chat.
