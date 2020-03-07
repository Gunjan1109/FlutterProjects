import 'package:flutter/material.dart';
class TextBox extends StatelessWidget {
  Function _name;
  TextBox({Function name}){
    this._name = name;
  }
  @override
  Widget build(BuildContext context) {
    return Container(width: 80,
      child: TextField(
        onChanged: (str){
          _name(str);
        },
        decoration: InputDecoration(

          border: OutlineInputBorder(),
          labelText: 'Search Artist',

        ),
      ),
    );
  }
}
