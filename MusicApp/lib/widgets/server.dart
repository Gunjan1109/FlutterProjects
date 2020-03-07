//import '../screen/mainScreen.dart';
//import 'dart:convert' as json;
//import 'package:http/http.dart' as http;
//class Server{
//  static callSong() async{
//    MainScreen obj = MainScreen();
//    var song = obj.songName;
//    print(song);
//    if(song.contains(' ',0)){
//      song = song.replaceFirst('', '+',0);
//    }
//    var url = 'https://itunes.apple.com/search?term=' + song;
//    http.Response response = await http.get(url);
//    var map = json.jsonDecode(response.body);
//    return map;
//  }
//}