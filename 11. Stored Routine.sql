 USE employees;

# NON PARAMETRIC PROCEDURES
DELIMITER $$
CREATE PROCEDURE select_emp()
BEGIN 
	SELECT 
	* 
	FROM employees 
    LIMIT 100
    ; 
END$$ 
DELIMITER ;

CALL select_emp();

# PARAMETRIC PROCEDURES
USE employees;
DROP PROCEDURE IF EXISTS emp_salary;
DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN 
	SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
    FROM employees e 
    JOIN 
    salaries s ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no; 
END$$ 
DELIMITER;

# WITH TWO PARAMETER
DELIMITER $$
CREATE PROCEDURE avg_emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN 
	SELECT AVG(salary) 
	INTO p_avg_salary
    FROM employees e 
    JOIN 
    salaries s ON s.emp_no = e.emp_no
    WHERE e.emp_no = p_emp_no; 
END$$ 
 
		/*  --------------VARIABLE (SESSION)----------------*/
 SET @v_avg_salary = 0;
  CALL avg_emp_salary_out(11300, @v_avg_salary);
 SELECT @v_avg_salary;
 
 /* -------- VARIABLE (LOCAL) ---------------- 
DECLARE v_avg_salary*/

/* VARIABLE (GLOBAL) ----------------- 
SET GLOBAL @V_avg_salary
SET @@v_avg_salary */

 #
 #
 #
 
 /* --------- USER DEFINED FUNCITON -------------*/
 DELIMITER $$
 CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
 DETERMINISTIC 
 BEGIN
 DECLARE v_avg_salary DECIMAL (10,2);
 SELECT AVG(s.salary) 
 INTO v_avg_salary
 FROM employees e 
	JOIN salaries s on e.emp_no = s.emp_no
    WHERE
		e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;
	
