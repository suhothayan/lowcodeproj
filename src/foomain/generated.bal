import suho/accuweather;
import suho/twilio;

public function main() returns error?  {
   accuweather:Client accuweatherClient = check init_accuweatherClient();
   twilio:Client twilioClient = check init_twilioClient();
   check foo(accuweatherClient, twilioClient);
}
