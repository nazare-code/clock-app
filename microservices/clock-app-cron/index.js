const mqtt = require('mqtt');
const CronJob = require('cron').CronJob;

const client  = mqtt.connect('mqtt://localhost');
 
client.on('connect', function () {
  client.subscribe('app/clock', function (err) {
    if (!err) {
      client.publish('app/clock', 'GO!')
    }
  });
});
 
const job = new CronJob('* * * * * *', function() {    
    const dateInMillisecs = Date.now();
    const now = new Date (dateInMillisecs).toLocaleTimeString();
    client.publish('app/clock', now);
    console.log(`Updated: ${now}`);
  }, null, true);
  job.start();
  