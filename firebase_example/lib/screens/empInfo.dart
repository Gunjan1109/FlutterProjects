import 'package:flutter/material.dart';
import '../models/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EmpInfo extends StatelessWidget {
  Db _db = Db();
  int value;
  EmpInfo(this.value);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: SingleChildScrollView(
       child: StreamBuilder(
    stream: Firestore.instance.collection("emps").snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData)
        return Text('Loading data...Please wait..');
      return
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Id'),
                  SizedBox(width: 30),
                  Text(
                      (snapshot.data.documents[value]["id"]).toString())
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('Name'),
                  SizedBox(width: 30),
                  Text(snapshot.data.documents[value]["name"])
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text("Salary"),
                  SizedBox(width: 30),
                  Text((snapshot.data.documents[value]["salary"]).toString())
                ],
              )
            ],
          );
    }
       ),
      ),
    );
  }
}
