import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/exceptions.dart';
import '../../api/service.dart';
import 'events.dart';
import 'states.dart';

class MusicBloc extends Bloc<MusicEvents,MusicState>{
  LyricService lyricService;

  List music = [];

  MusicBloc({this.lyricService}) : super(MusicInitState());

  @override
  Stream<MusicState> mapEventToState(MusicEvents events) async*{
    switch(events){
      case MusicEvents.fetchHomeScreen:
        print("in fetch");
        yield MusicLoading();
        try{
            print("In Music Bloc 1 try");
            music = await lyricService.getTracks();

            yield MusicLoaded(music: music);
        } on SocketException {
          yield MusicError(
            error: NoInternetException('No Internet Connection')
          );
        }
        catch(e){
          yield MusicError(
            error: UnknownException('Unknown Error')
          );
        } break;


    }
  }


}