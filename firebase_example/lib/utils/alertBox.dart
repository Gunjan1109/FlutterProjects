import 'package:flutter/material.dart';
class ShowDailogBox extends StatelessWidget {
  @override
  Function _function;
  ShowDailogBox(this._function);

  createDialogBox(context , String data){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Message"),
          content: new Text(data),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          elevation: 4,
          color: Colors.green,
          child: Text(
            'Add',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            Future future = _function();
            future
                .then((data) => {createDialogBox(context, data)})
                .catchError((err) => createDialogBox(context, err));
          }),
    );
  }
}
