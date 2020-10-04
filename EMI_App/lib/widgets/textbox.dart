import 'package:flutter/material.dart';
class TextBox extends StatelessWidget {
  String _helperText,_labelText;
  TextBox({String helpertext, String labeltext}){
    this._helperText = helpertext;
    this._labelText = labeltext;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (str){

        },
        decoration: InputDecoration(
          helperText: '$_helperText',

          labelText: '$_labelText',
          labelStyle: TextStyle(fontSize: 25)
        ),
      ),
    );
  }
}
