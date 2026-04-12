import '../models/snippet.dart';

List<Snippet> getSqlSnippets() {
  return [
    Snippet()..snippetId='sql_001'..topicId='sql'..title='SELECT Basics'..description='Retrieve data from tables with SELECT. Use WHERE to filter, ORDER BY to sort.'..code='''-- Select all columns
SELECT * FROM users;

-- Select specific columns
SELECT name, email FROM users;

-- Filter with WHERE
SELECT * FROM users WHERE age > 18;

-- Sort results
SELECT * FROM users ORDER BY name ASC;

-- Limit results
SELECT * FROM users LIMIT 10;

-- Distinct values
SELECT DISTINCT city FROM users;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_002'..topicId='sql'..title='WHERE Clauses'..description='Filter rows with comparison, logical, LIKE, IN, BETWEEN, and NULL checks.'..code='''-- Comparison
SELECT * FROM products WHERE price > 100;
SELECT * FROM users WHERE status != 'inactive';

-- Logical operators
SELECT * FROM users WHERE age >= 18 AND city = 'NYC';
SELECT * FROM orders WHERE total > 500 OR priority = 'high';

-- Pattern matching
SELECT * FROM users WHERE name LIKE 'A%';
SELECT * FROM users WHERE email LIKE '%@gmail.com';

-- Range
SELECT * FROM products WHERE price BETWEEN 10 AND 50;

-- Set membership
SELECT * FROM users WHERE city IN ('NYC', 'LA', 'Chicago');

-- NULL check
SELECT * FROM users WHERE phone IS NULL;
SELECT * FROM users WHERE phone IS NOT NULL;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_003'..topicId='sql'..title='INSERT, UPDATE, DELETE'..description='Modify data with INSERT for new rows, UPDATE to change existing, DELETE to remove.'..code='''-- Insert single row
INSERT INTO users (name, email, age)
VALUES ('Alice', 'alice@example.com', 30);

-- Insert multiple rows
INSERT INTO users (name, email, age) VALUES
  ('Bob', 'bob@example.com', 25),
  ('Charlie', 'charlie@example.com', 35);

-- Update rows
UPDATE users SET age = 31 WHERE name = 'Alice';
UPDATE products SET price = price * 0.9 WHERE category = 'sale';

-- Delete rows
DELETE FROM users WHERE id = 5;
DELETE FROM orders WHERE created_at < '2023-01-01';'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_004'..topicId='sql'..title='CREATE TABLE'..description='Define table structure with columns, data types, and constraints.'..code='''CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  age INTEGER CHECK(age >= 0),
  city VARCHAR(100) DEFAULT 'Unknown',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  status VARCHAR(20) DEFAULT 'pending',
  FOREIGN KEY (user_id) REFERENCES users(id)
);'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_005'..topicId='sql'..title='Aggregate Functions'..description='COUNT, SUM, AVG, MIN, MAX summarize data across rows.'..code='''-- Count rows
SELECT COUNT(*) FROM users;
SELECT COUNT(DISTINCT city) FROM users;

-- Sum and average
SELECT SUM(total) AS total_revenue FROM orders;
SELECT AVG(age) AS avg_age FROM users;

-- Min and max
SELECT MIN(price), MAX(price) FROM products;

-- Combined
SELECT
  COUNT(*) AS order_count,
  SUM(total) AS revenue,
  AVG(total) AS avg_order,
  MIN(total) AS smallest,
  MAX(total) AS largest
FROM orders
WHERE status = 'completed';'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_006'..topicId='sql'..title='GROUP BY and HAVING'..description='Group rows by columns and filter groups with HAVING (like WHERE for aggregates).'..code='''-- Count users per city
SELECT city, COUNT(*) AS user_count
FROM users
GROUP BY city
ORDER BY user_count DESC;

-- Revenue by category
SELECT category, SUM(price * quantity) AS revenue
FROM order_items
GROUP BY category
HAVING SUM(price * quantity) > 1000;

-- Multiple grouping
SELECT YEAR(created_at) AS yr, MONTH(created_at) AS mo,
       COUNT(*) AS orders
FROM orders
GROUP BY yr, mo
ORDER BY yr, mo;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_007'..topicId='sql'..title='String Functions'..description='Manipulate text with CONCAT, UPPER, LOWER, TRIM, SUBSTRING, LENGTH, REPLACE.'..code='''SELECT
  UPPER(name) AS upper_name,
  LOWER(email) AS lower_email,
  LENGTH(name) AS name_len,
  CONCAT(name, ' (', city, ')') AS display,
  SUBSTRING(email, 1, INSTR(email, '@') - 1) AS username,
  REPLACE(phone, '-', '') AS clean_phone,
  TRIM(name) AS trimmed
FROM users;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_008'..topicId='sql'..title='Date Functions'..description='Work with dates: extract parts, calculate differences, format output.'..code='''SELECT
  CURRENT_DATE AS today,
  CURRENT_TIMESTAMP AS now,
  DATE('now', '+7 days') AS next_week,
  DATE('now', '-1 month') AS last_month;

-- Extract parts
SELECT
  strftime('%Y', created_at) AS year,
  strftime('%m', created_at) AS month,
  strftime('%d', created_at) AS day
FROM orders;

-- Age calculation
SELECT name,
  (strftime('%Y', 'now') - strftime('%Y', birth_date)) AS age
FROM users;

-- Filter by date range
SELECT * FROM orders
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_009'..topicId='sql'..title='CASE Expression'..description='Conditional logic in queries. Like if-else for SQL columns.'..code='''SELECT name, age,
  CASE
    WHEN age < 13 THEN 'Child'
    WHEN age < 18 THEN 'Teen'
    WHEN age < 65 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group
FROM users;

-- Conditional aggregation
SELECT
  COUNT(CASE WHEN status = 'active' THEN 1 END) AS active,
  COUNT(CASE WHEN status = 'inactive' THEN 1 END) AS inactive,
  COUNT(*) AS total
FROM users;

-- Conditional ordering
SELECT * FROM tasks
ORDER BY
  CASE priority
    WHEN 'high' THEN 1
    WHEN 'medium' THEN 2
    WHEN 'low' THEN 3
  END;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_010'..topicId='sql'..title='ALTER TABLE'..description='Modify existing table structure: add/drop columns, rename, add constraints.'..code='''-- Add column
ALTER TABLE users ADD COLUMN phone VARCHAR(20);

-- Drop column
ALTER TABLE users DROP COLUMN phone;

-- Rename column
ALTER TABLE users RENAME COLUMN name TO full_name;

-- Rename table
ALTER TABLE users RENAME TO customers;

-- Add constraint
ALTER TABLE users ADD CONSTRAINT unique_email UNIQUE (email);

-- Create index
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_orders_user ON orders(user_id, created_at);

-- Drop index
DROP INDEX idx_users_email;'''..language='sql'..difficulty='very_easy'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_011'..topicId='sql'..title='JOIN Types'..description='Combine data from multiple tables using INNER, LEFT, RIGHT, and FULL joins.'..code='''-- INNER JOIN (matching rows only)
SELECT u.name, o.total
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- LEFT JOIN (all left + matching right)
SELECT u.name, COUNT(o.id) AS order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

-- Multiple joins
SELECT u.name, o.id AS order_id, p.name AS product
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Self join
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_012'..topicId='sql'..title='Subqueries'..description='Nested queries used as values, tables, or conditions within outer queries.'..code='''-- Scalar subquery
SELECT name, age,
  (SELECT AVG(age) FROM users) AS avg_age
FROM users;

-- IN subquery
SELECT * FROM users
WHERE id IN (SELECT user_id FROM orders WHERE total > 100);

-- EXISTS subquery
SELECT * FROM users u
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.user_id = u.id
);

-- Derived table
SELECT city, avg_age FROM (
  SELECT city, AVG(age) AS avg_age
  FROM users GROUP BY city
) AS city_stats
WHERE avg_age > 25;

-- Correlated subquery
SELECT name, (
  SELECT COUNT(*) FROM orders o WHERE o.user_id = u.id
) AS order_count
FROM users u;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_013'..topicId='sql'..title='Window Functions'..description='Perform calculations across related rows without grouping. ROW_NUMBER, RANK, LAG, LEAD.'..code='''-- Row number
SELECT name, city,
  ROW_NUMBER() OVER (ORDER BY age DESC) AS row_num
FROM users;

-- Rank within groups
SELECT name, city, age,
  RANK() OVER (PARTITION BY city ORDER BY age DESC) AS city_rank
FROM users;

-- Running total
SELECT date, amount,
  SUM(amount) OVER (ORDER BY date) AS running_total
FROM transactions;

-- LAG and LEAD
SELECT date, revenue,
  LAG(revenue) OVER (ORDER BY date) AS prev_revenue,
  LEAD(revenue) OVER (ORDER BY date) AS next_revenue,
  revenue - LAG(revenue) OVER (ORDER BY date) AS growth
FROM monthly_revenue;

-- NTILE for percentiles
SELECT name, score,
  NTILE(4) OVER (ORDER BY score DESC) AS quartile
FROM students;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_014'..topicId='sql'..title='Common Table Expressions (CTE)'..description='WITH clause creates named temporary result sets for readable, modular queries.'..code='''-- Basic CTE
WITH active_users AS (
  SELECT * FROM users WHERE status = 'active'
)
SELECT city, COUNT(*) AS count
FROM active_users
GROUP BY city;

-- Multiple CTEs
WITH
  user_orders AS (
    SELECT user_id, COUNT(*) AS cnt, SUM(total) AS revenue
    FROM orders GROUP BY user_id
  ),
  top_users AS (
    SELECT * FROM user_orders WHERE revenue > 1000
  )
SELECT u.name, t.cnt, t.revenue
FROM users u
JOIN top_users t ON u.id = t.user_id;

-- Recursive CTE (hierarchical data)
WITH RECURSIVE org_chart AS (
  SELECT id, name, manager_id, 0 AS level
  FROM employees WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, e.manager_id, oc.level + 1
  FROM employees e
  JOIN org_chart oc ON e.manager_id = oc.id
)
SELECT * FROM org_chart ORDER BY level;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_015'..topicId='sql'..title='UNION and Set Operations'..description='Combine result sets with UNION, INTERSECT, and EXCEPT.'..code='''-- UNION (removes duplicates)
SELECT name, email FROM customers
UNION
SELECT name, email FROM suppliers;

-- UNION ALL (keeps duplicates, faster)
SELECT name, 'customer' AS type FROM customers
UNION ALL
SELECT name, 'supplier' AS type FROM suppliers;

-- INTERSECT (common rows)
SELECT email FROM newsletter_subscribers
INTERSECT
SELECT email FROM customers;

-- EXCEPT (in first but not second)
SELECT email FROM customers
EXCEPT
SELECT email FROM unsubscribed;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_016'..topicId='sql'..title='Views'..description='Virtual tables defined by queries. Simplify complex queries and control data access.'..code='''-- Create view
CREATE VIEW active_user_orders AS
SELECT u.name, u.email, o.id AS order_id, o.total
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE u.status = 'active';

-- Use view like a table
SELECT * FROM active_user_orders WHERE total > 100;

-- Create or replace
CREATE OR REPLACE VIEW user_stats AS
SELECT u.id, u.name,
  COUNT(o.id) AS order_count,
  COALESCE(SUM(o.total), 0) AS total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

-- Drop view
DROP VIEW IF EXISTS active_user_orders;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_017'..topicId='sql'..title='Indexes and Performance'..description='Create indexes to speed up queries. Understand when indexes help and when they hurt.'..code='''-- Single column index
CREATE INDEX idx_users_email ON users(email);

-- Composite index
CREATE INDEX idx_orders_user_date ON orders(user_id, created_at);

-- Unique index
CREATE UNIQUE INDEX idx_users_username ON users(username);

-- Partial index (filtered)
CREATE INDEX idx_active_users ON users(email)
WHERE status = 'active';

-- EXPLAIN query plan
EXPLAIN QUERY PLAN
SELECT * FROM users WHERE email = 'test@test.com';

-- Covering index (includes all needed columns)
CREATE INDEX idx_orders_cover
ON orders(user_id, status, total);

-- Drop index
DROP INDEX IF EXISTS idx_users_email;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_018'..topicId='sql'..title='Transactions'..description='Group operations atomically. All succeed or all fail. ACID properties.'..code='''-- Basic transaction
BEGIN TRANSACTION;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;

-- With error handling
BEGIN TRANSACTION;
  INSERT INTO orders (user_id, total) VALUES (1, 99.99);
  INSERT INTO order_items (order_id, product_id, qty)
    VALUES (LAST_INSERT_ROWID(), 5, 2);
  -- If any error, rollback:
  -- ROLLBACK;
COMMIT;

-- Savepoints for partial rollback
BEGIN TRANSACTION;
  INSERT INTO logs (msg) VALUES ('step 1');
  SAVEPOINT step2;
  INSERT INTO logs (msg) VALUES ('step 2');
  ROLLBACK TO step2;  -- undo step 2 only
  INSERT INTO logs (msg) VALUES ('step 2 retry');
COMMIT;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_019'..topicId='sql'..title='COALESCE and NULLIF'..description='Handle NULL values with COALESCE (first non-null) and NULLIF (return null if equal).'..code='''-- COALESCE: first non-null value
SELECT name,
  COALESCE(phone, email, 'No contact') AS contact
FROM users;

-- Default values for NULLs
SELECT name,
  COALESCE(nickname, name) AS display_name,
  COALESCE(bio, 'No bio yet') AS bio
FROM users;

-- NULLIF: returns NULL if values are equal
SELECT revenue / NULLIF(orders, 0) AS avg_order
FROM monthly_stats;  -- avoids division by zero

-- IIF (inline if)
SELECT name,
  IIF(age >= 18, 'Adult', 'Minor') AS category
FROM users;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_020'..topicId='sql'..title='Triggers'..description='Automatically execute code when INSERT, UPDATE, or DELETE occurs on a table.'..code='''-- Audit trigger
CREATE TRIGGER audit_user_update
AFTER UPDATE ON users
BEGIN
  INSERT INTO audit_log (table_name, action, old_data, new_data, changed_at)
  VALUES ('users', 'UPDATE',
    OLD.name || '|' || OLD.email,
    NEW.name || '|' || NEW.email,
    CURRENT_TIMESTAMP);
END;

-- Auto-update timestamp
CREATE TRIGGER update_timestamp
AFTER UPDATE ON posts
BEGIN
  UPDATE posts SET updated_at = CURRENT_TIMESTAMP
  WHERE id = NEW.id;
END;

-- Prevent deletion
CREATE TRIGGER prevent_admin_delete
BEFORE DELETE ON users
WHEN OLD.role = 'admin'
BEGIN
  SELECT RAISE(ABORT, 'Cannot delete admin users');
END;'''..language='sql'..difficulty='medium'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_021'..topicId='sql'..title='Advanced Window Functions'..description='FIRST_VALUE, LAST_VALUE, NTH_VALUE, and custom frames for advanced analytics.'..code='''-- First and last in group
SELECT name, department, salary,
  FIRST_VALUE(name) OVER (
    PARTITION BY department ORDER BY salary DESC
  ) AS highest_paid
FROM employees;

-- Moving average
SELECT date, revenue,
  AVG(revenue) OVER (
    ORDER BY date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg_3
FROM daily_revenue;

-- Percent of total
SELECT name, salary,
  salary * 100.0 / SUM(salary) OVER () AS pct_of_total
FROM employees;

-- Dense rank (no gaps)
SELECT name, score,
  DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM students;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_022'..topicId='sql'..title='Pivot / Crosstab Queries'..description='Transform rows to columns for summary reports using CASE with aggregation.'..code='''-- Monthly revenue by category (pivot)
SELECT category,
  SUM(CASE WHEN month = 1 THEN revenue ELSE 0 END) AS Jan,
  SUM(CASE WHEN month = 2 THEN revenue ELSE 0 END) AS Feb,
  SUM(CASE WHEN month = 3 THEN revenue ELSE 0 END) AS Mar
FROM monthly_sales
GROUP BY category;

-- Status summary
SELECT
  SUM(CASE WHEN status='pending' THEN 1 ELSE 0 END) AS pending,
  SUM(CASE WHEN status='shipped' THEN 1 ELSE 0 END) AS shipped,
  SUM(CASE WHEN status='delivered' THEN 1 ELSE 0 END) AS delivered
FROM orders;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_023'..topicId='sql'..title='JSON in SQL'..description='Store and query JSON data within SQL databases.'..code='''-- Create table with JSON column
CREATE TABLE events (
  id INTEGER PRIMARY KEY,
  data JSON NOT NULL
);

-- Insert JSON
INSERT INTO events (data) VALUES
  (\'{"type":"click","x":100,"y":200}\'),
  (\'{"type":"scroll","offset":500}\');

-- Extract JSON values
SELECT
  json_extract(data, '\$.type') AS event_type,
  json_extract(data, '\$.x') AS x
FROM events;

-- Filter by JSON value
SELECT * FROM events
WHERE json_extract(data, '\$.type') = 'click';

-- JSON array
SELECT json_group_array(name) AS names
FROM users WHERE city = 'NYC';

-- JSON object
SELECT json_object('name', name, 'age', age)
FROM users LIMIT 5;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_024'..topicId='sql'..title='Stored Procedures'..description='Reusable named SQL blocks with parameters, variables, and control flow.'..code='''-- Create procedure (MySQL syntax)
DELIMITER //
CREATE PROCEDURE GetUserOrders(IN userId INT)
BEGIN
  SELECT o.id, o.total, o.created_at
  FROM orders o
  WHERE o.user_id = userId
  ORDER BY o.created_at DESC;
END //
DELIMITER ;

-- Call procedure
CALL GetUserOrders(42);

-- Procedure with output
DELIMITER //
CREATE PROCEDURE GetOrderStats(
  IN userId INT,
  OUT orderCount INT,
  OUT totalSpent DECIMAL(10,2)
)
BEGIN
  SELECT COUNT(*), COALESCE(SUM(total), 0)
  INTO orderCount, totalSpent
  FROM orders WHERE user_id = userId;
END //
DELIMITER ;

-- Drop procedure
DROP PROCEDURE IF EXISTS GetUserOrders;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_025'..topicId='sql'..title='Recursive CTE - Hierarchies'..description='Query hierarchical data like org charts, categories, or threaded comments.'..code='''-- Organization hierarchy
WITH RECURSIVE org AS (
  -- Base: top-level (CEO)
  SELECT id, name, manager_id, name AS path, 0 AS depth
  FROM employees WHERE manager_id IS NULL

  UNION ALL

  -- Recursive: employees under each manager
  SELECT e.id, e.name, e.manager_id,
    org.path || ' > ' || e.name,
    org.depth + 1
  FROM employees e
  JOIN org ON e.manager_id = org.id
)
SELECT depth, name, path FROM org ORDER BY path;

-- Category tree
WITH RECURSIVE cat_tree AS (
  SELECT id, name, parent_id, CAST(name AS TEXT) AS full_path
  FROM categories WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id,
    ct.full_path || ' / ' || c.name
  FROM categories c
  JOIN cat_tree ct ON c.parent_id = ct.id
)
SELECT * FROM cat_tree;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_026'..topicId='sql'..title='UPSERT (INSERT OR REPLACE)'..description='Insert if not exists, update if exists. Different syntax per database.'..code='''-- SQLite: INSERT OR REPLACE
INSERT OR REPLACE INTO users (id, name, email)
VALUES (1, 'Alice', 'alice@new.com');

-- SQLite: ON CONFLICT
INSERT INTO users (email, name, login_count)
VALUES ('alice@test.com', 'Alice', 1)
ON CONFLICT(email) DO UPDATE SET
  login_count = login_count + 1,
  last_login = CURRENT_TIMESTAMP;

-- PostgreSQL: ON CONFLICT
INSERT INTO users (email, name)
VALUES ('test@test.com', 'Test')
ON CONFLICT (email) DO UPDATE
SET name = EXCLUDED.name;

-- MySQL: ON DUPLICATE KEY
INSERT INTO users (email, name)
VALUES ('test@test.com', 'Test')
ON DUPLICATE KEY UPDATE name = VALUES(name);'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_027'..topicId='sql'..title='Lateral Joins'..description='Apply a subquery for each row of the outer table. Powerful for top-N-per-group queries.'..code='''-- Top 3 orders per user (PostgreSQL)
SELECT u.name, t.order_id, t.total
FROM users u,
LATERAL (
  SELECT o.id AS order_id, o.total
  FROM orders o
  WHERE o.user_id = u.id
  ORDER BY o.total DESC
  LIMIT 3
) t;

-- Equivalent with window function
WITH ranked AS (
  SELECT u.name, o.id AS order_id, o.total,
    ROW_NUMBER() OVER (
      PARTITION BY o.user_id ORDER BY o.total DESC
    ) AS rn
  FROM users u
  JOIN orders o ON u.id = o.user_id
)
SELECT name, order_id, total
FROM ranked WHERE rn <= 3;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_028'..topicId='sql'..title='Full-Text Search'..description='Search text content efficiently using FTS indexes instead of LIKE patterns.'..code='''-- SQLite FTS5
CREATE VIRTUAL TABLE articles_fts USING fts5(title, body);

-- Insert data
INSERT INTO articles_fts (title, body) VALUES
  ('SQL Tutorial', 'Learn SQL from basics to advanced'),
  ('Database Design', 'Normalization and schema design');

-- Search
SELECT * FROM articles_fts WHERE articles_fts MATCH 'SQL';

-- Boolean search
SELECT * FROM articles_fts
WHERE articles_fts MATCH 'SQL AND advanced';

-- Ranked results with BM25
SELECT *, rank FROM articles_fts
WHERE articles_fts MATCH 'database'
ORDER BY rank;

-- Highlight matches
SELECT highlight(articles_fts, 0, '<b>', '</b>') AS title
FROM articles_fts
WHERE articles_fts MATCH 'SQL';'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_029'..topicId='sql'..title='Materialized Views'..description='Precomputed query results stored as a table for fast reads. Must be refreshed.'..code='''-- PostgreSQL materialized view
CREATE MATERIALIZED VIEW user_summary AS
SELECT
  u.id, u.name,
  COUNT(o.id) AS order_count,
  COALESCE(SUM(o.total), 0) AS total_spent,
  MAX(o.created_at) AS last_order
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

-- Create index on materialized view
CREATE INDEX idx_user_summary_spent
ON user_summary(total_spent DESC);

-- Query (fast - reads from stored data)
SELECT * FROM user_summary
WHERE total_spent > 1000
ORDER BY total_spent DESC;

-- Refresh data (when underlying data changes)
REFRESH MATERIALIZED VIEW user_summary;

-- Refresh concurrently (no lock)
REFRESH MATERIALIZED VIEW CONCURRENTLY user_summary;'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_030'..topicId='sql'..title='Data Migration Patterns'..description='Safe patterns for schema changes and data migration in production.'..code='''-- Add column with default (safe)
ALTER TABLE users ADD COLUMN role VARCHAR(20) DEFAULT 'user';

-- Backfill data
UPDATE users SET role = 'admin' WHERE email LIKE '%@company.com';

-- Rename via new column (safe migration)
ALTER TABLE users ADD COLUMN full_name VARCHAR(200);
UPDATE users SET full_name = name;
-- Later: ALTER TABLE users DROP COLUMN name;

-- Create new table and migrate
CREATE TABLE users_v2 AS
SELECT id, name AS full_name, email, age, 'user' AS role
FROM users;

-- Copy data between tables
INSERT INTO new_users (name, email)
SELECT name, email FROM old_users
WHERE status = 'active';'''..language='sql'..difficulty='hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_031'..topicId='sql'..title='Query Optimization'..description='Techniques to improve SQL query performance: indexes, covering queries, and anti-patterns.'..code='''-- Bad: function on indexed column
SELECT * FROM users WHERE LOWER(email) = 'test@test.com';
-- Good: use expression index or normalize data
CREATE INDEX idx_email_lower ON users(LOWER(email));

-- Bad: SELECT *
SELECT * FROM users WHERE id = 1;
-- Good: select only needed columns
SELECT name, email FROM users WHERE id = 1;

-- Bad: N+1 queries
-- SELECT * FROM users;  then for each: SELECT * FROM orders WHERE user_id = ?
-- Good: JOIN
SELECT u.name, o.total
FROM users u JOIN orders o ON u.id = o.user_id;

-- Bad: LIKE with leading wildcard
SELECT * FROM users WHERE name LIKE '%alice%';
-- Good: use full-text search index

-- Analyze query plan
EXPLAIN QUERY PLAN
SELECT * FROM users WHERE email = 'test@test.com';'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_032'..topicId='sql'..title='Window Frame Specifications'..description='Control which rows are included in window function calculations with ROWS and RANGE.'..code='''-- Rows between
SELECT date, revenue,
  AVG(revenue) OVER (
    ORDER BY date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS weekly_avg,
  SUM(revenue) OVER (
    ORDER BY date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative
FROM daily_revenue;

-- Range between (value-based)
SELECT date, amount,
  SUM(amount) OVER (
    ORDER BY date
    RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND CURRENT ROW
  ) AS rolling_7day
FROM transactions;

-- Named window
SELECT name, dept, salary,
  AVG(salary) OVER w AS dept_avg,
  MAX(salary) OVER w AS dept_max
FROM employees
WINDOW w AS (PARTITION BY dept);'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_033'..topicId='sql'..title='Normalization Forms'..description='Database normalization from 1NF to 3NF with examples of proper table design.'..code='''-- 1NF: Atomic values, no repeating groups
-- BAD:  users(id, name, phones:"555-1234,555-5678")
-- GOOD:
CREATE TABLE users (id INT PRIMARY KEY, name TEXT);
CREATE TABLE phones (id INT PRIMARY KEY, user_id INT, phone TEXT,
  FOREIGN KEY(user_id) REFERENCES users(id));

-- 2NF: No partial dependencies (all non-key depend on full PK)
-- BAD:  order_items(order_id, product_id, product_name, qty)
-- GOOD: product_name depends only on product_id
CREATE TABLE products (id INT PRIMARY KEY, name TEXT);
CREATE TABLE order_items (
  order_id INT, product_id INT, qty INT,
  PRIMARY KEY(order_id, product_id),
  FOREIGN KEY(product_id) REFERENCES products(id));

-- 3NF: No transitive dependencies
-- BAD:  users(id, name, city, city_population)
-- GOOD: city_population depends on city, not user
CREATE TABLE cities (name TEXT PRIMARY KEY, population INT);'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_034'..topicId='sql'..title='Partitioning'..description='Split large tables into smaller pieces for improved query performance and maintenance.'..code='''-- Range partitioning (PostgreSQL)
CREATE TABLE orders (
  id SERIAL, user_id INT, total DECIMAL,
  created_at DATE NOT NULL
) PARTITION BY RANGE (created_at);

CREATE TABLE orders_2024_q1 PARTITION OF orders
  FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');
CREATE TABLE orders_2024_q2 PARTITION OF orders
  FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

-- List partitioning
CREATE TABLE users (
  id SERIAL, name TEXT, region TEXT
) PARTITION BY LIST (region);

CREATE TABLE users_us PARTITION OF users
  FOR VALUES IN ('US', 'CA');
CREATE TABLE users_eu PARTITION OF users
  FOR VALUES IN ('UK', 'DE', 'FR');

-- Queries automatically use correct partition
SELECT * FROM orders WHERE created_at = '2024-03-15';'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_035'..topicId='sql'..title='Row-Level Security'..description='Control which rows users can see or modify based on their identity.'..code='''-- PostgreSQL Row-Level Security
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

-- Users can only see their own documents
CREATE POLICY user_docs ON documents
  FOR SELECT
  USING (owner_id = current_user_id());

-- Admins can see everything
CREATE POLICY admin_all ON documents
  FOR ALL
  USING (current_user_role() = 'admin');

-- Department-based access
CREATE POLICY dept_access ON reports
  FOR SELECT
  USING (department = current_user_dept());

-- Insert policy
CREATE POLICY insert_own ON documents
  FOR INSERT
  WITH CHECK (owner_id = current_user_id());

-- Force RLS for table owners too
ALTER TABLE documents FORCE ROW LEVEL SECURITY;'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_036'..topicId='sql'..title='GROUPING SETS & CUBE'..description='Generate multiple grouping combinations in a single query for reports.'..code='''-- GROUPING SETS (specific combinations)
SELECT category, region, SUM(revenue) AS total
FROM sales
GROUP BY GROUPING SETS (
  (category, region),  -- per category per region
  (category),          -- per category total
  (region),            -- per region total
  ()                   -- grand total
);

-- ROLLUP (hierarchical subtotals)
SELECT year, quarter, month, SUM(revenue)
FROM sales
GROUP BY ROLLUP (year, quarter, month);
-- Generates: (y,q,m), (y,q), (y), ()

-- CUBE (all combinations)
SELECT category, region, SUM(revenue)
FROM sales
GROUP BY CUBE (category, region);
-- Generates: (c,r), (c), (r), ()'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_037'..topicId='sql'..title='Temporal Tables'..description='Track data changes over time with system-versioned temporal tables.'..code='''-- System-versioned temporal table (SQL Server)
CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10,2),
  valid_from DATETIME2 GENERATED ALWAYS AS ROW START,
  valid_to DATETIME2 GENERATED ALWAYS AS ROW END,
  PERIOD FOR SYSTEM_TIME (valid_from, valid_to)
) WITH (SYSTEM_VERSIONING = ON);

-- Current data
SELECT * FROM products;

-- Historical data (time travel)
SELECT * FROM products
FOR SYSTEM_TIME AS OF '2024-01-01';

-- Changes between dates
SELECT * FROM products
FOR SYSTEM_TIME BETWEEN '2024-01-01' AND '2024-06-01';

-- All versions ever
SELECT * FROM products
FOR SYSTEM_TIME ALL
WHERE id = 1
ORDER BY valid_from;'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_038'..topicId='sql'..title='Gaps and Islands'..description='Find consecutive sequences (islands) and missing values (gaps) in ordered data.'..code='''-- Find gaps in sequence
WITH seq AS (
  SELECT id, LEAD(id) OVER (ORDER BY id) AS next_id
  FROM products
)
SELECT id + 1 AS gap_start, next_id - 1 AS gap_end
FROM seq
WHERE next_id - id > 1;

-- Find islands (consecutive groups)
WITH numbered AS (
  SELECT date, value,
    date - ROW_NUMBER() OVER (ORDER BY date) * INTERVAL '1 day' AS grp
  FROM measurements
  WHERE value > 100
)
SELECT MIN(date) AS island_start,
       MAX(date) AS island_end,
       COUNT(*) AS days
FROM numbered
GROUP BY grp;'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_039'..topicId='sql'..title='Explain and Query Plans'..description='Read and interpret query execution plans to identify performance bottlenecks.'..code='''-- SQLite explain
EXPLAIN QUERY PLAN
SELECT u.name, COUNT(o.id)
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.status = 'active'
GROUP BY u.id;

-- Look for:
-- SCAN TABLE = full table scan (bad for large tables)
-- SEARCH TABLE USING INDEX = good
-- USING COVERING INDEX = best (no table lookup)

-- PostgreSQL EXPLAIN ANALYZE
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT * FROM users WHERE email = 'test@test.com';

-- Key metrics to watch:
-- Seq Scan vs Index Scan
-- Actual rows vs Estimated rows (>10x = stale stats)
-- Sort method: quicksort vs external merge (memory)
-- Hash Join vs Nested Loop vs Merge Join'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='sql_040'..topicId='sql'..title='MERGE Statement'..description='Powerful single statement combining INSERT, UPDATE, and DELETE based on join conditions.'..code='''-- MERGE (SQL standard / SQL Server)
MERGE INTO target_table t
USING source_table s ON t.id = s.id

WHEN MATCHED AND s.status = 'deleted' THEN
  DELETE

WHEN MATCHED THEN
  UPDATE SET
    t.name = s.name,
    t.email = s.email,
    t.updated_at = CURRENT_TIMESTAMP

WHEN NOT MATCHED THEN
  INSERT (id, name, email, created_at)
  VALUES (s.id, s.name, s.email, CURRENT_TIMESTAMP);

-- PostgreSQL equivalent using ON CONFLICT
INSERT INTO target (id, name, email)
SELECT id, name, email FROM source
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  email = EXCLUDED.email;'''..language='sql'..difficulty='very_hard'..isSaved=false..lastViewedAt=null,
  ];
}
