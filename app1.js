const express = require('express');
const githubRouter = require('./routes/github_login.js');
const app = express();
const port = process.env.PORT || 3000
const path = require('path');

app.get('/', (req, res) => {
  res.send("This is home page");
})

app.get('/login', githubRouter)

app.get('/emoji-rain', (req, res) => {
  res.sendFile(path.join(__dirname + '/web-components-playground/emoji-rain/emoji-rain.html'));
})

app.listen(port, () => {
  console.log("Listening on port " + port);
})
