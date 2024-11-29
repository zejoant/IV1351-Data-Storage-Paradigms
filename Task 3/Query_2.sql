SELECT 
    sibling_count AS "No. of Siblings", 
    COUNT(*) AS "No. of Students"
FROM (
    SELECT 
        sibling_id, 
        COUNT(*) - 1 AS sibling_count
    FROM student
    GROUP BY sibling_id) AS sibling_counts
GROUP BY "No. of Siblings"
ORDER BY "No. of Siblings";
