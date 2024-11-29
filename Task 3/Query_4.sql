SELECT 
  TO_CHAR(date, 'DAY') AS "Day", 
  ensemble.genre AS "Genre",
  CASE
    WHEN ensemble.max_students - COUNT(sll) = 0 THEN 'No Seats' 
    WHEN ensemble.max_students - COUNT(sll) < 3 THEN '1 or 2 Seats'
    ELSE 'Many Seats'
  END AS "No. of Free Seats"
FROM lesson_time_slot lst
JOIN lesson ON lesson.id = lst.lesson_id
JOIN ensemble ON lesson.id = ensemble.lesson_id
JOIN student_lesson_list sll ON lesson.id = sll.lesson_id
GROUP BY lst.lesson_id, ensemble.genre, ensemble.max_students;
