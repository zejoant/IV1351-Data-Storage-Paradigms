SELECT instructor_id AS "Instructor ID", person.name AS "Name", COUNT(*) AS "No of Lessons"
FROM lesson
JOIN lesson_time_slot lts ON lesson.id = lts.lesson_id
JOIN instructor ON lesson.instructor_id = instructor.id
JOIN person ON instructor.person_id = person.id
WHERE EXTRACT(MONTH FROM lts.date) = 5
GROUP BY instructor_id, person.name
HAVING COUNT(*) > 1;