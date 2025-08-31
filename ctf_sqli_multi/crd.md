
# Challenge Description Report

**Category**: SQL Injection (Union-based), Easy–Medium  
**Scenario**: A multi-tenant organization exposes internal search tools (employee directory, products, students, banking, flights, tickets, reviews, forum). Each app uses unsafe string concatenation to build SQL statements.

**Goal**: Extract the hidden flag from each challenge's separate database by leveraging UNION-based SQL injection on the search field.

**Hints (subtle)**
- Column count matters.
- Error messages may reveal schemas.
- Try broadening your search with special characters.
- Inspect "Debug: Last query executed" to understand behavior.
- If a query fails, adjust the number/type of columns in your UNION.

