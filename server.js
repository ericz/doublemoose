var spawn = require('child_process').spawn;
var exec  = require('child_process').exec;
var express = require('express');
var app = express();

app.use(express.static(__dirname + '/public'));

// Toggle screen brightness
app.post('/lights', function(req, res){
  spawn('./AutoIt3.exe', ['scripts/als.au3']);
  res.send(200);
});

// Git pull self
app.post('/update', function(req, res){
  exec('git pull');
  res.send(200);
});

app.listen(80);
