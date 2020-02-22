import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  @override
  String _num;
  Function _fn;
  Button({String num,Function fn}){
    this._num = num;
    this._fn = fn;
  }
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        //elevation: 10,
        color: Colors.yellow,
        onPressed: () {
          _fn(_num,_num);
        },
        child: Text('$_num'
        ),
      ),
    );
  }
}
