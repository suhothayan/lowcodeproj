import suho/accuweather;
import suho/twilio;

function init_accuweatherClient() returns error | accuweather:Client {
    accuweather:Client cnt = new ("8dbh68Zg2J6WxAK37Cy2jVJTSMdnyAmV");
    return cnt;
}

function init_twilioClient() returns error | twilio:Client {
     twilio:Client cnt = new ({
            accountSId: "ACb2e9f049adcb98c7c31b913f8be70733",
            authToken: "34b2e025b2db33da04cc53ead8ce09bf",
            xAuthyKey: ""
        });
    return cnt;
}