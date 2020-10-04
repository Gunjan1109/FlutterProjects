import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  int _i;
  int _j;
  int _move;
  bool _turn;
  Function _fn;
  String _buttonText = "";
  Function _checkWinner;

  Button(
      {int i,
      int j,
      bool turn,
      Function fn,
      String buttonText,
      Function checkWinner,
      int move}) {
    this._i = i;
    this._j = j;
    this._turn = turn;
    this._fn = fn;
    this._buttonText = buttonText;
    this._checkWinner = checkWinner;
    this._move = move;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        elevation: 10,
        color: Colors.yellow,
        onPressed: () {
          ++_move;
          _fn(_turn, _i, _j);
          _checkWinner(_move);
        },
        child: Text(
          _buttonText ?? "",
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
