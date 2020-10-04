import 'package:flutter/material.dart';
class MyModel with ChangeNotifier{
  String value = "Hello";
  String name = "Gunjan Garg";
  String email = "gunjan1109@gmaail.com";
  onClick(){
    value = "New Hello";
    print(value);
    notifyListeners();
  }
}