CREATE MATERIALIZED VIEW sibling_counts AS
SELECT sibling_id,
COUNT(*) - 1 AS sibling_count
FROM student
GROUP BY sibling_id;
	
SELECT 
    sibling_count AS "No. of Siblings", 
    COUNT(*) AS "No. of Students"
FROM sibling_counts
GROUP BY "No. of Siblings"
ORDER BY "No. of Siblings";
