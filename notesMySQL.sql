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

-- 🔴 Using Min and Max with Group By
SELECT author_fname,  author_lname,  Min(released_year)  FROM   books  GROUP  BY author_lname,  author_fname;
SELECT author_fname, author_lname, Max(pages) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MAX(pages) AS 'longest book' 
    FROM books GROUP BY author_lname, author_fname;

-- 🔴The Sum Function
SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;
SELECT author_fname, author_lname, Sum(pages) FROM books GROUP BY author_lname, author_fname;
SELECT author_fname, author_lname, Sum(released_year) FROM books GROUP BY author_lname, author_fname;

-- 🔴The Avg Function
SELECT AVG(released_year)  FROM books;
SELECT AVG(pages)  FROM books;
SELECT AVG(stock_quantity)  FROM books  GROUP BY released_year;
SELECT released_year, AVG(stock_quantity)  FROM books  GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

-- 🔴CHAR and VARCHAR
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');
-- 👆 As the CHAR is 5 max length therefore bob and robby will not be affected but bob will also take 5 length 3(character)+2(space)
-- 👇 The inserted name is well long than the length so we will only see Princ
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');
SELECT * FROM dogs;
-- 👇 The inserted breed datatype is indeed VARCHAR but if it goes over it's max length it will slice to the max length given in the line 588, but if breed.length<(given) it will not take extra space as it took in the case of CHAR datatype
INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
SELECT * FROM dogs;

-- 🔴DECIMAL
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7);-- 7.00
INSERT INTO items(price) VALUES(7987654);-- 999.99
INSERT INTO items(price) VALUES(34.88);-- 34.88
INSERT INTO items(price) VALUES(298.9999);-- 299.00
INSERT INTO items(price) VALUES(1.9999);-- 2.00
SELECT * FROM items;

-- 🔴FLOAT precision upto 7 digits
CREATE TABLE thingies (price FLOAT);
INSERT INTO thingies(price) VALUES (88.45);-- 88.45
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877.45);-- 8877.45
SELECT * FROM thingies;
INSERT INTO thingies(price) VALUES (8877665544.45);-- 8877670000
SELECT * FROM thingies;
-- 🔴DOUBLE precision upto 15 digits
CREATE TABLE again_thingies (price DOUBLE);
INSERT INTO again_thingies(price) VALUES (88.45);-- 88.45
SELECT * FROM again_thingies;
INSERT INTO again_thingies(price) VALUES (8877.45);-- 8877.45
SELECT * FROM again_thingies;
INSERT INTO again_thingies(price) VALUES (8877665544.45);-- 8877665544.45
SELECT * FROM again_thingies;
INSERT INTO again_thingies(price) VALUES (8877665544.4572361872361);-- 8877665544.457235
SELECT * FROM again_thingies;

-- 🔴Creating Our DATE data
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
SELECT * FROM people;

-- 🔴 Current DATE and TIME
-- CURDATE() -  Gives current date
-- CURTIME() - Gives current time
-- NOW()     - Gives current date and time
INSERT INTO people(name,birthdate,birthtime,birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW());

-- 🔴Formatting Dates
SELECT name, birthdate FROM people;
SELECT name, DAY(birthdate) FROM people;
SELECT name, birthdate, DAY(birthdate) FROM people;
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
SELECT name, birthdt, MONTH(birthdt) FROM people;
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

-- 🔴Date Math
SELECT * FROM people;
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT birthdt FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;

-- 🔴Working with TIMESTAMPS
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()--unlike DATETIME which ranges from 1000-01-01 00:00:00 to 9999-12-31 23:59:59, TIMESTAMP range less i.e. 1970-01-01 00:00:00 to 2038-12-31 23:59:59, therefor TIMESTAMP is space friendly
);
INSERT INTO comments (content) VALUES('lol what a funny article');
INSERT INTO comments (content) VALUES('I found this offensive');
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
SELECT * FROM comments ORDER BY created_at DESC;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO comments2 (content) VALUES('dasdasdasd');
INSERT INTO comments2 (content) VALUES('lololololo');
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';--This will update the time, can be used if someone edit's the text
SELECT * FROM comments2;
SELECT * FROM comments2 ORDER BY changed_at;
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

