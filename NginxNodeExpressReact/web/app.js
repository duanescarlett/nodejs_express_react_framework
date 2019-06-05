var express = require("express");
var bodyParser = require("body-parser");

var app = express();
var urlencodedParser = bodyParser.urlencoded({extended: false});

/* set up sql connection */
var mysql = require("mysql");
var connection = mysql.createConnection({
    host            : process.env.DATABASE_HOST,
    port            : process.env.MYSQL_PORT,
    user            : process.env.MYSQL_USER,
    password        : process.env.MYSQL_PASSWORD,
    database        : process.env.MYSQL_DATABASE
});

/* throw an error if sql connect fails. it should fail a couple times in docker 
 before successfully connecting. the container takes longer to boot up, essentially.
 */
connection.connect(function(err){
	if(err){
		console.error("error connecting: " + err.stack);
		return process.exit(22); //consistently exit so the Docker container will restart until it connects to the sql db
	}
	console.log("connected as id " + connection.threadId);
});

/* -------------------------------------- */
/* Get routes below */

app.get('/', function(req, res){
	res.send('Hello');
});


app.get('/api/customers', (req, res) => {
	const customers = [
		{id: 1, firstName: 'John', lastName: 'Doe'},
		{id: 2, firstName: 'Brad', lastName: 'Traversy'},
		{id: 3, firstName: 'Mary', lastName: 'Swanson'},
	];

	//res.json(react.customers)
	//res.send('Hello');
	res.json(customers);
});

/* Port and listening info below */
/* might want to set up argv for easily changing the port */
const port = process.env.PORT || 5000;

app.listen(port, function(){
	console.log("app listening on port: " + port);
});
