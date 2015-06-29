var express = require('express'),
	  redis = require('redis');
// Constants
var PORT = 8080;

var client = redis.createClient('6379', 'redis');

// App
var app = express();
app.get('/', function (req, res) {
  // res.send('Hello world\n');
  client.incr('counter', function(err, counter) {
    if(err) return next(err);
    res.send('This page has been viewed ' + counter + ' times!');
  });
});

app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
