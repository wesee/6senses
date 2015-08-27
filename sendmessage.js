gcm = require('node-gcm-service');

var deviceID = {YourIOSDeviceID};

var message = new gcm.Message({
     data : {
	     title: 'SOS on Map',
	     message: 'Clean toilet 101'
     },
     delay_while_idle : false,
     dry_run : false
});

var sender = new gcm.Sender();

sender.setAPIKey('AIzaSyBXQwj4iWO_w_0OimgKcNTS3iqQbowyMVw');

sender.sendMessage(message.toString(), deviceID, true, function(err, data){});
