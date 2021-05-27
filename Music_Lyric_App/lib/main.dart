import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './api/service.dart';
import 'utils/Homepage/MusicBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/homepage.dart';
void main(){
runApp(MaterialApp(
  title: 'Credicxo Music App',
  debugShowCheckedModeBanner: false,
  home: BlocProvider(
    create: (context) => MusicBloc(lyricService: LyricService()),
    child: HomePage(),
  ),
));
}