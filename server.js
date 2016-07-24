var express = require('express');

var cors = require('cors');
var bodyParser = require('body-parser');

var app = express();
var http = require('http');

//var cors = require('cors');
//var bodyParser = require('body-parser');


// var app = express();
app.use(bodyParser());
app.use(cors());

//------------------------------------------------

// how to run this app
// on node.js command prompt,
// 1- cd to this directory  (C:/code/nodeProj/contactlistapp)
// 2- type:  node server.js
// 3- on a browser, type:  localhost:3000
//
// browser will show:
//   Contact list
//   Name      Email               Number
//   murrey33  murrey@email.com    222-222-2222

/*
//test to see if server run correctly
// call app's get() function
app.get('/', function(req, res) { // '/' means set the route to our index place
	res.send("Hi from server.js"); 
});
*/
var mysql = require("mysql");

// resultRows = [];




// S.10   setup html template
// we use index.html  so next command tell server where to look for index.html
app.use(express.static( __dirname + "/public")); //  _-dirname + ...  <-- where to  find static  file

//-----------------------------------------
// wrtite to database
//-----------------------------------------
app.post('/newpost', function (req, res) {
	// console.log("I received a POST req", req);
	var mytitle;
	var myemail;
	console.log("I received a POST req");
	console.log(req.body.Title, " ", req.body.Email);
	mytitle = req.body.Title;
	myemail = req.body.Email;

	var con = mysql.createConnection({
		host: "localhost",
		user: "mysql",
		password: "",
		database: "lamp_final_project"
	});

	con.connect(function(err){
		if(err){
			console.log('Error connecting to Db');
			return;
		}
		console.log('Connection established');
	});
	//---------
	// write
	//---------
	//  var mystr = 'INSERT INTO posts (Title, Email) VALUES (' + mytitle + myemail + " )";
	// error con.query("INSERT INTO posts (Title, Email) VALUES (req.body.Title , req.body.Email )",
	// error con.query("INSERT INTO posts (Title, Email) VALUES ('req.body.Title' , 'req.body.Email' )",
	// GOOD    con.query("INSERT INTO posts (Title, Email) VALUES ('mytitle7777777', 'myemail77777')",
	//con.query("INSERT INTO posts (Title, Email) VALUES (" , mytitle , myemail," )",
	// con.query(mystr,
	//var employee = { name: 'Winnie', location: 'Australia' };
	//con.query('INSERT INTO employees SET ?', employee,
	var employee = {
					SubCategory_ID: req.body.SubCategory_ID,
					Location_ID: req.body.Location_ID,
					Title: mytitle,
					 Price: req.body.Price,
					 Description: req.body.Description,
					Email: myemail,
						Agreement: req.body.Agreement,
						Timestamp: req.body.Timestamp
		};
	con.query('INSERT INTO posts SET ?', employee,
		function(err,rows){
		if(err) throw err;

		console.log('Data written to Db:\n');
		// var person1 = {name: rows[0].Title, email: rows[0].Email, number: "111-111-1111"};

	});
});

//-----------------------------------------
//  get from databaase
//------------------------------------------
app.get('/contactlist', function(req, res) {
	console.log("I received a GET req");
	//var person1 = { name: "Jim", email: "jim@email.com", number: "111-111-1111"  };
	var person2 = { name: "murrey33", email: "murrey@email.com", number: "222-222-2222"  };
		var con = mysql.createConnection({
			host: "localhost",
			user: "mysql",
			password: "",
			database: "lamp_final_project"
		});

		con.connect(function(err){
			if(err){
				console.log('Error connecting to Db');
				return;
			}
			console.log('Connection established');
		});

		//--------------------------------------------------
		// get data from MySQL database
		//--------------------------------------------------
		con.query('SELECT * FROM posts',function(err,rows){
			if(err) throw err;

			console.log('Data received from Db:\n');
			// resultRows = rows;
			// console.log(rows);
			// var person1 = {name: rows[0].Title, email: rows[0].Email, number: "111-111-1111"};
			var person = [] ;
			for (var i = 0; i < rows.length; i++) {
				person[i] = {
					SubCategory_ID: rows[i].SubCategory_ID,
					Location_ID: rows[i].Location_ID,
					title: rows[i].Title,
					Price: rows[i].Price,
					Description: rows[i].Description,
					TimeStamp: rows[i].TimeStamp,
					email: rows[i].Email,
					Image_1: rows[i].Image_1,
					Image_2: rows[i].Image_2,
					Image_3: rows[i].Image_3,
					Image_4: rows[i].Image_4
					
					// Image_4: images/rows[i].Image_4   // this cause error
					/*
					C:\code\Project\miniCraiglistBuildUp\v22\node_modules\mysql\lib\protocol\Parser.js:78
				throw err; // Rethrow non-MySQL errors
				ReferenceError: images is not defined
				at Query._callback (C:\code\Project\miniCraiglistBuildUp\v22\server.js:150:15)
				*/


					//number: "8"
				};
				// person[i] = {name: rows[i].Title, email: rows[i].Email, number: "8"};
			}
			var contactlist = person; // [person1, person2];
			res.json(contactlist);
		});
		con.end(function(err) {
			// The connection is terminated gracefully
			// Ensures all previously enqueued queries are still
			// before sending a COM_QUIT packet to the MySQL server.
		});

	/*

	 CREATE TABLE IF NOT EXISTS `posts` (
	 `Post_ID` int(11) NOT NULL AUTO_INCREMENT,
	 `Title` char(90) NOT NULL,
	 `Price` float DEFAULT NULL,
	 `Description` text,
	 `Email` char(90) DEFAULT NULL,
	 `Agreement` tinyint(1) DEFAULT NULL,
	 `TimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	 `Image_1` text,
	 `Image_2` text,
	 `Image_3` text,
	 `Image_4` text,
	 `SubCategory_ID` int(11) DEFAULT NULL,
	 `Location_ID` int(11) DEFAULT NULL,
	 PRIMARY KEY (`Post_ID`),
	 KEY `SubCategory_ID` (`SubCategory_ID`),
	 KEY `Location_ID` (`Location_ID`)
	 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

  */




		//var contactlist = [person1, person2];
	//res.json(contactlist);
	}
	);

app.listen(3000);
console.log("Hi from server.js  on port 3000");

