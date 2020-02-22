var express = require('express');
var app = express();

app.set('port', process.env.PORT || 3000);
app.set('info', process.env.RUNNING_ON || 'local');
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.send(`./index.html`);
});

app.get('/info', (req, res) => {
    res.send(`<link rel="stylesheet" type="text/css" href="./css/clock.css">
	      <p id="clock" class="clock">${app.set('info')}!</p>`);
});

app.listen(app.get('port'), ()=> {
    console.log(`server up and running on port ${app.get('port')}!`);
});
