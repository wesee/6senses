var nodemailer = require('nodemailer');

// create reusable transporter object using SMTP transport
var transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
        user: 'vincent.tsn@gmail.com',
        pass: 'lsqkdkkdgovgrcdb'
    }
});

// NB! No need to recreate the transporter object. You can use
// the same transporter object for all e-mails

// setup e-mail data with unicode symbols
var mailOptions = {
    from: 'weee.seee@gmail.com', // sender address
    to: 'vincent.tsn@gmail.com', // list of receivers
    subject: 'need cleaning', // Subject line
    text: 'please clean toilet 101', // plaintext body
};

// send mail with defined transport object
transporter.sendMail(mailOptions, function(error, info){
    if(error){
        console.log(error);
    }else{
        console.log('Message sent: ' + info.response);
    }
});
