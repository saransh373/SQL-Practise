USE employees;
UPDATE employees 
SET 
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE 
	emp_no = 999901;
 /* ------------- COMMIT AND ROLLBACK ------------------------- */   
SELECT 
 * 
FROM departments_dup;
COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

ROLLBACK;
COMMIT;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';
    
SELECT 
	*
FROM departments;


/* ------------- DELETE --------------- */ 
USE employees;
COMMIT;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903; 

DELETE FROM employees 
WHERE
    emp_no = 999903;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
/* -------------- DELETE vs TRUNCATE vs DROP -------------------- */
 -- drop >  it deletes all the records from table and deletes or removes the table permanently 
	# we should use drop only when we know we would not need the table anymore in our use
    
    
 