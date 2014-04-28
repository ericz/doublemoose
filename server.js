var spawn = require('child_process').spawn;
var express = require('express');
var app = express();

app.use(express.static(__dirname + '/public'));

app.post('/lights', function(req, res){
  var script = spawn('./AutoIt3.exe', ['scripts/als.au3']);
  res.send('ok')
});

app.listen(80);
