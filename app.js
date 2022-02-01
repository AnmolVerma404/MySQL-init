// 🔴Connecting Node to MySQL
// Documentation for the MySQL Node Package: 

// 🔴Step 1: Install the MySQL Node Package
// npm install mysql 

// 🔴Step 2: Connect to Database*
var mysql = require('mysql');
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',     // your root username
  database : 'join_us'   // the name of your db
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
var a = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
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
var b = 'SELECT * FROM users';
connection.query(b,function (error, results, fields,){
	if(error) throw error;
	console.log(results);
});
connection.end();