-- 🔴Not Equal
SELECT title FROM books WHERE released_year = 2017;
SELECT title FROM books WHERE released_year != 2017;
SELECT title, author_lname FROM books;
SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

-- 🔴Not Like
SELECT title FROM books WHERE title LIKE 'W';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title LIKE '%W%';
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title NOT LIKE 'W%';

-- 🔴Greater Than
SELECT title, released_year FROM books ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;
SELECT title, stock_quantity FROM books;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
SELECT 99 > 1;
SELECT 99 > 567;
100 > 5     -- true
-15 > 15    -- false
9 > -10     -- true
1 > 1       -- false
'a' > 'b'   -- false
'A' > 'a'   -- false
'A' >=  'a' -- true
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';

-- 🔴Less Than
SELECT title, released_year FROM books;
SELECT title, released_year FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books WHERE released_year <= 2000;
SELECT 3 < -10;    -- false
SELECT -10 < -9;   -- true
SELECT 42 <= 42;   -- true
SELECT 'h' < 'p';  -- true
SELECT 'Q' <= 'q'; -- true

-- 🔴Logical AND
SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers';
SELECT title, author_lname, released_year FROM books WHERE released_year > 2010;
SELECT  title, author_lname, released_year FROM books WHERE author_lname='Eggers' AND released_year > 2010;
SELECT 1 < 5 && 7 = 9;        -- false
SELECT -10 > -20 && 0 <= 0;   -- true
SELECT -40 <= 0 AND 10 > 40;  --false
SELECT 54 <= 54 && 'a' = 'A'; -- true
SELECT *  FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';

-- 🔴Logical OR
SELECT title, author_lname, released_year  FROM books WHERE author_lname='Eggers' || released_year > 2010;
SELECT 40 <= 100 || -2 > 0;    -- true
SELECT 10 > 5 || 5 = 5;        -- true
SELECT 'a' = 5 || 3000 > 2000; -- true
SELECT title, author_lname, released_year, stock_quantity  FROM   books  WHERE  author_lname = 'Eggers' || released_year > 2010  OR stock_quantity > 100;

-- 🔴Between
SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
SELECT title, released_year FROM books  WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books  WHERE released_year NOT BETWEEN 2004 AND 2015;
SELECT CAST('2017-05-02' AS DATETIME);
SHOW databases;
USE new_testing_db;
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
SELECT  name,  birthdt  FROM people WHERE  birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

-- 🔴In And Not In
SHOW databases();
USE book_shop;
SELECT title, author_lname 
FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
SELECT title, released_year FROM books WHERE released_year NOT IN  (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year NOT IN  (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year;

-- 🔴Case Statements
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
SELECT title,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

--🔴Working With Foreign Keys
-- Creating the customers and orders tables
CREATE TABLE customers( id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), email VARCHAR(100));
CREATE TABLE orders( id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT, FOREIGN KEY(customer_id) REFERENCES customers(id));
-- Inserting some customers and orders
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
-- This INSERT fails because of our fk constraint.  No user with id: 98 (may be used as kind of authentication)
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);

-- 🔴Cross Joins
-- Finding Orders Placed By George: 2 Step Process
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;
-- Finding Orders Placed By George: Using a subquery
SELECT * FROM orders WHERE customer_id = ( SELECT id FROM customers WHERE last_name='George' );
-- Cross Join Craziness
SELECT * FROM customers, orders; 

-- 🔴Inner Joins
-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders  WHERE customers.id = orders.customer_id;
-- IMPLICIT INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers, orders  WHERE customers.id = orders.customer_id;
-- EXPLICIT INNER JOINS
SELECT * FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount  FROM customers JOIN orders ON customers.id = orders.customer_id;
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id;
-- ARBITRARY JOIN - meaningless, but still possible 
SELECT * FROM customers JOIN orders ON customers.id = orders.id;

