import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Function fn;
  Button({Function fn}){
    this.fn = fn;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Icon(Icons.search),
        padding: EdgeInsets.all(0.0),
        onPressed: (){
          fn();
        },
      ),
    );
  }
}
