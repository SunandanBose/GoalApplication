const { google } = require('googleapis')
const { OAuth2 } = google.auth
const credentials = require('./credentials.json');

const oAuth2Client = new OAuth2(credentials.client_id, credentials.client_secret)

oAuth2Client.setCredentials({refresh_token: credentials.refresh_token})

const calendar = google.calendar({version: 'v3', auth: oAuth2Client});

const eventStartTime = new Date()
eventStartTime.setDate(eventStartTime.getDay()+27)

const eventEndTime = new Date()
eventEndTime.setDate(eventEndTime.getDay()+27)
eventEndTime.setMinutes(eventEndTime.getMinutes()+45)

const event = {
    summary: "Testing Google Calendar",
    location: "Shop No.1, Cross Rd Number 14, Telco Colony, Jamshedpur, Jharkhand 831004",
    description: "Testing Google Calendar Description",
    start:{
        dateTime: eventStartTime,
        timeZone: "Asia/Kolkata"
    },
    end:{
        dateTime: eventEndTime,
        timeZone: "Asia/Kolkata"
    },
    colorid: 1,
    attendees: [ { email: "noreply@google.com"} ]   //Please add the invites here
}

// Incase you want to check weather the person is free or busy execute this
// calendar.freebusy.query({
//     resource: {
//         timeMin: eventStartTime,
//         timeMax: eventEndTime,
//         timeZone: "Asia/Kolkata",
//         items: [{id: "primary"}]
//     }
// },(err, res) => {
//     if(err) 
//     return console.log("Free Busy Check Error : "+err);

//     const eventArr = res.data.calendars.primary.busy;
//     if(eventArr.length === 0){
//         return calendar.events.insert({
//             calendarId: "primary",
//             resource: event
//         }, (err) => {
//             if(err)
//                 return console.log("Calendar Insert Error : "+err);
//             return console.log("Calendar Insert Created");
//         })
//     }
//     return console.log("Person Busy");

// })


//Directly send invite without check if he is free or busy
calendar.events.insert({
            calendarId: "primary",
            resource: event
        }, (err) => {
            if(err)
                return console.log("Calendar Insert Error : "+err);
            return console.log("Calendar Insert Created ");
        })
