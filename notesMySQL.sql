-- 🔴Creating Databases Code
-- Start the CLI:

-- mysql-ctl cli; 

-- 🔴List available databases:

show databases; 

-- The general command for creating a database:

CREATE DATABASE database_name; 

-- A specific example:

CREATE DATABASE soap_store; 

-- 🔴To drop a database:

DROP DATABASE database_name; 

-- For Example:

DROP DATABASE hello_world_db; 

-- Remember to be careful with this command! Once you drop a database, it's gone!

-- 🔴Using your database
USE <database name>;
 
-- -- example:
USE dog_walking_app;
 
SELECT database();

-- 🔴Creating Your Own Tables
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );
-- 🔴How Do We Know It Worked?
SHOW TABLES;
 
SHOW COLUMNS FROM tablename;
 
DESC tablename;

-- 🔴Dropping Tables
DROP TABLE <tablename>; 

-- A specific example:

DROP TABLE cats; 

--🔴 Be careful with this command!

-- 🔴Inserting Data

-- The "formula":

INSERT INTO table_name(column_name) VALUES (data);
-- For example:
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

-- 🔴Super Quick Intro To SELECT
SELECT * FROM cats; 

-- 🔴Multiple Insert
INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);

-- 🔴If you're wondering how to insert a string (VARCHAR) value that contains quotations, then here's how.
-- You can do it a couple of ways:
-- Escape the quotes with a backslash: "This text has \"quotes\" in it" or 'This text has \'quotes\' in it'
-- Alternate single and double quotes: "This text has 'quotes' in it" or 'This text has "quotes" in it'

-- 🔴MySQL Warnings Code
DESC cats; 

-- Try Inserting a cat with a super long name:

INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
-- 🔴Then view the warning:

SHOW WARNINGS; 

-- Try inserting a cat with incorrect data types:

INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas'); 

-- Then view the warning:

SHOW WARNINGS; 

-- -NULL and NOT NULL Code
-- Try inserting a cat without an age:

INSERT INTO cats(name) VALUES('Alabama'); 

SELECT * FROM cats; 

-- Try inserting a nameless and ageless cat:

INSERT INTO cats() VALUES(); 


-- Define a new cats2 table with NOT NULL constraints:



CREATE TABLE cats2
  (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
  );
DESC cats2; 

-- Now try inserting an ageless cat:

INSERT INTO cats2(name) VALUES('Texas'); 

-- View the new warnings:

SHOW WARNINGS; 

SELECT * FROM cats2; 

-- Do the same for a nameless cat:

INSERT INTO cats2(age) VALUES(7); 

SHOW WARNINGS; 

-- 🔴Setting Default Values 
-- Define a table with a DEFAULT name specified:

CREATE TABLE cats3
  (
    name VARCHAR(20) DEFAULT 'no name provided',
    age INT DEFAULT 99
  );
-- Notice the change when you describe the table:

DESC cats3; 

-- Insert a cat without a name:

INSERT INTO cats3(age) VALUES(13); 

-- Or a nameless, ageless cat:

INSERT INTO cats3() VALUES(); 

-- Combine NOT NULL and DEFAULT:

CREATE TABLE cats4
  (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );
  
-- Notice The Difference:
INSERT INTO cats() VALUES();
SELECT * FROM cats;
INSERT INTO cats3() VALUES();
SELECT * FROM cats3;
INSERT INTO cats3(name, age) VALUES('Montana', NULL);
SELECT * FROM cats3;
INSERT INTO cats4(name, age) VALUES('Cali', NULL);

-- 🔴Primary Keys
-- Define a table with a PRIMARY KEY constraint:

CREATE TABLE unique_cats
  (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
  );
DESC unique_cats; 

-- Insert some new cats:

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);
 
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);
 
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);
-- Notice what happens:

SELECT * FROM unique_cats; 

-- 🔴Adding in AUTO_INCREMENT:

CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);
-- INSERT a couple new cats:

INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
-- Notice the difference:

SELECT * FROM unique_cats2; 

-- 🔴Introduction to CRUD (Create, Read, Update, and Delete)
INSERT INTO cats(name, age) VALUES(‘Taco’, 14);

-- -Preparing Our Data
-- Let's drop the existing cats table:

