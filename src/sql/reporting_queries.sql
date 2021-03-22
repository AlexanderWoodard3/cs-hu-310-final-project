/* Put your final project reporting queries here */
USE cs_hu_310_final_project;

 -- Calculate the GPA for a student given their student_id (use student_id = 1)
 
SELECT 
	first_name,
	last_name,
	(SELECT COUNT(student_id) AS number_of_classes FROM class_registrations WHERE student_id = 1) AS number_of_classes
    -- (SELECT COUNT(convert_to_grade_point(letter_grade)) AS total_grade_points_earned FROM grades WHERE student_id = 1) AS total_grade_points_earned,
    -- SUM(COUNT(convert_to_grade_point(letter_grade)) / COUNT(class_registrations.student_id)) AS GPA
FROM students
WHERE student_id = 1

 -- Calculate the GPA for each student (across all classes and all terms)
 
SELECT 
	first_name,
	last_name,
    (SELECT COUNT(student_id) AS number_of_classes FROM class_registrations WHERE student_id = 1) AS number_of_classes
    -- (SELECT COUNT(convert_to_grade_point(letter_grade)) AS total_grade_points_earned FROM grades WHERE student_id = 1) AS total_grade_points_earned,
    -- SUM(COUNT(convert_to_grade_point(letter_grade)) / COUNT(class_registrations.student_id)) AS GPA
FROM students
 
  -- Calculate the avg GPA for each class
  
  
  
  -- Calculate the avg GPA for each class and term
   
   
   
  -- List all the classes being taught by an instructor (use instructor_id = 1)
    
    SELECT
		instructor_id = 1
	FROM
    
   -- List all classes with terms and instructors
    
    SELECT 
		* 
	FROM
		classes
        join classes c ON terms
        join classes c ON instructors
        
    
    -- Calculate the remaining space left in a class

	SELECT
		classes.maximum_students
        SUM(10 - classes.maximum_students) AS space_remaining
	FROM
		classes
        join classes c ON space_remaining
