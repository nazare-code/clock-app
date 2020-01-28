// Create a client instance
client = new Paho.MQTT.Client("localhost", Number("9001"), "clientId" + Math.random());

// set callback handlers
client.onConnectionLost = onConnectionLost;
client.onMessageArrived = onMessageArrived;

// connect the client
client.connect({onSuccess:onConnect});

// called when the client connects
function onConnect() {
    // Once a connection has been made, make a subscription and send a message.
    console.log("onConnect");
    client.subscribe("html/controller");
    message = new Paho.MQTT.Message("onConnect");
    message.destinationName = "html/controller";
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
  //     const dateInMillisecs = Date.now();
  //     const now = new Date (dateInMillisecs).toLocaleTimeString();
    document.getElementById("clock").innerHTML = message.payloadString;
    console.log(message.payloadString);
  }
  
