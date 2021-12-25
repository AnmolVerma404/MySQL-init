-- 🔴Creating Databases Code
-- Start the CLI:

-- mysql-ctl cli; 

-- -List available databases:

show databases; 

-- The general command for creating a database:

CREATE DATABASE database_name; 

-- A specific example:

CREATE DATABASE soap_store; 

-- -To drop a database:

DROP DATABASE database_name; 

-- For Example:

DROP DATABASE hello_world_db; 

-- Remember to be careful with this command! Once you drop a database, it's gone!

-- -Using your database
USE <database name>;
 
-- -- example:
USE dog_walking_app;
 
SELECT database();

-- -Creating Your Own Tables
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
-- How Do We Know It Worked?
SHOW TABLES;
 
SHOW COLUMNS FROM tablename;
 
DESC tablename;

-- -Dropping Tables
DROP TABLE <tablename>; 

-- A specific example:

DROP TABLE cats; 

-- Be careful with this command!

-- -Inserting Data

-- The "formula":

INSERT INTO table_name(column_name) VALUES (data);
-- For example:
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

-- -Super Quick Intro To SELECT
SELECT * FROM cats; 

-- -Multiple Insert
INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);

-- -If you're wondering how to insert a string (VARCHAR) value that contains quotations, then here's how.
-- You can do it a couple of ways:
-- Escape the quotes with a backslash: "This text has \"quotes\" in it" or 'This text has \'quotes\' in it'
-- Alternate single and double quotes: "This text has 'quotes' in it" or 'This text has "quotes" in it'

-- -MySQL Warnings Code
DESC cats; 

-- Try Inserting a cat with a super long name:

INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
-- Then view the warning:

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

-- -Setting Default Values 
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

-- -Primary Keys
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

-- Adding in AUTO_INCREMENT:

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

-- - Introduction to CRUD (Create, Read, Update, and Delete)
INSERT INTO cats(name, age) VALUES(‘Taco’, 14);

-- -Preparing Our Data
-- Let's drop the existing cats table:

DROP TABLE cats; 

-- Recreate a new cats table:

CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
DESC cats; 

-- And finally insert some new cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- -Simple SELECT statements:

SELECT * FROM cats; 
SELECT name FROM cats; 
SELECT age FROM cats; 
SELECT cat_id FROM cats; 
SELECT name, age FROM cats; 
SELECT cat_id, name, age FROM cats; 
SELECT age, breed, name, cat_id FROM cats; 
SELECT cat_id, name, age, breed FROM cats; 

-- -Introduction to WHERE
-- Select by age:
SELECT * FROM cats WHERE age=4; 
-- Select by name:
SELECT * FROM cats WHERE name='Egg'; 
-- Notice how it deals with case:
SELECT * FROM cats WHERE name='egG';

-- - Introduction to Aliases 
-- ALIAS command in SQL is the name that can be given to any table or a column.This alias name can be referred in WHEREclause to identify a particular table or a column.
SELECT cat_id AS id, name FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
DESC cats;

-- - Updating Data
-- Change tabby cats to shorthair:
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 

-- Another update:
UPDATE cats SET age=14 WHERE name='Misty'; 

-- -DELETING DATA
DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats;
SELECT * FROM cats WHERE name='egg';
DELETE FROM cats WHERE name='egg';
SELECT * FROM cats;
DELETE FROM cats;

-- -Running SQL Files i.e. if our SQL code is too big and we write in a file, so now how we will run it!!!
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

