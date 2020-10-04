import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/db.dart';
import '../models/emp.dart';
import '../utils/alertBox.dart';
class Update extends StatefulWidget {
  int value;
  Update(this.value);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {


  @override
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  TextEditingController _tc3 = TextEditingController();

  Future<String> addInDB() async {
    Employee emp = Employee(int.parse(_tc1.text ?? 0), _tc2.text ?? '',
        double.parse(_tc3.text ?? 0.0));
    print("Emp Data is $emp");
    var dbRef = await _db.update(emp);
    print("DB Ref is $dbRef");
    print("Document ID is ${dbRef.documentID}");
    print(dbRef.documentID.runtimeType);
    if (dbRef.documentID != null && dbRef.documentID.length > 0) {
      return "Record Added";
      //print("Record Added");
    } else {
      return "Not Able to add it";
    }
  }

  Db _db = new Db();
  _createButton() {
    //return BuildSnackBar(addInDB);
    return ShowDailogBox(addInDB);
  }

  _createTextBox(ctrl) {
    return Container(
//      decoration: BoxDecoration(
//        border: Border.all(style: BorderStyle.solid),
//        color: Colors.limeAccent
//
//      ),
      padding: EdgeInsets.all(5),

      child: TextFormField(
        // initialValue: text,
        controller: ctrl,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            // border: InputBorder.none,
            ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Update'),
        elevation: 5,
      ),
      body:

         Column(
          children: <Widget>[
            _createTextBox( _tc1),
            _createTextBox( _tc2),
            _createTextBox( _tc3),
            _createButton()
          ],
        ),

    );
  }
}
