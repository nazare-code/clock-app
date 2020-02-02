// Create a client instance
client = new Paho.MQTT.Client("broker.example.com", Number("9001"), "clientId" + Math.random());

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});

// called when the client connects
function onConnect() {
    // Once a connection has been made, make a subscription and send a message.
    console.log("onConnect");
    client.subscribe("app/clock");
    message = new Paho.MQTT.Message("Ready?");
    message.destinationName = "app/clock";
    client.send(message);
  }
  
  // called when the client loses its connection
  function onConnectionLost(responseObject) {
    if (responseObject.errorCode !== 0) {
      console.log("onConnectionLost:" + responseObject.errorMessage);
    }
  }
  
  // called when a message arrives
  function onMessageArrived(message) {
    document.getElementById("clock").innerHTML = message.payloadString;
    console.log(message.payloadString);
  }
  
