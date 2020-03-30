import suho/accuweather;
import suho/twilio;
import suho/datamapper;
import ballerina/http;

function foocall(accuweather:Client accuweatherClient, twilio:Client twilioClient) returns error | http:ResponseMessage {
    accuweather:WeatherResponse accuweatherResult = check accuweatherClient->getDailyWeather("80000");
    string dataMapperResult = <string> datamapper:datamapper(
                                        {mapping: string `Today is ${<string>accuweatherResult.dayWeather} and the night is ${<string>accuweatherResult.nightWeather}. Today's maximum temprature is ${<string>accuweatherResult.maxTemp}F and the minimum temprature is ${<string>accuweatherResult.minTemp}F. Have a great day!! ~this is ur Ballerina weather bot`});
    twilio:WhatsAppResponse twilioResult = check twilioClient->sendWhatsAppMessage("+14155238886", "+94773898282", dataMapperResult);

    http:ResponseMessage responsemessage = (dataMapperResult);
    return responsemessage;
}