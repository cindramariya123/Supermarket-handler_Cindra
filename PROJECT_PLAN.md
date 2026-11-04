# Expiry Date Monitoring & Food Waste Reduction: 1-Week Project Plan

**Team:** 7 members · **Duration:** 7 days · **Tools:** PostgreSQL (Supabase), n8n, Budibase, GitHub Projects

Replace "Sandra–7" with your names.

---

## 1. Who owns what

| Member | Role | Branch | Folder |
|---|---|---|---|
| 1 | Team Lead & Integration | `feat/integration` | `docs/` (architecture, test plan) |
| 2 | Database | `feat/database` | `database/` |
| 3 | n8n Expiry Automation | `feat/n8n-expiry` | `n8n/expiry-check.json` |
| 4 | Notifications & AI | `feat/notifications` | `n8n/notifications.json` |
| 5 | Manager Dashboard (Admin) | `feat/manager-dashboard` | `dashboards/` (manager screens) |
| 6 | Employee Dashboard & Login | `feat/employee-dashboard` | `dashboards/` (employee screens, roles) |
| 7 | Customer Offers Page & Report | `feat/customer-offers` | `dashboards/` (offers screen), `docs/` |

---

## 2. Schedule (7 days)

| Day | Focus | Everyone does |
|---|---|---|
| **Day 1** | Setup | Create accounts (Supabase, n8n, Budibase), run `database.sql` in **your own** Supabase, check out your branch, quick wireframe/plan of your part. Shared tools ready by evening. |
| **Day 2** | Build | Build the main feature of your part |
| **Day 3** | Build | Finish your part's features |
| **Day 4** | Finish & self-test | Test your own part, fix bugs, push to your branch, open a Pull Request |
| **Day 5** | **Integration day** | Morning: Sandra merges all PRs and everyone switches to the **shared** Supabase. Afternoon: fix integration problems. **Report sections due.** |
| **Day 6** | Testing & docs | Run the full test plan, take final screenshots, Tpraiz combines the report |
| **Day 7** | Presentation | Slides, demo rehearsal (twice), backup demo video, submit |

**Check-ins:** 10 minutes every evening (Days 1–6): what I finished, what's next, what's blocking me.

---

## 3. Tasks (4 per member)

### Sandra: Team Lead & Integration
| ID | Day | Task | Done when |
|---|---|---|---|
| 1.1 | D1 | Push this repo to GitHub, create the 7 branches, set up the Project board (section 6) | Everyone can check out their branch |
| 1.2 | D1 | Create the shared n8n Cloud workspace, invite Members 3 & 4 | Both can log in |
| 1.3 | D2–3 | Architecture diagram (DB + n8n + 3 dashboards + 3 user types) | `docs/diagrams/architecture.png` |
| 1.4 | D5–6 | Merge all PRs, lead integration, run `docs/test-plan.md` | All tests have a result |

### Cindra: Database
| ID | Day | Task | Done when |
|---|---|---|---|
| 2.1 | D1 | Create the **shared** Supabase project, run `database.sql`, share connection details privately | Team can connect |
| 2.2 | D2 | ER diagram of departments, employees, products, customer_offers | `docs/diagrams/er-diagram.png` |
| 2.3 | D3 | Live discount view so discounts are always up to date on the dashboards | View returns correct values |
| 2.4 | D4 | 50+ realistic sample products across all departments, keep `database/README.md` up to date | Data covers every expiry case |

### Nilsha: n8n Expiry Automation
| ID | Day | Task | Done when |
|---|---|---|---|
| 3.1 | D1 | Learn n8n basics, import `n8n/expiry-check.json`, connect your own Supabase | Test run succeeds |
| 3.2 | D2 | Daily workflow: Schedule → calculate & save discounts → get expiring products | Discounts appear in the DB |
| 3.3 | D3 | Manager alert email + "no email if nothing is expiring" | Correct email received |
| 3.4 | D4 | Test with expired / today / 1–3 days / none, export JSON to `n8n/` | All cases pass |

### Nayma: Notifications & AI
| ID | Day | Task | Done when |
|---|---|---|---|
| 4.1 | D1 | Design the alert email layout (manager + department version) | Shared in the group |
| 4.2 | D2–3 | `notifications.json`: email each employee about **their department's** products | Dairy employee gets only Dairy items |
| 4.3 | D3–4 | Optional: Gemini suggests discount % from days left + quantity | AI result shown in the email |
| 4.4 | D4 | Export JSON to `n8n/`, screenshots | Pushed to branch |

