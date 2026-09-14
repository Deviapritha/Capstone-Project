Use Institute;

SELECT
    l.full_name AS full_name,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    c.unit_price AS unit_price,
    p.purchase_date AS purchase_date
FROM Learners l
INNER JOIN Purchases p
    ON l.learner_id = p.learner_id
INNER JOIN Courses c
    ON p.course_id = c.course_id
ORDER BY p.purchase_date;

SELECT
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    c.unit_price AS unit_price,
    p.purchase_date AS purchase_date
FROM Learners l
LEFT JOIN Purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN Courses c
    ON p.course_id = c.course_id
ORDER BY l.full_name;
SELECT
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    c.unit_price AS unit_price,
    p.purchase_date AS purchase_date
FROM Learners l
RIGHT JOIN Purchases p
    ON l.learner_id = p.learner_id
RIGHT JOIN Courses c
    ON p.course_id = c.course_id
ORDER BY c.course_name;

