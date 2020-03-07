import 'package:flutter/material.dart';
import '../widgets/textbox.dart';
import '../widgets/button.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;
import 'package:audioplayer/audioplayer.dart';
class MainScreen extends StatefulWidget {
  String name;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //AudioPlayer audioPlayer = new AudioPlayer();

  AudioPlayer audioPlayer = AudioPlayer();

  String kUrl;

  @override
  Widget build(BuildContext context) {
List list = [];
  getname(str){
      widget.name = str;
  }

  songPlay(String kUrl) async{
//    print(kUrl);
    await audioPlayer.play(kUrl);
  }

    getSongsFromAPI() async{
      setState(() {

      });
    print(widget.name);
    String artistName;
    artistName = widget.name.toLowerCase();
      if(artistName.contains(' ')){
        artistName = artistName.replaceAll(' ', '+');
      }
      print(artistName);
      var url = 'https://itunes.apple.com/search?term=' + artistName + '&limit=20';
   // var url = 'https://itunes.apple.com/search?term=jack+johnson';
      http.Response response = await http.get(url);
      var map = json.jsonDecode(response.body);
        print(map);
        list = map['results'];

        print(list);
        return list;

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('MusicApp')
      ),
      body: Column(
          children: <Widget>[
            Row(

              children: <Widget>[
                Expanded(child: TextBox(name: getname)),

                
               // SizedBox(width: 10,
              ],
            ),
            Row(
              children: <Widget>[
                 Button(fn: getSongsFromAPI),
              ],
            ),
            FutureBuilder(
              future: getSongsFromAPI(),
                builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
                  if (asyncsnapshot.data == null) {
                    return Center(
                      child: Text(' '),
                    );
                  }

                    return
                       Expanded(
                         child: ListView.builder(
                            itemCount: asyncsnapshot.data.length,
                            itemBuilder: (parent,index){
                            return Card(
                                child: ListTile(
                                  trailing: RaisedButton(
                                    child: Icon(Icons.play_arrow),
                                    onPressed: (){
                                      kUrl = asyncsnapshot.data[index]['previewUrl'];
                                      print(kUrl);
                                      songPlay(kUrl);
                                    }
                                  ),
                                  title: Text(
                                      asyncsnapshot.data[index] == null
                                          ? "" :asyncsnapshot.data[index]["trackName"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                            );
                          }

                      ),
                       );

                }

            )
          ],
        ),

    );
  }
}