DROP TABLE cats; 

-- 🔴Recreate a new cats table:

CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
DESC cats; 

-- 🔴And finally insert some new cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- 🔴Simple SELECT statements:

SELECT * FROM cats; 
SELECT name FROM cats; 
SELECT age FROM cats; 
SELECT cat_id FROM cats; 
SELECT name, age FROM cats; 
SELECT cat_id, name, age FROM cats; 
SELECT age, breed, name, cat_id FROM cats; 
SELECT cat_id, name, age, breed FROM cats; 

-- 🔴Introduction to WHERE
-- Select by age:
SELECT * FROM cats WHERE age=4; 
-- Select by name:
SELECT * FROM cats WHERE name='Egg'; 
-- Notice how it deals with case:
SELECT * FROM cats WHERE name='egG';

-- 🔴Introduction to Aliases 
-- ALIAS command in SQL is the name that can be given to any table or a column.This alias name can be referred in WHEREclause to identify a particular table or a column.
SELECT cat_id AS id, name FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
DESC cats;

-- 🔴Updating Data
-- Change tabby cats to shorthair:
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 

-- Another update:
UPDATE cats SET age=14 WHERE name='Misty'; 

-- 🔴DELETING DATA
DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats;
SELECT * FROM cats WHERE name='egg';
DELETE FROM cats WHERE name='egg';
SELECT * FROM cats;
DELETE FROM cats;

-- 🔴Running SQL Files i.e. if our SQL code is too big and we write in a file, so now how we will run it!!!
CREATE TABLE cats
    (
        cat_id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100),
        age INT,
        PRIMARY KEY(cat_id)
    );
 
mysql-ctl cli
use cat_app;
source first_file.sql
 
DESC cats;

INSERT INTO cats(name, age)
VALUES('Charlie', 17);
INSERT INTO cats(name, age)
VALUES('Connie', 10);
SELECT * FROM cats;
source folder_name/insert.sql

-- 🔴First create your book_data.sql file with the following code:

DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop; 
 
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
-- 2. Then source that file
source book_data.sql 

-- 3. Now check your work:
DESC books;
SELECT * FROM books; 

-- 🔴Working With CONCAT
SELECT author_fname, author_lname FROM books;
CONCAT(x,y,z) -- from slides
CONCAT(column, anotherColumn) -- from slides
CONCAT(author_fname, author_lname)
CONCAT(column, 'text', anotherColumn, 'more text')
CONCAT(author_fname, ' ', author_lname)
CONCAT(author_fname, author_lname); -- invalid syntax
SELECT CONCAT('Hello', 'World');
SELECT CONCAT('Hello', '...', 'World');
SELECT CONCAT(author_fname, ' ', author_lname FROM books;
SELECT CONCAT(author_fname, ' ', author_lname) AS 'full name' FROM books;
SELECT author_fname AS first, author_lname AS last,  CONCAT(author_fname, ' ', author_lname) AS  FROM books;
SELECT author_fname AS first, author_lname AS last,  CONCAT(author_fname, ', ', author_lname) AS  FROM books;
SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;
SELECT  CONCAT_WS(' - ', title, author_fname, author_lname) FROM books;

-- 🔴Introducing SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);
SELECT SUBSTRING('Hello World', 3, 8);
SELECT SUBSTRING('Hello World', 3);
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTRING('Hello World', -7);
SELECT title FROM books;
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);
SELECT SUBSTRING(title, 1, 10) FROM books;
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;
source book_code.sql
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;
source book_code.sql

-- 🔴Introducing REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0');
SELECT REPLACE('HellO World', 'o', '*');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT CONCAT -- Instead of CANCAT we can also substring the replaced string
    (
       SUBSTRING(title, 1, 10),
       '...'
   ) AS 'short title' FROM books;
-- Eg
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) FROM books;
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string' FROM books;

-- 🔴Using REVERSE
SELECT REVERSE('Hello World');
SELECT REVERSE('meow meow');
SELECT REVERSE(author_fname) FROM books;
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- 🔴Working with CHAR LENGTH
SELECT CHAR_LENGTH('Hello World');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- 🔴Changing Case with UPPER and LOWER
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- 🔴The order is important when dealing with combining/wrapping certain string functions.
-- For example:
-- This works:
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps" FROM books;

