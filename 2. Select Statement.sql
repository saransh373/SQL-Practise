USE employees;
SELECT 
    first_name, last_name
FROM
    employees;
SELECT 
    *
FROM
    employees;
    
/* ----------- WHERE -------------- */ 
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name = 'Denis';
    
/* -------------- AND ------------*/ # mutual of both statement if true
SELECT 
    first_name, last_name, gender
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

/*------------- OR ------------*/ # combination of both condition if true
SELECT 
    first_name
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';
    
/* Operator Precedence and>or */
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');
/* ---------------------------------------------------- */
        
/* IN, NOT IN */
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
 SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');   
    
/* --------- LIKE , NOT LIKE -----------*/
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%'); 
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar%');
    
/*------- BETWEEN ___ AND---------  */
  SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
/* --------- IS NOT NULL , IS NULL ----------*/
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;    
    
    