-- 🔴Left Joins
-- Getting Fancier (Inner Joins Still)
SELECT first_name, last_name, order_date, amount  FROM customers JOIN orders ON customers.id = orders.customer_id ORDER BY order_date;
SELECT  first_name,  last_name,  SUM(amount) AS total_spent FROM customers JOIN orders ON customers.id = orders.customer_id GROUP BY orders.customer_id ORDER BY total_spent DESC;
-- LEFT JOINS
SELECT * FROM customers LEFT JOIN orders ON customers.id = orders.customer_id;
SELECT first_name, last_name, order_date, amount FROM customers LEFT JOIN orders ON customers.id = orders.customer_id; 
SELECT  first_name,  last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.id ORDER BY total_spent;

-- 🔴Right Joins
-- OUR FIRST RIGHT JOIN (seems the same as a left join?)
SELECT * FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;
-- ALTERING OUR SCHEMA to allow for a better example (optional)
CREATE TABLE customers( id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100),  last_name VARCHAR(100), email VARCHAR(100) );
CREATE TABLE orders( id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT );
-- INSERTING NEW DATA (no longer bound by foreign key constraint)
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'), ('George', 'Michael', 'gm@gmail.com'), ('David', 'Bowie', 'david@gmail.com'), ('Blue', 'Steele', 'blue@gmail.com'), ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders (order_date, amount, customer_id) VALUES ('2016/02/10', 99.99, 1), ('2017/11/11', 35.50, 1), ('2014/12/12', 800.67, 2), ('2015/01/03', 12.50, 2), ('1999/04/11', 450.25, 5);
INSERT INTO orders (order_date, amount, customer_id) VALUES ('2017/11/05', 23.45, 45), (CURDATE(), 777.77, 109);
-- A MORE COMPLEX RIGHT JOIN
SELECT  IFNULL(first_name,'MISSING') AS first,  IFNULL(last_name,'USER') as last,  order_date,  amount,  SUM(amount) FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name;

-- WORKING WITH ON DELETE CASCADE (earlier if we try to delete a row it would give an error as we used FOREIGN KEY,
-- so we have to delete order row first, to solve this just put ON DELETE CASCADE so it auto delete
CREATE TABLE customers( id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), email VARCHAR(100) );
CREATE TABLE orders( id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE, amount DECIMAL(8,2), customer_id INT, FOREIGN KEY(customer_id)  REFERENCES customers(id) ON DELETE CASCADE );
INSERT INTO customers (first_name, last_name, email)  VALUES ('Boy', 'George', 'george@gmail.com'), ('George', 'Michael', 'gm@gmail.com'), ('David', 'Bowie', 'david@gmail.com'), ('Blue', 'Steele', 'blue@gmail.com'), ('Bette', 'Davis', 'bette@aol.com');
INSERT INTO orders (order_date, amount, customer_id) VALUES ('2016/02/10', 99.99, 1), ('2017/11/11', 35.50, 1), ('2014/12/12', 800.67, 2), ('2015/01/03', 12.50, 2), ('1999/04/11', 450.25, 5);
-- If we switch table in LEFT JOIN it will we equal to right join without switched table, just the order will be different

-- 🔴Working with reviewers & IMDB
-- Creating Our Tables
-- CREATING THE REVIEWERS TABLE
CREATE TABLE reviewers ( id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100));
-- CREATING THE SERIES TABLE
CREATE TABLE series( id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(100), released_year YEAR(4), genre VARCHAR(100));
-- CREATING THE REVIEWS TABLE
CREATE TABLE reviews ( id INT AUTO_INCREMENT PRIMARY KEY, rating DECIMAL(2,1), series_id INT, reviewer_id INT, FOREIGN KEY(series_id) REFERENCES series(id), FOREIGN KEY(reviewer_id) REFERENCES reviewers(id));
-- INSERTING A BUNCH OF DATA
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
-- Inner Join in TV_rating
SELECT  title,  rating  FROM series JOIN reviews ON series.id = reviews.series_id;
-- AVG with inner join to find IMDB
SELECT title, AVG(rating) as avg_rating FROM series JOIN reviews ON series.id = reviews.series_id GROUP BY series.id ORDER BY avg_rating;
-- All reviewer's review
SELECT first_name, last_name, rating FROM reviews INNER JOIN reviewers ON reviewers.id = reviews.reviewer_id;