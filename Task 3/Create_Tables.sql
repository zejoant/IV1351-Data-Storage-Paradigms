CREATE TABLE "person" (
  id SERIAL PRIMARY KEY,
  personal_number VARCHAR(12) NOT NULL,
  name VARCHAR(500) NOT NULL,
  address VARCHAR(500) NOT NULL,
  phone_number VARCHAR(500) NOT NULL
);

CREATE TABLE "inventory" (
  id VARCHAR(500) PRIMARY KEY,
  brand VARCHAR(500),
  inventory_count INT NOT NULL,
  rented_count INT NOT NULL
);

CREATE TABLE "instrument" (
  id SERIAL PRIMARY KEY,
  price INT,
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory ON DELETE CASCADE ON UPDATE CASCADE,
  is_rented BOOLEAN NOT NULL
);

CREATE TABLE "instructor" (
  id SERIAL PRIMARY KEY,
  can_teach_ensemble BOOLEAN NOT NULL,
  person_id INT NOT NULL REFERENCES person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "instructor_taught_instrument" (
  instructor_id INT NOT NULL REFERENCES instructor ON DELETE CASCADE ON UPDATE CASCADE,
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (instructor_id, instrument_type)
);

CREATE TABLE "instructor_availability" (
  instructor_id INT NOT NULL REFERENCES instructor ON DELETE CASCADE ON UPDATE CASCADE,
  time TIMESTAMP,
  duration INT,
  PRIMARY KEY (instructor_id, time)
);

CREATE TABLE "student" (
  id SERIAL PRIMARY KEY,
  instrument_studied VARCHAR(500) NOT NULL REFERENCES inventory ON DELETE SET NULL ON UPDATE CASCADE,
  sibling_id INT,
  monthly_fee INT,
  skill_level VARCHAR(500),
  person_id INT NOT NULL REFERENCES person ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "sibling_discount" (
  amount FLOAT,
  student_id INT NOT NULL REFERENCES student ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (student_id)
);

CREATE TABLE "rented_instrument" (
  student_id INT NOT NULL REFERENCES student ON DELETE CASCADE ON UPDATE CASCADE,
  instrument_id INT NOT NULL REFERENCES instrument ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (student_id, instrument_id)
);

CREATE TABLE "lesson" (
  id SERIAL PRIMARY KEY,
  type VARCHAR(500),
  price INT,
  skill_level VARCHAR(500),
  instructor_id INT NOT NULL REFERENCES instructor ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE "student_lesson_list" (
  student_id INT NOT NULL REFERENCES student ON DELETE CASCADE ON UPDATE CASCADE,
  lesson_id INT NOT NULL REFERENCES lesson ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (student_id, lesson_id)
);

CREATE TABLE "lesson_time_slot" (
  date DATE,
  time TIME,
  duration INT,
  lesson_id INT NOT NULL REFERENCES lesson ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (lesson_id)
);

CREATE TABLE "individual_lesson" (
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory ON DELETE CASCADE ON UPDATE CASCADE,
  lesson_id INT NOT NULL REFERENCES lesson ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (lesson_id)
);

CREATE TABLE "group_lesson" (
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory ON DELETE CASCADE ON UPDATE CASCADE,
  lesson_id INT NOT NULL REFERENCES lesson ON DELETE CASCADE ON UPDATE CASCADE,
  min_students INT,
  max_students INT NULL,
  PRIMARY KEY (lesson_id)
);

CREATE TABLE "ensemble" (
  lesson_id INT NOT NULL REFERENCES lesson ON DELETE CASCADE ON UPDATE CASCADE,
  genre VARCHAR(500),
  min_students INT,
  max_students INT NULL,
  PRIMARY KEY (lesson_id)
  
);







