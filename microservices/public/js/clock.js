const getCurrentTime = () => { 
    setTimeout(function () {
    const dateInMillisecs = Date.now();
    const now = new Date (dateInMillisecs).toLocaleTimeString();
    document.getElementById("clock").innerHTML = now;
    getCurrentTime();
    }, 1000);                    
};
getCurrentTime();