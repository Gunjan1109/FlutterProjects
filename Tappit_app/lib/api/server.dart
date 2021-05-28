import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class Server{
  static getTickets() async{
      const url = "http://3.135.249.124:8000/api/v1/app/ticket/list";
      Map<String,String> headers = {
        'token' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21lcklkIjoiQ1M4OTMxMSIsIm1vYmlsZU51bWJlciI6Ijg0MjgyMjk5OTAiLCJpc01vYmlsZU51bWJlclZlcmlmaWVkIjp0cnVlLCJpYXQiOjE2MTgyMTE2Mjh9.BfVfJVZZOqqWZcmd8p9Nsv-VQ7NQLzz_ANDsAmDNw-Y'
      };
      http.Response response = await http.get(url,headers: headers);
      var map = json.jsonDecode(response.body);
      //print(map);

      List list = map['data'];
      print(list);
      return list;
  }
}