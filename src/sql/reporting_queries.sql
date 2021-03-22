/* Put your final project reporting queries here */
USE cs_hu_310_final_project;

 -- Calculate the GPA for a student given their student_id (use student_id = 1)
 
SELECT
	student_id = 1
    (SUM(gp.points * c.credits) / s.total_credits) AS GPA
FROM
	students
	JOIN class_registrations t ON s.student_id = t.student_id
	JOIN grades c ON t.course_id = c.course_id
	JOIN grade_point gp ON gp.grade = t.grade
GROUP BY s.student_id, s.total_credits;

 -- Calculate the GPA for each student (across all classes and all terms)
 
SELECT
	students.student_id
    (SUM(gp.points * c.credits) / s.total_credits) AS GPA
FROM
	students
	JOIN class_registrations t ON s.student_id = t.student_id
	JOIN grades c ON t.course_id = c.course_id
	JOIN grade_point gp ON gp.grade = t.grade
GROUP BY s.student_id, s.total_credits;
 
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
