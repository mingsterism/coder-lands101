const express = require('express');
const url = require('url');
const randomString = require('randomstring')
const request = require('request');

const githubRouter = express.Router();

const CLIENT_ID = 123
const CLIENT_SECRET = 12344

const randString = randomString.generate();

const githubOauthParams = {
  "client_id": CLIENT_ID, 
  //"redirect_uri": "https://coders-map-visualisation.herokuapp.com/callback",
  "redirect_uri": "http://54.255.249.246:5000/callback", 
  "state": randString,
}

const githubPostParams = (codeString) => {
   const postObj = {
      "client_id": CLIENT_ID, 
      "client_secret": CLIENT_SECRET,
      "code": codeString, 
  }
   return postObj;
}

const requestOptions = (OAUTH_TOKEN) => {
  const payload = {
      url: "https://api.github.com/user", 
      headers: {
      "Authorization": "token " + OAUTH_TOKEN,
      'User-Agent': 'request', 
      }
   }
  console.log("PAYLOAD --------", payload)
  return payload
}

const getGithubAccessCode = (req, res, next) => {
  const userData = request.post(
    { 
      url:"https://github.com/login/oauth/access_token", 
      form: githubPostParams(req.query.code)
    }, 
    (err, httpResponse, body) => {
      console.log('----------------------')
      TOKEN = httpResponse.body.split("=")[1]
      TOKEN_FINAL = TOKEN.split("&")[0]
      console.log("============================")
      return request(requestOptions(TOKEN_FINAL), (err, resp, body) => {
        console.log("Body: ------ ", body)
        return body
      })
    }
  )
  req.userGithubData = userData
  next()
}

githubRouter.use((req, res, next) => {
  console.log("Calling githubRouter middleware")
  next()
})

githubRouter.get('/', (req, res) => {
  console.log("Initializing Request ...", Object.keys(req));
  res.redirect(url.format({
    pathname: "http://github.com/login/oauth/authorize", 
    query: githubOauthParams,
  }))
})


githubRouter.get('/callback', getGithubAccessCode, (req, res) => {
  console.log("========================", req.userGithubData)
  res.send("Ended")
});

module.exports = githubRouter;