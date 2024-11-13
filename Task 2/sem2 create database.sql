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
  type VARCHAR(500) NOT NULL REFERENCES inventory,
  is_rented BOOLEAN NOT NULL
);

CREATE TABLE "instructor" (
  id SERIAL PRIMARY KEY,
  can_teach_ensemble BOOLEAN NOT NULL,
  person_id INT NOT NULL REFERENCES person,
  taught_instruments VARCHAR(500) NOT NULL
);

CREATE TABLE "instructor_availability" (
  instructor_id INT NOT NULL REFERENCES instructor,
  date DATE,
  time TIME,
  duration INT
);

CREATE TABLE "student" (
  id SERIAL PRIMARY KEY,
  instrument_studied VARCHAR(500),
  sibling_id INT,
  monthly_fee INT,
  skill_level VARCHAR(500),
  person_id INT NOT NULL REFERENCES person
);

CREATE TABLE "sibling_discount" (
  amount FLOAT,
  student_id INT NOT NULL REFERENCES student
);

CREATE TABLE "rented_instrument" (
  student_id INT NOT NULL REFERENCES student,
  instrument_id INT NOT NULL REFERENCES instrument
);

CREATE TABLE "lesson" (
  id SERIAL PRIMARY KEY,
  type VARCHAR(500),
  price INT,
  skill_level VARCHAR(500),
  instructor_id INT NOT NULL REFERENCES instructor
);

CREATE TABLE "student_lesson_list" (
  student_id INT NOT NULL REFERENCES student,
  lesson_id INT NOT NULL REFERENCES lesson
);

CREATE TABLE "lesson_time_slot" (
  date DATE,
  time TIME,
  duration INT,
  lesson_id INT NOT NULL REFERENCES lesson
);

CREATE TABLE "individual_lesson" (
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory,
  lesson_id INT NOT NULL REFERENCES lesson
);

CREATE TABLE "group_lesson" (
  instrument_type VARCHAR(500) NOT NULL REFERENCES inventory,
  lesson_id INT NOT NULL REFERENCES lesson,
  min_students INT,
  max_students INT NULL
);

CREATE TABLE "ensemble" (
  lesson_id INT NOT NULL REFERENCES lesson,
  genre VARCHAR(500),
  min_students INT,
  max_students INT NULL
);







