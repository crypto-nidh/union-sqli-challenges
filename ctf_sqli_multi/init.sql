-- ==============================
-- Challenge 1: Employee Directory
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge1;
USE challenge1;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO employees (name, position, email) VALUES
('nidhi', 'Developer', 'nidhi@corp.com'),
('Bob', 'Manager', 'bob@corp.com'),
('karan', 'Intern', 'karan@corp.com');

CREATE TABLE secrets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    flag VARCHAR(100)
);

INSERT INTO secrets (flag) VALUES ('FLAG{union_employee_1337}');


-- ==============================
-- Challenge 2: E-Commerce Products
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge2;
USE challenge2;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES
('Laptop', 1200.00),
('Headphones', 80.00),
('Smartphone', 600.00);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO users (username, password) VALUES
('customer1', 'pass123'),
('customer2', 'hunter2'),
('admin', 'FLAG{union_products_1337}');


-- ==============================
-- Challenge 3: Student Portal
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge3;
USE challenge3;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    grade VARCHAR(10)
);

INSERT INTO students (name, grade) VALUES
('John Doe', 'A'),
('Jane Smith', 'B'),
('Eve Black', 'C');

CREATE TABLE admin_notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    secret VARCHAR(100)
);

INSERT INTO admin_notes (secret) VALUES ('FLAG{union_student_portal_1337}');


-- ==============================
-- Challenge 4: Banking Transactions
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge4;
USE challenge4;

CREATE TABLE transactions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user VARCHAR(100),
    amount DECIMAL(10,2),
    type VARCHAR(50)
);

INSERT INTO transactions (user, amount, type) VALUES
('alice', 200.00, 'deposit'),
('bob', 100.00, 'withdrawal'),
('charlie', 50.00, 'deposit');

CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100)
);

INSERT INTO accounts (username, password) VALUES
('alice', 'password123'),
('bob', 'qwerty'),
('admin', 'FLAG{union_bank_1337}');


-- ==============================
-- Challenge 5: Flight Booking
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge5;
USE challenge5;

CREATE TABLE flights (
    id INT PRIMARY KEY AUTO_INCREMENT,
    destination VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO flights (destination, price) VALUES
('New York', 350.00),
('London', 500.00),
('Tokyo', 900.00);

CREATE TABLE hidden_routes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    route VARCHAR(100)
);

INSERT INTO hidden_routes (route) VALUES ('FLAG{union_flights_1337}');


-- ==============================
-- Challenge 6: Support Tickets
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge6;
USE challenge6;

CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject VARCHAR(200),
    status VARCHAR(50)
);

INSERT INTO tickets (subject, status) VALUES
('Login issue', 'open'),
('Payment failed', 'closed'),
('Feature request', 'open');

CREATE TABLE internal_notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    note VARCHAR(100)
);

INSERT INTO internal_notes (note) VALUES ('FLAG{union_tickets_1337}');


-- ==============================
-- Challenge 7: Movie Reviews
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge7;
USE challenge7;

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie VARCHAR(100),
    rating INT
);

INSERT INTO reviews (movie, rating) VALUES
('Inception', 9),
('Interstellar', 10),
('Tenet', 7);

CREATE TABLE hidden_flags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    flag VARCHAR(100)
);

INSERT INTO hidden_flags (flag) VALUES ('FLAG{union_movies_1337}');


-- ==============================
-- Challenge 8: Online Forum
-- ==============================
CREATE DATABASE IF NOT EXISTS challenge8;
USE challenge8;

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    content TEXT
);

INSERT INTO posts (title, content) VALUES
('Welcome', 'This is the first post!'),
('Update', 'Site maintenance tomorrow.'),
('Event', 'Hackathon next week!');

CREATE TABLE private_messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sender VARCHAR(100),
    message VARCHAR(100)
);

INSERT INTO private_messages (sender, message) VALUES
('admin', 'FLAG{union_forum_1337}');
