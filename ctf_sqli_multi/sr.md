
# Security Report

**Scope**: Single Flask app exposing 8 endpoints backed by 8 isolated MySQL databases.  
**Intentional Weakness**: Unsafe string concatenation to demonstrate SQLi.

## Tests Performed
- Container isolation via `docker-compose`: app and DB in separate services.
- Verified no cross-database queries by default: each route connects only to its own DB.
- Directory traversal: Flask static/templates protected by default routing; no file serving endpoints added.
- Resource access: No admin panels or write endpoints; only read-only search.
- CSRF/XSS: Not in scope; templates auto-escape Jinja variables, but debug query echo is sanitized by Jinja.
- DB initialization: `init.sql` loaded via MySQL entrypoint directory, creating separate schemas `challenge1`..`challenge8`.

## Hardening Recommendations (post-CTF)
- Replace string concatenation with parameterized queries / ORM.
- Implement least-privilege DB user per schema.
- Disable query echo in production.
- Add input validation, WAF rules for `UNION`, comments, and boolean conditions.
- Run behind a reverse proxy with rate limiting.
