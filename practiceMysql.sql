
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

/*
Problem 10
We define an employee's total earnings to be their monthly worked, and the maximum total earnings 
to be the maximum total earnings for any employee in the Employee table. Write a query to find the 
maximum total earnings for all employees as well as the total number of employees who have maximum 
total earnings.
Then print these values as space-separated integers.
*/

/*Use count(*) to count all the repated elements when doing the query and then you must group that is a rule of mysql*/
SELECT MONTHS*SALARY AS COUNTERSALARY, COUNT(*) FROM EMPLOYEE GROUP BY COUNTERSALARY ORDER BY COUNTERSALARY DESC LIMIT 1

/*
PROBLEM 11
Query the following two values from the STATION table:

    The sum of all values in LAT_N rounded to a scale of 

decimal places.
The sum of all values in LONG_W rounded to a scale of
decimal places.
*/
SELECT ROUND(SUM(LAT_N),2) , ROUND(SUM(LONG_W),2) FROM STATION


/* PROBLEM 12
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than and less than . 
Truncate your answer to decimal places.
*/

SELECT ROUND(SUM(LAT_N),4) FROM STATION WHERE LAT_N BETWEEN 38.7880 AND 137.2345 

/*PROBLEM 13
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 .
 Truncate your answer to 4 decimal places.
*/
SELECT ROUND(LAT_N , 4) FROM STATION WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1


/*PROBLEM 14
Query the Western Longitude (LONG_W) for the largest Northern Latitude 
(LAT_N) in STATION that is less than 137.2345 . 
Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1

/*
PROBLEM 15
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780
. Round your answer to 4 decimal places.
*/

SELECT ROUND(LAT_N,4) FROM STATION WHERE LAT_N > 38.7780 ORDER BY LAT_N ASC LIMIT 1

/*
PROBLEM 16
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N)
 in STATION is greater than 38.7780 . Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N > 38.7780 ORDER BY LAT_N ASC LIMIT 1


/*PROBLEM 17
Consider and P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

/*the abs function returns the absolute number for example if the number is negative it is going to
turn it positive*/
SELECT ABS(ROUND((MIN(LAT_N) - MAX(LAT_N)) + (MIN(LONG_W) - MAX(LONG_W)),4)) FROM STATION;


/* PROBLEM  18
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values 
of Northern Latitude (LAT_N) and
are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2
and and format your answer to display
decimal 4 digits.
Input Format
The STATION table is described as follows:
*/

/*  ABS returns the absolute number, SQRT Return the square root of a number, 
POW raised to the the argument(number) power.
*/

SELECT ABS(ROUND(SQRT(POW((MIN(LAT_N)-MAX(LAT_N)),2)
            + POW((MIN(LONG_W)-MAX(LONG_W)),2)
 ),4)) FROM STATION