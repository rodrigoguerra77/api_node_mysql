USE processimlabs_test_rg;

DELIMITER $$
USE `processimlabs_test_rg`$$

CREATE PROCEDURE `coursesAddOrEdit` (
    IN _courses_id INT,
    IN _courses_name TEXT,
    IN _courses_descrption TEXT,
    IN _courses_start_date DATE,
    IN _courses_final_date DATE,
    IN _courses_students INT,
    IN _status_id INT
)
BEGIN
	IF _courses_id = 0 THEN
      	INSERT INTO courses (courses_name, courses_descrption, courses_start_date, courses_final_date, courses_students, status_id)
        VALUES (_courses_name, _courses_descrption, _courses_start_date, _courses_final_date, _courses_students, _status_id);
       	SET _courses_id = LAST_INSERT_ID();
	ELSE
    	UPDATE courses
        SET
        	courses_name = _courses_name,
            courses_descrption = _courses_descrption,
            courses_start_date = _courses_start_date,
            courses_final_date = _courses_final_date,
            courses_students = _courses_students,
            status_id = _status_id
           	wHERE courses_id = _courses_id;
	END IF;
    SELECT _courses_id AS courses_id;
END
