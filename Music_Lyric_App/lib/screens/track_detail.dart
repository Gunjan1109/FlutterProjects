import 'package:flutter/material.dart';
import '../api/service2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetails extends StatefulWidget {
  int trackId;

  TrackDetails(int id){
    trackId = id;
  }
  @override
  _TrackDetailsState createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  var track;
  TrackService trackService;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrack();
    getLyrics();
  }

  getTrack() async{
    var temp =await TrackService.getTrackDetail(widget.trackId.toString());
      return temp;
  }

  getLyrics() async{
    var temp = await TrackService.getLyrics(widget.trackId.toString());
    return temp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              FutureBuilder(
                future: getTrack(),
                  builder: (BuildContext context, AsyncSnapshot asyncsnapshot){
                  if(asyncsnapshot.data == null){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                    return Center(
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 40, bottom: 20),child: Text("Track id : " +asyncsnapshot.data['track_id'].toString(),style: TextStyle(fontSize: 20),)),
                         Padding(padding: EdgeInsets.only(bottom: 20),child: Text("Track Name : " + asyncsnapshot.data['track_name'],style: TextStyle(fontSize: 20),)),
                          Padding(padding: EdgeInsets.only(bottom: 20),child: Text("Track Rating : " + asyncsnapshot.data['track_rating'].toString(),style: TextStyle(fontSize: 20),)),
                          Padding(padding: EdgeInsets.only(bottom: 20),child: Text("Artist Name : " + asyncsnapshot.data['artist_name'],style: TextStyle(fontSize: 20),)),
                          Text('Lyrics',style: TextStyle(fontSize: 25,color: Colors.blue),)

                        ],
                      ),
                    );
                  }
              ),
              FutureBuilder(
                future: getLyrics(),
                  builder: (BuildContext context, AsyncSnapshot asyncsnapshot){
                  if(asyncsnapshot.data == null){
                    return Center(
                      child: Text(''),
                    );

                  }

                  return Center(
                    child: Text(asyncsnapshot.data['lyrics_body'],style: TextStyle(fontSize: 15),),
                  );
                  }
              )
            ],
        ),
      )
    );
  }
}
