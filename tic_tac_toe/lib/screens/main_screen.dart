import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/button.dart';
import './widgets/TextBox.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _move = 0;
  String _msg = "";
  List<List<String>> mat = [
    [null, null, null],
    [null, null, null],
    [null, null, null]
  ];

  _print(bool turn, int i, int j) {
    if (turn == true) {
      if (mat[i][j] == null) {
        mat[i][j] = 'X';
        this._turn = false;
      }
    } else if (turn == false) {
      if (mat[i][j] == null) {
        mat[i][j] = '0';
        this._turn = true;
      }
    }
  }

  bool _turn = true; //true for X and false for 0

  _checkWinner([int move = 0]) {
    this._move = move;
    if (move >= 5 && this._msg == "") {
      //row1
      if (mat[0][0] == mat[0][1] &&
          mat[0][0] == mat[0][2] &&
          mat[0][0] != null) {
        _msg = '${mat[0][0]} IS THE WINNER !!!';
      }
      //row2
      if (mat[1][0] == mat[1][1] &&
          mat[1][0] == mat[1][2] &&
          mat[1][0] != null) {
        _msg = '${mat[1][0]} IS THE WINNER !!!';
      }
      //row3
      if (mat[2][0] == mat[2][1] &&
          mat[2][0] == mat[2][2] &&
          mat[2][0] != null) {
        _msg = '${mat[2][0]} IS THE WINNER !!!';
      }
      //col1
      if (mat[0][0] == mat[1][0] &&
          mat[0][0] == mat[2][0] &&
          mat[0][0] != null) {
        _msg = '${mat[0][0]} IS THE WINNER !!!';
      }
      //clo2
      if (mat[0][1] == mat[1][1] &&
          mat[0][1] == mat[2][1] &&
          mat[0][1] != null) {
        _msg = '${mat[0][01]} IS THE WINNER !!!';
      }
      //col3
      if (mat[0][2] == mat[1][2] &&
          mat[0][2] == mat[2][2] &&
          mat[0][2] != null) {
        _msg = '${mat[0][2]} IS THE WINNER !!!';
      }
      //main diag
      if (mat[0][0] == mat[1][1] &&
          mat[0][0] == mat[2][2] &&
          mat[0][0] != null) {
        _msg = '${mat[0][0]} IS THE WINNER !!!';
      }

      //sec diag
      if (mat[0][2] == mat[1][1] &&
          mat[0][2] == mat[2][0] &&
          mat[0][2] != null) {
        _msg = '${mat[0][2]} IS THE WINNER !!!';
      }
    }
    setState(() {});
  }

  _reset() {
    _move = 0;
    _msg = "";
    _turn = true;
    mat = [
      [null, null, null],
      [null, null, null],
      [null, null, null]
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe '),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment:CrossAxisAlignment.center ,
              children: <Widget>[
                Button(
                    i: 0,
                    j: 0,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[0][0],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 0,
                    j: 1,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[0][1],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 0,
                    j: 2,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[0][2],
                    checkWinner: _checkWinner,
                    move: _move)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
                Button(
                    i: 1,
                    j: 0,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[1][0],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 1,
                    j: 1,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[1][1],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 1,
                    j: 2,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[1][2],
                    checkWinner: _checkWinner,
                    move: _move)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
                Button(
                    i: 2,
                    j: 0,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[2][0],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 2,
                    j: 1,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[2][1],
                    checkWinner: _checkWinner,
                    move: _move),
                Button(
                    i: 2,
                    j: 2,
                    turn: _turn,
                    fn: _print,
                    buttonText: mat[2][2],
                    checkWinner: _checkWinner,
                    move: _move)
              ],
            ),
            TextBox(_msg),
            Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      _reset();
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 32),
                    )))
          ],
        ),
      ),
    );
  }
}
