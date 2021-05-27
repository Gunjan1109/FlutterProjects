import 'package:http/http.dart' as http;
import'dart:convert' as json;


class TrackService{
  static const _baseUrl = "https://api.musixmatch.com/ws/1.1";
  static const _secertKey = "857bceb7e4c6c915455a338f3dda4532";

  static getTrackDetail(id) async{
    var url = _baseUrl+"/track.get?track_id="+id+"&apikey="+_secertKey;
    print(url);
    http.Response response = await http.get(url);
    var map =json.jsonDecode(response.body);
   // print("map is $map");
    var track;
    track = map['message']['body']['track'];

    return track;
  }

  static getLyrics(id) async{
    var url = _baseUrl+"/track.lyrics.get?track_id="+id+"&apikey="+_secertKey;
    http.Response response = await http.get(url);
    var map =json.jsonDecode(response.body);

    var lyrics;
    lyrics = map['message']['body']['lyrics'];

    return lyrics;
  }


}
