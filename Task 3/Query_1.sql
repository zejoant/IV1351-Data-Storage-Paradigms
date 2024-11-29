SELECT 
  TO_CHAR(lts.date, 'Month') AS "Month",
  COUNT(lesson) AS "Total",
  COUNT(il),
  COUNT(gl),
  COUNT(ensemble)
FROM lesson
LEFT JOIN lesson_time_slot lts ON lesson.id = lts.lesson_id
LEFT JOIN individual_lesson il ON lesson.id = il.lesson_id
LEFT JOIN group_lesson gl ON lesson.id = gl.lesson_id
LEFT JOIN ensemble ON lesson.id = ensemble.lesson_id
WHERE EXTRACT(YEAR FROM lts.date) = 2024
GROUP BY "Month"
ORDER BY max(EXTRACT(MONTH FROM lts.date));
