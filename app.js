// 🔴Connecting Node to MySQL
// Documentation for the MySQL Node Package:

// 🔴Step 1: Install the MySQL Node Package
// npm install mysql

// 🔴Step 2: Connect to Database*
var mysql = require("mysql");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root", // your root username
  database: "join_us", // the name of your db
});

// 🔴Step 3: Run Queries
// Running a super simple SQL query like:
// SELECT 1 + 1;
// Using the MySQL Node Package:
// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//    if (error) throw error;
//    console.log('The solution is: ', results[0].solution);
// });

// 🔴Another sample query, this time selecting 3 things:
var a = "SELECT CURTIME() as time, CURDATE() as date, NOW() as now";
connection.query(a, function (error, results, fields) {
  if (error) throw error;
  console.log(results[0].time);
  console.log(results[0].date);
  console.log(results[0].now);
});
// The equivalent SQL query:
// SELECT CURTIME() as time, CURDATE() as date, NOW() as now;

// var mysql = require('mysql');
// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'root',  // your root username (leave as root)
//   database : 'join_us',   // the name of your db (create this if you haven't already)
//   password : process.env.MYSQL_PW   // your root user's password
// });
// 🔴In order for this to work you'll first need to export the root password in an environment variable.
// Run the following command from your bash terminal:
// export MYSQL_PW='your-password-here'
// If you want the password to persist as an environment variable then checkout the dotenv npm package, otherwise you will need to export the variable every time you open a new terminal window.

// 🔴Selecting data
var b = "SELECT * FROM users";
connection.query(b, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
connection.end();
// 🔴Inserting data
var b = 'INSERT INTO users(email) VALUES ("rusty_the_dog@gmail.com")';
connection.query(b, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
connection.end();

// An easier approach that allows for dynamic data
var person = {
  email: faker.internet.email(),
  created_at: faker.date.past(),
};
var end_result = connection.query(
  "INSERT INTO users SET ?",
  person,
  function (err, result) {
    if (err) throw err;
    console.log(result);
  }
);

// 🔴Bulk Inserting 500 Users
// The Code To INSERT 500 Random Users

var data = [];
for (var i = 0; i < 500; i++) {
  data.push([faker.internet.email(), faker.date.past()]);
}
var q = "INSERT INTO users (email, created_at) VALUES ?";
connection.query(q, [data], function (err, result) {
  console.log(err);
  console.log(result);
});
connection.end();

// Our First Simple Web App:
var express = require("express");
var app = express();

app.get("/", function (req, res) {
  res.send("HELLO FROM OUR WEB APP!");
});

//Similarly we can add multiple route!!!
app.get("/joke", function (req, res) {
  var joke = "What do you call the dog that do magic tricks? A labracadabrador";
  res.send(joke);
});

app.get("/random_num", function (req, res) {
  var x = Math.floor(Math.random() * 10) + 1;
  res.send("Your lucky number is " + x);
});

app.listen(8080, function () {
  console.log("App listening on port 8080!");
});
// Remember to start the server up with:
// node app.js

// Connecting Express and MySQL
// Add the MySQL code inside of the root route:
app.get("/", function (req, res) {
  var q = "SELECT COUNT(*) as count FROM users";
  connection.query(q, function (error, results) {
    if (error) throw error;
    var msg = "We have " + results[0].count + " users";
    res.send(msg);
  });
});
