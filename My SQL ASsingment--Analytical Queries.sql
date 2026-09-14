Use Institute;
SELECT
    l.full_name AS learner_name,
    l.country AS country,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_spending
FROM Learners l
INNER JOIN Purchases p
    ON l.learner_id = p.learner_id
INNER JOIN Courses c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name,
    l.country
ORDER BY total_spending DESC;
SELECT
    c.course_name AS course_name,
    SUM(p.quantity) AS total_quantity_sold
FROM Courses c
INNER JOIN Purchases p
    ON c.course_id = p.course_id
GROUP BY
    c.course_id,
    c.course_name
ORDER BY total_quantity_sold DESC
LIMIT 3;
SELECT
    c.category AS category,
    ROUND(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM Courses c
INNER JOIN Purchases p
    ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY total_revenue DESC;

SELECT
    l.full_name AS learner_name,
    COUNT(DISTINCT c.category) AS category_count
FROM Learners l
INNER JOIN Purchases p
    ON l.learner_id = p.learner_id
INNER JOIN Courses c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC;

SELECT
    c.course_id AS course_id,
    c.course_name AS course_name,
    c.category AS category
FROM Courses c
LEFT JOIN Purchases p
    ON c.course_id = p.course_id
WHERE p.course_id IS NULL
ORDER BY c.course_name;