-- While this does not:
SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps"  FROM books;
-- UPPER only takes one argument and CONCAT takes two or more arguments, so they can't be switched in that way.
-- You could do it this way, however:
SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps" FROM books;
-- But, the first example above would be better (more DRY*) because you wouldn't need to call UPPER two times.

-- 🔴Refining our selection and some new concept
-- Adding A Couple New Books
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
SELECT title FROM books;

-- 🔴Using DISTINCT
SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;
SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- 🔴Sorting Data with ORDER BY
-- Here ASC - Ascending  and DESC - Descending
SELECT author_lname FROM books;
SELECT author_lname FROM books ORDER BY author_lname;
SELECT title FROM books;
SELECT title FROM books ORDER BY title;
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT released_year FROM books;
SELECT released_year FROM books ORDER BY released_year;
SELECT released_year FROM books ORDER BY released_year DESC;
SELECT released_year FROM books ORDER BY released_year ASC;
SELECT title, released_year, pages FROM books ORDER BY released_year;
SELECT title, pages FROM books ORDER BY released_year;
-- ORDER BY 2 it's a shortcut so that we don't have to write author_fname again and the index start from 1
SELECT title, author_fname, author_lname FROM books ORDER BY 2;
SELECT title, author_fname, author_lname FROM books ORDER BY 3;
SELECT title, author_fname, author_lname FROM books ORDER BY 1;
SELECT title, author_fname, author_lname FROM books ORDER BY 1 DESC;
SELECT author_lname, titleFROM books ORDER BY 2;
SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

-- 🔴Using LIMIT
SELECT title FROM books LIMIT 3;
SELECT title FROM books LIMIT 1;
SELECT title FROM books LIMIT 10;
SELECT * FROM books LIMIT 1;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 14;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1,3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 10,1;
--A big number just to display all the rows as there can't be these many rows
SELECT * FROM tbl LIMIT 95,18446744073709551615;
SELECT title FROM books LIMIT 5;
SELECT title FROM books LIMIT 5, 123219476457;
SELECT title FROM books LIMIT 5, 50;

-- 🔴 Introduction to LIKE, Better Searches with LIKE (LIKE is case insensitive)
-- The "%" sign indicates that before it any letter can be there or vice versa
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
-- Below the searched string should start with da
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title FROM books WHERE  title LIKE 'the';
-- Below the searched string should end with the
SELECT title FROM books WHERE  title LIKE '%the';
SELECT title FROM books WHERE title LIKE '%the%';
-- Also if we want to do compare wrt to character length we should use "_" sign for the number of character
SELECT title, stock_quantity FROM books;
--This work on both string and integer
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';
-- This can we used to find the correct phone code or etc.
(235)234-0987 LIKE '(___)___-____'
SELECT title FROM books;
-- If we have "%" or "_" sign to be search we can use backslash as an escape character
SELECT title FROM books WHERE title LIKE '%\%%'
SELECT title FROM books WHERE title LIKE '%\_%'

-- 🔴The Count Function
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
SELECT title FROM books WHERE title LIKE '%the%';
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- 🔴Introduction to GROUP BY
SELECT title, author_lname FROM books;
--👇 Below will just show title of the first book which was published by author_lname.
SELECT title, author_lname FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT title, author_fname, author_lname FROM books;
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT released_year FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

-- 🔴MIN and MAX Basics
SELECT MIN(released_year) FROM books;
SELECT MIN(released_year) FROM books;
SELECT MIN(pages) FROM books;
SELECT MAX(pages) FROM books;
SELECT MAX(released_year) FROM books;
-- The problem in the below query is, it gives the max page book but do not show the correct title
SELECT MAX(pages), title FROM books;

-- 🔴A Problem with Min and Max
-- Solution 1 :- This will run 2 queries therefor it's slow
SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books); 
SELECT title, pages FROM books WHERE pages = (SELECT Max(pages) FROM books); 
SELECT title, pages FROM books WHERE pages = (SELECT Min(pages) FROM books); 
-- Solution 2 :- Only one query therefor faster than solution 1
SELECT * FROM books ORDER BY pages ASC LIMIT 1;
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;
SELECT * FROM books ORDER BY pages DESC LIMIT 1;