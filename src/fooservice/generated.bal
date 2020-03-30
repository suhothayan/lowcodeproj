import suho/accuweather;
import suho/twilio;
import ballerina/http;
import ballerina/log;

service foo on new http:Listener(8090) {
    resource function sayHello(http:Caller caller, http:Request req) returns error?{
        accuweather:Client accuweatherClient = check init_accuweatherClient();
        twilio:Client twilioClient = check init_twilioClient();
        http:ResponseMessage message = check foocall(accuweatherClient, twilioClient);
        var result = caller->respond(message);
        if (result is error) {
            log:printError("Error sending response", result);
        }
    }
}
