import 'package:http/http.dart' as http;
import'dart:convert' as json;


class LyricService{
  static const _baseUrl = "https://api.musixmatch.com/ws/1.1";
  static const _secertKey = "857bceb7e4c6c915455a338f3dda4532";

  Future getTracks() async{
      const url = _baseUrl+"/chart.tracks.get?apikey="+_secertKey;
     // print(url);
      http.Response response = await http.get(url);
      var map =json.jsonDecode(response.body);

      List list = [];
     list = map['message']['body']['track_list'];

      //print("list is $list");
    return list;
  }
}

