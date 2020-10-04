import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/dashboard.dart';
import './models/myModel.dart';
void main(){
  runApp(ChangeNotifierProvider(
    create: (context) => MyModel(),
    child: MaterialApp(
      title: "Flutter Practice",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Dashboard(),
    ),
  ));
}
