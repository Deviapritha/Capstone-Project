CREATE DATABASE Institute;
Use Institute;
CREATE TABLE Learners (
    learner_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Learners (full_name, country)
VALUES
('Arun Kumar', 'India'),
('Priya Sharma', 'Japan'),
('Rahul Raj', 'America'),
('Anitha Devi', 'Brazil'),
('Vijay Kumar', 'Korea');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Courses (course_name, category, unit_price)
VALUES
('Python for Beginners', 'Programming', 5000.00),
('Advanced SQL', 'Database', 6000.00),
('Power BI Data Visualization', 'Data Analytics', 5500.00),
('React JS Development', 'Web Development', 7000.00),
('Excel for Data Analysis', 'Data Analytics', 4500.00);

CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    learner_id INT NOT NULL,
    course_id INT NOT NULL,
    quantity Int,
    purchase_date DATE NOT NULL,
    
    FOREIGN KEY (learner_id) REFERENCES Learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Purchases (learner_id, course_id, Quantity, purchase_date)
VALUES
(1, 1, 3, '2026-08-01'),
(1, 3, 2,  '2026-08-05'),
(2, 2, 1, '2026-08-03'),
(2, 5, 4,  '2026-08-10'),
(3, 1, 1,  '2026-08-07'),
(4, 4, 3,  '2026-08-12'),
(4, 3, 4,  '2026-08-15'),
(5, 2, 5,  '2026-08-18');

SELECT
    l.learner_id AS Learner_ID,
    l.full_name AS Learner_Name,
    ROUND(SUM(c.unit_price * p.quantity), 2) AS total_spent
FROM Learners l
JOIN Purchases p
    ON l.learner_id = p.learner_id
JOIN Courses c
    ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name
ORDER BY total_spent DESC;
SHOW TABLES;