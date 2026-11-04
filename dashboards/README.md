# Dashboards (Budibase)

One shared Budibase app, created by Member 6 on Day 1. Each member edits **only their own screens**.

| Screens | Owner | Branch | Role |
|---|---|---|---|
| `/manager/overview`, `/manager/products`, `/manager/departments`, `/manager/employees` | Member 5 | `feat/manager-dashboard` | Admin |
| `/employee/stock`, `/employee/add-stock` + login and roles setup | Member 6 | `feat/employee-dashboard` | Basic |
| `/offers` | Member 7 | `feat/customer-offers` | Public |

## Setup (Member 6, Day 1)
1. Create a free account at [budibase.com](https://budibase.com) → **Create app**.
2. **Data → Add source → PostgreSQL** → enter the Supabase details → **Fetch tables**.
3. **Users → Invite** Members 5 and 7 as **builders**.

## Roles
| Role | Who | Screens |
|---|---|---|
| Admin | Manager | All `/manager/*` |
| Basic | Employees | `/employee/*` |
| Public | Customers (no login) | `/offers` |

Employee department filter: `employees.email = {{ Current User.email }}`.

## What goes in GitHub
- `screenshots/`: a screenshot of every finished screen (name: `member5-overview.png` etc.)
- `budibase-export.tar.gz`: exported by Member 6 at the end (**Settings → Export app**)
