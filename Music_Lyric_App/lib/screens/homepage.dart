import 'package:credicxo_music_app/screens/track_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/Homepage/MusicBloc.dart';
import '../utils/Homepage/events.dart';
import '../utils/Homepage/states.dart';
import '../api/exceptions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMusic();
  }

  _loadMusic() async {
    context.bloc<MusicBloc>().add(MusicEvents.fetchHomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credicxo'),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: [
              BlocBuilder<MusicBloc,MusicState>(builder: (BuildContext context, MusicState state){
                if(state is MusicError){
                  final error = state.error;
                  String message = '${error.message}\n Tap to retry';
                  return Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
                    child: Center(
                      child: InkWell(
                        onTap: () => _loadMusic(),
                        child: Container(
                          child: Text(message, style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),),
                        ),
                      ),

                      ),
                  );
                }
                if(state is MusicLoaded){
                  List music = state.music;
                  return _list(music);
                }
                return Expanded(child: Center(
                  child: CircularProgressIndicator(),
                ));
              })
            ],
          ),
      ),
    );
  }
}


Widget _list(List music){
  return Expanded(
      child: ListView.builder(
        itemCount: music.length,
          itemBuilder: (BuildContext ctxt, int index){
            return Card(
              child: ListTile(
                onTap: (){

                  Navigator.of(ctxt).push(MaterialPageRoute(builder: (cx) => TrackDetails(music[index]['track']['track_id'])));
                },
                title: Text(
                  music[index]['track']['track_name']
                ),
                subtitle: Text(music[index]['track']['artist_name'])
              ),
            );
          }
      )
  );
}