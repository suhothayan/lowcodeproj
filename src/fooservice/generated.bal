import ballerina/http;
import ballerina/log;

service foo on new http:Listener(8090) {
    resource function sayHello(http:Caller caller, http:Request req) returns error? {
        var result = caller->respond(check foocall(check init_accuweatherClient(), check init_twilioClient()));
        if (result is error) {
            log:printError("Error sending response", result);
        }
    }
}
