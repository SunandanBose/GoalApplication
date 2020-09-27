var express = require('express')
var mysql = require('mysql')
var app = express()

var con = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'password'
})

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
// });

app.get('/goal', (req, res) => {
  con.connect(err => {
    if (err) res.send({ message: 'Error while fetching goals' + err })

    con.query(
      'SELECT u.name AS username, g.description, gt.name AS goaltype, g.target FROM ( SELECT * FROM goalreminder.user WHERE username="subhojit.india@gmail.com" ) u LEFT JOIN goalreminder.goal g ON u.username=g.username LEFT JOIN goalreminder.goaltype gt ON g.goaltype = gt.id;',
      function (err, result, fields) {
        if (err) throw err
        console.log(result)
        let output = [];
        for (let i = 0; i < result.length; i++) {
            output.push({
              "username" : result[i].username,
              "Goal_Description" : result[i].description,
              "Goal_Type" : result[i].goaltype,
              "Completeion_Target" : result[i].target
            })
        }
        res.send({ "result" : output })
      }
    )
  })
})

app.get('/popo', (req, res) => {
  res.json(['Tony', 'Lisa', 'Michael', 'Ginger', 'Food'])
})

app.listen(3000, () => {
  console.log('Server running on port 3000')
})
