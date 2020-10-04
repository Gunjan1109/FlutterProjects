import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:test_engine/utils/Server.dart';

class Assign extends StatefulWidget {
  @override
  _AssignState createState() => _AssignState();
  String name;
  Assign(this.name);

}

class _AssignState extends State<Assign> {
  TextEditingController _groupCtrl = TextEditingController();
  TextEditingController _testCtrl = TextEditingController();
  TextEditingController _studentCtrl = TextEditingController();
  String _assignto,message="";

  List<String> getassignto() {
    return [
      "Group",
      "Student",

    ];
  }
  _createStyle() {
    return TextStyle(fontSize: 17, color: Colors.black54,);
  }

  _createfn() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _groupCtrl,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: ' Group Name',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.group,
              size: 23,
              color: Colors.black,
            )),
      ),
    );
  }
  _createfn2() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _studentCtrl,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: ' Student Name/ID',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.person,
              size: 23,
              color: Colors.black,
            )),
      ),
    );
  }
  _createln() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _testCtrl,
        obscureText: false,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: 'Test Name ',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.assignment,
              size: 23,
              color: Colors.black,
            )),
      ),
    );
  }
  _createAssignButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: MaterialButton(
        elevation: 5,
        minWidth: 600,
        padding: EdgeInsets.all(10),
        onPressed: () {
            _doAssignTest();
        },
        child: Text(
          'Assign',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
        color: Colors.blueGrey[900],
      ),
    );
  }

  _doAssignTest(){
    String gname = _groupCtrl.text;
    String tname = _testCtrl.text;

    if(gname.contains(" ")){
      gname.replaceAll(" ", "%20");
    }
    if(tname.contains(" ")){
      tname.replaceAll(" ", "%20");
    }

    Future future = Server.doAssignTest(gname, tname);
    future.then((response) {
      var jsonString = response.body;
      var object = json.jsonDecode(jsonString);
      print(object.runtimeType);
      if (object['message'].contains('Successfully')){
        setState(() {
          message = "Test assigned to group";
        });
      }
      else if(object['message'].contains('Group is not present')) {
        setState(() {
          message = object['message'];
        });
      }
        else if(object['message'].contains('Test is not present')){
          setState(() {
            message = object['message'];
          });
      }

    }).catchError((){
      message = "Server side error";
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    const url =
        'https://leverageedu.com/blog/wp-content/uploads/2019/11/Courses-for-Commerce-Students.png';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(


        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            Image.network(url, fit: BoxFit.cover),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: media.height * 0.85,
                  width: media.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),

                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: media.height * 0.20,

                      ),
//
                      Text(
                        'Assign Test',
                        style: TextStyle(
                          fontSize: 30,  color: Colors.black,),
                      ),
                      SizedBox(
                        height: media.height * 0.01,

                      ),
                      DropdownButtonFormField<String>(
                        onChanged: (String val) {
                          setState(() {
                            _assignto = val;
                          });
                        },
                        value: _assignto,
                        onSaved: (String val) {
                          _assignto = val;
                        },
                        isExpanded: true,
                        items: getassignto().map((name) {
                          return DropdownMenuItem<String>(
                            value: name,
                            child: Text(
                              name,
                              style: TextStyle(fontSize: 15,color: Colors.black),
                            ),
                          );
                        }).toList(),

                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(

                            hintText: 'Assign To ',
                            hintStyle: _createStyle(),
                            prefixIcon: Icon(
                              Icons.arrow_drop_down_circle,
                              size: 23,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        height: media.height * 0.015,

                      ),
                      _createfn(),
                      _createfn2(),
                      _createln(),
                      SizedBox(
                        height: media.height * 0.01,

                      ),
                      Text(message , style: TextStyle(fontWeight: FontWeight.w700),),
                      _createAssignButton(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}