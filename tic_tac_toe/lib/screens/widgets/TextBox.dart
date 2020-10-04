import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String _msg;

  TextBox(this._msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Text(
        '${_msg ?? ""}',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
