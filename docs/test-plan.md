# Test Plan

**Owner:** Member 1 · Fill in the Result column on Day 6.

| # | Area | Test | Expected | Result |
|---|---|---|---|---|
| 1 | Database | Run `database.sql` on a new Supabase project | 8 departments, 6 employees, 20 products | |
| 2 | n8n | Run expiry workflow | Milk 30%, Bread 20%, Eggs "EXPIRED", Yogurt "No action" | |
| 3 | n8n | No product expiring within 3 days | No email sent | |
| 4 | Email | Manager alert | One email listing all products that need attention | |
| 5 | Email | Department alert | Dairy employee gets only Dairy products | |
| 6 | Login | Manager logs in | Sees all manager screens | |
| 7 | Login | Employee logs in | Sees only their department's products | |
| 8 | Login | Employee opens a manager screen | Access denied | |
| 9 | Login | Wrong password | Login fails | |
| 10 | Manager | Add employee to Bakery | Appears in the employees list with Bakery | |
| 11 | Employee | Update milk quantity 20 → 12 | Manager overview shows 12 | |
| 12 | Customer | Open offers page without login | Only discounted, in-stock, not-expired items | |
| 13 | Customer | Offers page on a phone | Readable, no sideways scrolling | |
| 14 | End-to-end | Add product expiring tomorrow → run n8n → open offers | Product shows at 30% off | |
