-- -Creating Databases Code
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

