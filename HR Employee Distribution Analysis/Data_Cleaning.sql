Create database projects;

use projects;

SET sql_safe_updates = 0;

select * from hr;

Alter table hr change column ï»¿id emp_id varchar(20) Null;

# Now we'll change the birthdate column from text to actual dates
update hr set birthdate = case
when birthdate Like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
when birthdate Like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

# changing the birthdate column to date
Alter table hr modify column birthdate date;

# This time we'll change the hiredate column from text to actual dates
update hr set hire_date = case
when hire_date Like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
when hire_date Like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
else null
end;

Alter table hr modify column hire_date date;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

alter table hr add column age int;

select * from hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT * FROM hr;
