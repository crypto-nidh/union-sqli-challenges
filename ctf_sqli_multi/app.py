
from flask import Flask, render_template, request
import mysql.connector
import os

DB_HOST = os.getenv("DB_HOST", "db")
DB_USER = os.getenv("DB_USER", "root")
DB_PASS = os.getenv("DB_PASSWORD", "rootpassword")

app = Flask(__name__)

def get_conn(db_name):
    return mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASS,
        database=db_name,
        autocommit=True
    )

@app.route("/")
def index():
    challenges = [
        {"id": 1, "name": "Employee Directory (Union-based)"},
        {"id": 2, "name": "E-Commerce Products (Union-based)"},
        {"id": 3, "name": "Student Portal (Union-based)"},
        {"id": 4, "name": "Banking Transactions (Union-based)"},
        {"id": 5, "name": "Flight Booking (Union-based)"},
        {"id": 6, "name": "Support Tickets (Union-based)"},
        {"id": 7, "name": "Movie Reviews (Union-based)"},
        {"id": 8, "name": "Online Forum (Union-based)"},
    ]
    return render_template("index.html", challenges=challenges)

# --- Challenge 1: Employee Directory ---
@app.route("/challenge1", methods=["GET", "POST"])
def challenge1():
    results = []
    query = ""
    if request.method == "POST":
        name = request.form.get("q", "")
        conn = get_conn("challenge1")
        cur = conn.cursor(dictionary=True)
        # Intentional SQL Injection vulnerability (string concatenation)
        query = "SELECT id, name, position, email FROM employees WHERE name LIKE '%" + name + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge1.html", results=results, last_query=query)

# --- Challenge 2: E-Commerce Products ---
@app.route("/challenge2", methods=["GET", "POST"])
def challenge2():
    results = []
    query = ""
    if request.method == "POST":
        name = request.form.get("q", "")
        conn = get_conn("challenge2")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, name, price FROM products WHERE name LIKE '%" + name + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge2.html", results=results, last_query=query)

# --- Challenge 3: Student Portal ---
@app.route("/challenge3", methods=["GET", "POST"])
def challenge3():
    results = []
    query = ""
    if request.method == "POST":
        name = request.form.get("q", "")
        conn = get_conn("challenge3")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, name, grade FROM students WHERE name LIKE '%" + name + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge3.html", results=results, last_query=query)

# --- Challenge 4: Banking Transactions ---
@app.route("/challenge4", methods=["GET", "POST"])
def challenge4():
    results = []
    query = ""
    if request.method == "POST":
        user = request.form.get("q", "")
        conn = get_conn("challenge4")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, user, amount, type FROM transactions WHERE user LIKE '%" + user + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge4.html", results=results, last_query=query)

# --- Challenge 5: Flight Booking ---
@app.route("/challenge5", methods=["GET", "POST"])
def challenge5():
    results = []
    query = ""
    if request.method == "POST":
        dest = request.form.get("q", "")
        conn = get_conn("challenge5")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, destination, price FROM flights WHERE destination LIKE '%" + dest + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge5.html", results=results, last_query=query)

# --- Challenge 6: Support Tickets ---
@app.route("/challenge6", methods=["GET", "POST"])
def challenge6():
    results = []
    query = ""
    if request.method == "POST":
        subject = request.form.get("q", "")
        conn = get_conn("challenge6")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, subject, status FROM tickets WHERE subject LIKE '%" + subject + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge6.html", results=results, last_query=query)

# --- Challenge 7: Movie Reviews ---
@app.route("/challenge7", methods=["GET", "POST"])
def challenge7():
    results = []
    query = ""
    if request.method == "POST":
        movie = request.form.get("q", "")
        conn = get_conn("challenge7")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, movie, rating FROM reviews WHERE movie LIKE '%" + movie + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge7.html", results=results, last_query=query)

# --- Challenge 8: Online Forum ---
@app.route("/challenge8", methods=["GET", "POST"])
def challenge8():
    results = []
    query = ""
    if request.method == "POST":
        title = request.form.get("q", "")
        conn = get_conn("challenge8")
        cur = conn.cursor(dictionary=True)
        query = "SELECT id, title, content FROM posts WHERE title LIKE '%" + title + "%'"
        cur.execute(query)
        results = cur.fetchall()
        cur.close()
        conn.close()
    return render_template("challenge8.html", results=results, last_query=query)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
