CREATE TABLE historical_data (
	lesson_type VARCHAR(500), 
	genre VARCHAR(500) NULL, 
	instrument VARCHAR(500) NULL,
	lesson_price INT,
	student_name VARCHAR(500),
	student_email VARCHAR(500)
);

INSERT INTO historical_data (lesson_type, genre, instrument, lesson_price, student_name, student_email)
SELECT 
	lesson.type, 
	ensemble.genre, 
	CASE 
        WHEN lesson.type = 'Individual_lesson' THEN il.instrument_type
        WHEN lesson.type = 'group_lesson' THEN gl.instrument_type
    END AS instrument,
	lesson.price,
	person.name,
	person.address
FROM lesson
LEFT JOIN ensemble ON ensemble.lesson_id = lesson.id
LEFT JOIN individual_lesson il ON il.lesson_id = lesson.id
LEFT JOIN group_lesson gl ON gl.lesson_id = lesson.id
LEFT JOIN student_lesson_list sll ON lesson.id = sll.lesson_id
LEFT JOIN student ON sll.student_id = student.id
LEFT JOIN person ON student.person_id = person.id;