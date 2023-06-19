USE employees;

SELECT 
    dept_no, IFNULL(dept_name, 'Not Provided') as dept_name
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    dept_no, dept_name, COALESCE(dept_manager, dept_name, 'N/A')
FROM
    departments_dup
ORDER BY dept_no;


# COALESCE - can work with one, two, or more arg.