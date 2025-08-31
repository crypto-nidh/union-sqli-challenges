
# Razz CTF – SQL Injection Lab (Multi-Challenge, Union-based)

Eight realistic mini-apps in one Flask portal, each backed by its own MySQL database with a hidden flag. Designed for easy Docker deployment and classroom/CTF use.

## Quick Start (Docker Compose)
```bash
docker compose up -d --build
# open http://localhost:5000
```

If you prefer Docker CLI only:
```bash
docker build -t challenge_img .
docker run -d --name challenge --env DB_HOST=host.docker.internal --env DB_USER=root --env DB_PASSWORD=rootpassword -p 5000:5000 challenge_img:latest
# Ensure a MySQL 8 server is reachable and load init.sql beforehand if not using compose.
```

## Structure
- `app.py` – Flask app with 8 routes (`/challenge1` .. `/challenge8`)
- `templates/` – Bootstrap-styled pages per challenge
- `static/style.css` – minimal styling
- `init.sql` – creates 8 databases and seeds flags
- `Dockerfile`, `docker-compose.yml`
- `crd.md` – Challenge Description Report
- `er.md` – User Exploitation Report
- `sr.md` – Security Report

## Notes
- The queries are intentionally vulnerable (string concatenation). **Do not** expose this to the public Internet.
- All flags follow `FLAG{...}` as seeded in `init.sql`.

