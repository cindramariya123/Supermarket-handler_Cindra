-- Expiry Date Monitoring - PostgreSQL database
-- Run this once in pgAdmin / Supabase SQL editor / psql
-- WARNING: running it again deletes and recreates all tables

DROP VIEW  IF EXISTS customer_offers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 1. Departments
CREATE TABLE departments (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- 2. Employees (login accounts are created in the dashboard tool;
--    this table stores who they are and which department they work in)
CREATE TABLE employees (
    id            SERIAL PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(150) UNIQUE NOT NULL,
    phone         VARCHAR(20),
    department_id INT REFERENCES departments(id),
    role          VARCHAR(20)  NOT NULL DEFAULT 'employee'
                  CHECK (role IN ('manager', 'employee')),
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at    TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- 3. Products
CREATE TABLE products (
    id               SERIAL PRIMARY KEY,
    product_name     VARCHAR(100)  NOT NULL,
    department_id    INT           NOT NULL REFERENCES departments(id),
    quantity         INT           NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    price            NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    expiry_date      DATE          NOT NULL,
    discount_percent INT           DEFAULT 0,
    action           VARCHAR(100)  DEFAULT 'No action',
    last_checked     TIMESTAMP
);

-- 4. Customer offers (read-only view for the public offers page)
CREATE VIEW customer_offers AS
SELECT
    p.product_name,
    d.name AS department,
    p.price AS original_price,
    p.discount_percent,
    ROUND(p.price * (100 - p.discount_percent) / 100, 2) AS offer_price,
    p.expiry_date AS best_before
FROM products p
JOIN departments d ON d.id = p.department_id
WHERE p.discount_percent > 0
  AND p.expiry_date >= CURRENT_DATE
  AND p.quantity > 0;

-- ---------- Sample data ----------

INSERT INTO departments (name) VALUES
('Dairy'), ('Bakery'), ('Meat'), ('Vegetables'),
('Fruits'), ('Beverages'), ('Snacks'), ('Grocery');

INSERT INTO employees (full_name, email, phone, department_id, role)
SELECT v.full_name, v.email, v.phone, d.id, v.role
FROM (VALUES
    ('Store Manager', 'manager@example.com',  '9000000001', NULL,         'manager'),
    ('Anu Thomas',    'anu@example.com',      '9000000002', 'Dairy',      'employee'),
    ('Rahul Nair',    'rahul@example.com',    '9000000003', 'Bakery',     'employee'),
    ('Fathima K',     'fathima@example.com',  '9000000004', 'Meat',       'employee'),
    ('Arjun Menon',   'arjun@example.com',    '9000000005', 'Vegetables', 'employee'),
    ('Sneha Pillai',  'sneha@example.com',    '9000000006', 'Fruits',     'employee')
) AS v(full_name, email, phone, dept, role)
LEFT JOIN departments d ON d.name = v.dept;

-- Dates are relative to today, so the demo always shows every case
INSERT INTO products (product_name, department_id, quantity, price, expiry_date)
SELECT v.name, d.id, v.qty, v.price, CURRENT_DATE + v.days
FROM (VALUES
    ('Milk',         'Dairy',       20,  30.00,   1),
    ('Bread',        'Bakery',      15,  45.00,   2),
    ('Yogurt',       'Dairy',       30,  25.00,  10),
    ('Eggs',         'Dairy',       40,   7.00,  -1),
    ('Cake',         'Bakery',       8, 350.00,   3),
    ('Paneer',       'Dairy',       12,  90.00,   1),
    ('Butter',       'Dairy',       25,  60.00,  27),
    ('Buns',         'Bakery',      30,  20.00,   2),
    ('Chicken',      'Meat',        10, 240.00,   0),
    ('Fish',         'Meat',         6, 300.00,   1),
    ('Tomatoes',     'Vegetables',  50,  40.00,   3),
    ('Spinach',      'Vegetables',  18,  30.00,   1),
    ('Bananas',      'Fruits',      60,  50.00,   4),
    ('Apples',       'Fruits',      45, 180.00,  16),
    ('Orange Juice', 'Beverages',   22, 120.00,   6),
    ('Cheese',       'Dairy',       14, 150.00,  21),
    ('Curd',         'Dairy',       35,  35.00,   2),
    ('Biscuits',     'Snacks',      80,  30.00, 130),
    ('Rice',         'Grocery',    100,  65.00, 270),
    ('Noodles',      'Grocery',     70,  15.00,  67)
) AS v(name, dept, qty, price, days)
JOIN departments d ON d.name = v.dept;

-- Check
SELECT p.product_name, d.name AS department, p.quantity, p.price, p.expiry_date
FROM products p JOIN departments d ON d.id = p.department_id
ORDER BY p.expiry_date;
