import 'package:flutter/material.dart';

import './screens/add.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'CRUD App',
    home: Add(),
    theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(color: Colors.orange)),
  ));
}
