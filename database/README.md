# Database (PostgreSQL / Supabase)

**Owner:** Member 2 · **Branch:** `feat/database`

## Setup
1. Create a free project at [supabase.com](https://supabase.com).
2. **SQL Editor** → paste `database.sql` → **Run**.
3. Connection details: **Project Settings → Database** (host, port 5432, database `postgres`, user, password, SSL on).

`database.sql` drops and recreates all tables, so running it again resets the demo data.

## Tables (the contract: don't rename without telling the team)

### departments
| Column | Type |
|---|---|
| id | SERIAL PK |
| name | VARCHAR(50), unique |

### employees
| Column | Type | Notes |
|---|---|---|
| id | SERIAL PK | |
| full_name | VARCHAR(100) | |
| email | VARCHAR(150), unique | Same email as the Budibase login |
| phone | VARCHAR(20) | |
| department_id | INT → departments.id | NULL for the manager |
| role | 'manager' / 'employee' | |
| is_active | BOOLEAN | |
| created_at | TIMESTAMP | |

### products
| Column | Type | Notes |
|---|---|---|
| id | SERIAL PK | |
| product_name | VARCHAR(100) | |
| department_id | INT → departments.id | |
| quantity | INT ≥ 0 | |
| price | NUMERIC(10,2) | |
| expiry_date | DATE | |
| discount_percent | INT | Set by n8n |
| action | VARCHAR(100) | Set by n8n |
| last_checked | TIMESTAMP | Set by n8n |

### customer_offers (view, read-only)
`product_name, department, original_price, discount_percent, offer_price, best_before`

Shows only products with a discount, not expired and in stock.

## Discount rules
| Days left | discount_percent | action |
|---|---|---|
| < 0 | 0 | EXPIRED - Remove from shelf |
| 0–1 | 30 | Apply 30% discount |
| 2–3 | 20 | Apply 20% discount |
| > 3 | 0 | No action |
