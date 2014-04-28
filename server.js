var spawn = require('child_process').spawn;
var express = require('express');
var app = express();

app.use(express.static(__dirname + '/public'));

// Toggle screen brightness
app.post('/lights', function(req, res){
  spawn('./AutoIt3.exe', ['scripts/als.au3']);
  res.send(200);
});

// Git pull self
app.post('/gitPull', function(req, res){
  res.send(200);
  var script = spawn('git pull');
});

app.listen(80);
