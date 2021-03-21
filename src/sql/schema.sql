CREATE DATABASE IF NOT EXISTS cs_hu_310_final_project;
USE cs_hu_310_final_project;
DROP TABLE IF EXISTS class_registrations;
DROP TABLE IF EXISTS grades;
DROP TABLE IF EXISTS class_sections;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS academic_titles;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP FUNCTION IF EXISTS convert_to_grade_point;


CREATE TABLE IF NOT EXISTS classes(
 class_id INT AUTO_INCREMENT,
 name VARCHAR(50) NOT NULL,
 description VARCHAR(1000),
 code VARCHAR(10) UNIQUE,
 maximum_students INT DEFAULT 10,
 PRIMARY KEY(class_id)
);


CREATE TABLE IF NOT EXISTS students(
 student_id INT AUTO_INCREMENT,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 birthdate DATE,
 PRIMARY KEY (student_id)
);


CREATE TABLE IF NOT EXISTS academic_titles(
 academic_title_id INT AUTO_INCREMENT NOT NULL,
 title VARCHAR(255) NOT NULL,
 PRIMARY KEY (academic_title_id)
);


CREATE TABLE IF NOT EXISTS instructors(
 instructor_id INT AUTO_INCREMENT NOT NULL,
 first_name VARCHAR(80) NOT NULL,
 last_name VARCHAR(80) NOT NULL,
 academic_title_id INT,
 PRIMARY KEY (instructor_id),
 FOREIGN KEY (academic_title_id) REFERENCES academic_titles(academic_title_id)
);


CREATE TABLE IF NOT EXISTS terms(
 term_id INT AUTO_INCREMENT NOT NULL,
 name VARCHAR(80) NOT NULL,
 PRIMARY KEY (term_id)
);


CREATE TABLE IF NOT EXISTS class_sections(
 class_section_id INT AUTO_INCREMENT NOT NULL,
 class_id INT NOT NULL,
 instructor_id INT NOT NULL,
 term_id INT NOT NULL,
 PRIMARY KEY (class_section_id),
 FOREIGN KEY (class_id) REFERENCES classes(class_id),
 FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
 FOREIGN KEY (term_id) REFERENCES terms(term_id)
);


CREATE TABLE IF NOT EXISTS grades(
 grade_id INT AUTO_INCREMENT NOT NULL,
 letter_grade VARCHAR(2) NOT NULL,
 PRIMARY KEY (grade_id)
);


CREATE TABLE IF NOT EXISTS class_registrations(
 class_registration_id INT AUTO_INCREMENT NOT NULL,
 class_section_id INT NOT NULL,
 student_id INT NOT NULL,
 grade_id INT,
 signup_timestamp datetime DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (student_id),
 UNIQUE (class_section_id, student_id)
);

DELIMITER $$
CREATE FUNCTION convert_to_grade_point(letter_grade char(2))
RETURNS INT
   DETERMINISTIC
BEGIN
    INSERT INTO class_registrations VALUE (grade_point);
		  IF (@letter_grade = 'A')
			   THEN RETURN 4;
		  ELSEIF (@letter_grade = 'B')
			   THEN RETURN 3;
    ELSEIF (@letter_grade = 'C')
			   THEN RETURN 2;
		  ELSEIF (@letter_grade = 'D')
			   THEN RETURN 1;
    ELSEIF (@letter_grade = 'F')
			   THEN RETURN 0;
		  ELSE 
			   RETURN NULL;
		  END IF;
END $$
