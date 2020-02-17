var express = require('express');
var app = express();

app.set('port', process.env.PORT || 3000);
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.send(`./index.html`);
});

app.listen(app.get('port'), ()=> {
    console.log(`server up and running on port ${app.get('port')}!`);
});
