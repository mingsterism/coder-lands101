// server.js

// BASE SETUP
// ==============================================

var express = require('express');
var app     = express();
var port    =   process.env.PORT || 3000;

// ROUTES
// ==============================================
const githubLogin = express.Router();

githubLogin.param('name', (req, res, next, name) => {
  console.log("Doing validations on ", name);
  req.name = name;
  next()
})

githubLogin.get('/:name', (req, res) => {
  res.send("Hello" + req.name);
})

app.use('/ghlogin', githubLogin);

app.get('/', (req, res) => {
  res.send("Home page")
})

// we'll create our routes here

// START THE SERVER
// ==============================================
app.listen(port);
console.log('Magic happens on port ' + port);
