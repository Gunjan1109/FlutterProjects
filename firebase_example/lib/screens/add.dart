import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import './emplist.dart';
import '../models/db.dart';
import '../models/emp.dart';
import '../utils/snackbarcreate.dart';
import '../utils/alertBox.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();
  TextEditingController _tc3 = TextEditingController();
  AudioPlayer audioPlayer = new AudioPlayer();
  _playAudio() async {
    await audioPlayer.play(
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview123/v4/b8/4f/8d/b84f8dd3-aee9-15ad-9a0d-8531cc50c578/mzaf_9088360218574466748.plus.aac.p.m4a');
  }

  _songButton() {
    return Container(
      padding: EdgeInsets.only(right: 30),
      child: IconButton(
          icon: Icon(
            Icons.music_note,
            size: 50,
            color: Colors.black,
          ),
          onPressed: () {
            _playAudio();
          }),
    );
  }

  Future<String> addInDB() async {
    Employee emp = Employee(int.parse(_tc1.text ?? 0), _tc2.text ?? '',
        double.parse(_tc3.text ?? 0.0));
    print("Emp Data is $emp");
    var dbRef = await _db.add(emp);
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

  _listButton() {
    return Container(
      padding: EdgeInsets.only(right: 30),
      child: IconButton(
          icon: Icon(
            Icons.view_list,
            size: 50,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (cx) => EmpList()));
          }),
    );
  }

  Db _db = new Db();
  _createButton() {
    //return BuildSnackBar(addInDB);
    return ShowDailogBox(addInDB);
  }

  _createTextBox(hint, ctrl) {
    return Container(
//      decoration: BoxDecoration(
//        border: Border.all(style: BorderStyle.solid),
//        color: Colors.limeAccent
//
//      ),
      padding: EdgeInsets.all(5),

      child: TextField(
        controller: ctrl,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            // border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 24),
            hintText: hint),
      ),
    );
  }

  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.star,
          color: Colors.teal,
          size: 30,
        ),
        title: Text('Add Employee'),
        elevation: 5,
        actions: <Widget>[_listButton(), _songButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createTextBox('Type Id Here', _tc1),
            _createTextBox('Type Name Here', _tc2),
            _createTextBox('Type Salary Here', _tc3),
            _createButton()
          ],
        ),
      ),
    );
  }
}
