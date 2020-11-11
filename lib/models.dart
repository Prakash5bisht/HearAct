import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkingModel{

   String apiKey = 'E34irpbjevz2dyXW9Kz6Dqnj_fp1RDCXKOhGbmDmyx7K';
   String baseUrl = 'https://api.eu-gb.text-to-speech.watson.cloud.ibm.com/instances/b9abf166-3657-4de5-9a9b-56c9ce111715/v1/';

    getResponse(Future<http.Response> request) async{
     print('6');
    // http.Response response = await
     http.get(request);
    // print(response);
     print('7');
     // if(response.statusCode == 200){
     //   print('4');
     //   return jsonDecode(response.body);
     // }
   }


   Future<String> makeRequest(String text) async{
     String apiLink = '$baseUrl+text:synthesize?key=$apiKey';

     Map<String,Object> body = {
       "audioConfig": {
         "audioEncoding": "MP3",
         "pitch": 0,
         "speakingRate": 1
       },
       "input":{
         "text": "$text",
       },
       "voice":{
         "languageCode": "en-IN",
         "name": "en-US-Wavenet-D"
       }
     };

     print('2');
    var request = http.post(apiLink, body: jsonEncode(body));
     print('3');
     print(request);
    var response = await getResponse(request);
     print('5');
    String audio = getAudioContent(response);

       return audio;
   }

   String getAudioContent(Map<String , dynamic> jsonRequest){
     print('1');
     try{
       String audioContent = jsonRequest['audioContent'];
       return audioContent;
     }catch(e){
       print(e);
     }
     print('3');
   }
}