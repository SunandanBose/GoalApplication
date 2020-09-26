var express = require("express");
var mysql = require('mysql');
var app = express();

var con = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "password"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});


app.get("/popo", (req, res) => {
 res.json(["Tony","Lisa","Michael","Ginger","Food"]);
});


app.listen(3000, () => {
 console.log("Server running on port 3000");
});