### Prionto: Manager Dashboard (Admin)
| ID | Day | Task | Done when |
|---|---|---|---|
| 5.1 | D1 | Wireframe of the manager screens | Shared in the group |
| 5.2 | D2 | Overview: expired count, expiring today, active offers, stock value at risk | Numbers match the DB |
| 5.3 | D3 | Products screen: list, add, edit, delete | All 4 actions work |
| 5.4 | D4 | Departments + employees screens: add an employee to a department, deactivate | Employee appears in the right department |

### Sachini: Employee Dashboard & Login
| ID | Day | Task | Done when |
|---|---|---|---|
| 6.1 | D1 | Create the **shared** Budibase app, connect PostgreSQL, invite Members 5 & 7 as builders | All 3 can edit |
| 6.2 | D2 | Login + roles: Admin (manager), Basic (employee), Public (offers) | Wrong role can't open a screen |
| 6.3 | D3 | Employee screen showing only their department's products | Each employee sees only their department |
| 6.4 | D4 | Stock update form (change quantity, add new stock); export the Budibase app on D6 | Changes saved to the DB |

### Tpraiz: Customer Offers Page & Report
| ID | Day | Task | Done when |
|---|---|---|---|
| 7.1 | D1 | Report outline in `docs/README.md` (already there), share the template with the team | Everyone knows their section |
| 7.2 | D2–3 | Public offers page from `customer_offers`: name, old price, discount, new price, department filter | Only discounted items shown |
| 7.3 | D4 | QR code for the offers page, check it on mobile | Works on a phone |
| 7.4 | D6–7 | Combine the report from `docs/report-sections/`, make the slides, record a backup demo video | Report + slides ready |

**Everyone:** write your report section by **Day 5** (copy `docs/report-sections/TEMPLATE.md`).

---

## 4. Rules for working independently

1. **The database is the contract.** Build against `database/database.sql`. Never rename a table or column without telling the team.
2. **Don't wait. Use your own copy.** Days 1–4: everyone uses their own free Supabase. Day 5: switch to the shared one.
3. **Stay in your own lane.** Change only your own folder or files. In Budibase, edit only your own screens.
4. **One branch per member.** Push often. Open a Pull Request on Day 4, and Sandra merges on Day 5.
5. **No secrets in GitHub.** Real passwords go only in the group chat (see `.env.example`).

### The only things you wait for (all ready by the evening of Day 1)
| What | From |
|---|---|
| Shared Supabase details | Cindra |
| Shared Budibase app | Sachini |
| Shared n8n workspace | Sandra |

---

## 5. Repo setup (Sandra, Day 1)

```bash
git init
git add .
git commit -m "Initial project structure"
git branch -M main
git remote add origin https://github.com/<user>/<repo>.git
git push -u origin main

for b in feat/integration feat/database feat/n8n-expiry feat/notifications feat/manager-dashboard feat/employee-dashboard feat/customer-offers; do
  git branch $b
  git push -u origin $b
done
```

**Every other member:**
```bash
git clone https://github.com/<user>/<repo>.git
cd <repo>
git checkout feat/<your-branch>
# ...work...
git add .
git commit -m "3.2 Daily expiry workflow"
git push
```

---

## 6. GitHub Projects board

- **Columns:** `Todo` → `In Progress` → `Review` → `Done`
- **Labels:** `database`, `n8n`, `notifications`, `dashboard-manager`, `dashboard-employee`, `dashboard-customer`, `docs`, `integration`
- **Iterations / milestones:** `Day 1 – Setup`, `Day 2–4 – Build`, `Day 5 – Integration`, `Day 6–7 – Test & Present`
- **One issue per task** (28 issues), title like `3.2 Daily expiry workflow`, assigned to its owner
- A card is **Done** only when its "Done when" check passes and the work is pushed.

---

## 7. Final demo (Day 7, about 5 minutes)

1. Employee logs in → sees only their department → adds milk expiring tomorrow.
2. Run the n8n workflow → milk gets a 30% discount.
3. Manager gets the alert email; the department employee gets their alert.
4. Customer scans the QR code → sees milk at 30% off.
5. Manager logs in → overview updates → adds a new employee to Bakery.
6. Employee tries to open a manager screen → access denied.
