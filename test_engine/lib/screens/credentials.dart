import 'package:flutter/material.dart';
import 'package:test_engine/screens/register.dart';
import 'package:test_engine/utils/Server.dart';
import '../models/User.dart';
import 'dart:convert' as json;
import './dashboard.dart';

class cred extends StatefulWidget {
  @override
  _credState createState() => _credState();
  String email;
  String password;
  cred(this.email,this.password);
}

class _credState extends State<cred> {
  TextEditingController _idCtrl = TextEditingController();
  TextEditingController _subjectCtrl = TextEditingController();
  TextEditingController _PNCtrl = TextEditingController();
  TextEditingController _addressCtrl = TextEditingController();
  User _user = User();
  _createStyle() {
    return TextStyle(fontSize: 17, color: Colors.black54,);
  }

  _createid() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _idCtrl,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: 'User-ID',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }

  _createsubject() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _subjectCtrl,

        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: 'Subject ',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.account_balance_wallet,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }


  _createPN() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _PNCtrl,

        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: ' Phone Number ',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.phone,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }


  _createaddress() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _addressCtrl,

        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: 'Address',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.account_balance,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }



  String message = '';

  _createButton() {
    return Container(

      padding: EdgeInsets.all(15),
      child: MaterialButton(
        elevation: 5,
        minWidth: 600,
        padding: EdgeInsets.all(10),
        onPressed: () {
           _doCredentialsCall();
        },
        child: Text(
          'UPDATE',
          style: TextStyle(fontSize: 23,color: Colors.white),
        ),
        color: Colors.blueGrey[900],
      ),
    );
  }

  _doCredentialsCall(){
    _user.email = widget.email;
    _user.userid = _idCtrl.text;
    _user.address = _addressCtrl.text;
    _user.phone = _PNCtrl.text;
    _user.subject = _subjectCtrl.text;

    Future future = Server.doCredentials(_user);
    future.then((response) {
      var jsonString = response.body;
      var object = json.jsonDecode(jsonString);
      print(
          ":::::: Map is ${object['message']} and Type is ${object.runtimeType}");
      if (object['message'].contains('Successful')){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

        });
      }
      else if(object['message'].contains('Same')){
        setState(() {
          message = "Userid alredy exist. Try another";
        });
      }

    }).catchError((err){
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


                  height: media.height * 0.89,
                  width: media.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),

                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: media.height * 0.26,

                      ),

                      Text(
                        ' Enter Credentials',
                        style: TextStyle(
                          fontSize: 25,  color: Colors.black,),
                      ),
                      SizedBox(
                        height:media.height * 0.02,
                      ),
                      _createid(),
                      _createPN(),
                      _createsubject(),
                      _createaddress(),
                      SizedBox(
                        height:media.height * 0.025,
                      ),
                      Text(message,style: TextStyle(fontWeight: FontWeight.w700),),
                      _createButton(),

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