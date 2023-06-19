USE employees;

CREATE TABLE departments_dup 
SELECT * FROM
    departments;
ALTER table departments_dup 
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER table departments_dup 
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

 INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');   

INSERT INTO departments_dup 
	(dept_name) 
VALUES
	('Public Relations');
   
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
SELECT 
* 
FROM
    departments_dup
ORDER BY 
	dept_no;
    
COMMIT;
/* ----------------------- */
CREATE TABLE dept_manager_dup 
( 	emp_no INT(11) NOT NULL,
	dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
    );
    
INSERT INTO dept_manager_dup
SELECT  * FROM dept_manager;

INSERT INTO dept_manager_dup 
	(emp_no, from_date)
VALUES  (999904, '2017-01-01'),
		(999905, '2017-01-01'),
		(999906, '2017-01-01'),
		(999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUES   
	('Public Relations');


DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 

SELECT  
	*
FROM dept_manager_dup
ORDER BY
	emp_no DESC;
    /* ******************** */  
SELECT 
* 
FROM
    departments_dup
ORDER BY 
	dept_no;
    
DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';
    
INSERT INTO dept_manager_dup 
VALUES
	('110228', 'd003','1992-03-21','9999-01-01');
COMMIT;

DELETE FROM departments_dup 
WHERE
    dept_no = 'd003';
    
Insert into departments_dup values ('d003', 'Human Resources');