const nodeMailer = require('nodemailer');
const mailConfig = require('../config/mail');
require('dotenv/config');

exports.sendMail = (to, subject, htmlContent) => {
    const transport = nodeMailer.createTransport({
        host: mailConfig.HOST,
        port: mailConfig.PORT,
        secure: false,
        auth: {
            user: "hoanganh141000tb@gmail.com",
            pass: "cxzclnprtvimytff"
        }
    })

    const options = {
        from: mailConfig.FROM_ADDRESS,
        to: to,
        subject: subject,
        html: htmlContent
    }
    return transport.sendMail(options);
}