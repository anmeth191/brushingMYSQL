
/*Problem 1
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.*/

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN('A','E','I','O','U') OR RIGHT(CITY,1) NOT IN('A','E','I','O','U') ORDER BY CITY ASC

/*Problem 2
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U') AND RIGHT(CITY,1) IN('A','E','I','O','U') ORDER BY CITY ASC


/*Problem 3
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN('A','E','I','O','U') AND RIGHT(CITY,1) NOT IN('A','E','I','O','U') ORDER BY CITY ASC

/*Problem 4
Query all columns for a city in CITY with the ID 1661.
*/
SELECT * FROM CITY WHERE ID=1661

/*Problem 5
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC

/*Problem 6
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000
per month who have been employees for less than months. Sort your result by ascending employee_id.
*/
SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY EMPLOYEE_ID ASC

/*Problem 7
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN'

/*Problem 8
Query the difference between the maximum and minimum populations in CITY.
*/
SELECT MAX(POPULATION)-MIN(POPULATION) FROM CITY


/*Problem 9
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's

key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.:
average monthly salaries), and round it up to the next integer.
*/

/*In this query we use the replace function and we said look for all the 0 and replace it with nothing */

SELECT CEIL(AVG(SALARY)- AVG(REPLACE(SALARY , '0',''))) FROM EMPLOYEES
