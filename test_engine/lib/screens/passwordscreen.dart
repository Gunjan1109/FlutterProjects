import 'package:flutter/material.dart';
import 'package:test_engine/utils/Server.dart';
import '../models/User.dart';
import 'dart:convert' as json;
import './credentials.dart';
class ChangePassword extends StatefulWidget {
  String email;
  String password;
  ChangePassword(this.email);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController _pwdCtrl = TextEditingController();
  User _user = User();
  _validateTxt(String val) {
    if (val.isEmpty) {
      return "Password cannot remain empty";
    }
    if (val.length < 6) {
      return "Password length must be minimum of 6 characters";
    }
    return null;
  }

  _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
          _doChangePassword();
      });
    }
  }

  _doChangePassword(){
    widget.password = _pwdCtrl.text;
    _user.password = widget.password;
    _user.email = widget.email;

    print("User Info ${_user.password} ${_user.email} ");
    Future future = Server.doChangePassword(_user);

    future.then((response){
      var jsonString = response.body;
      var object = json.jsonDecode(jsonString);
      print(
          ":::::: Map is ${object['message']} and Type is ${object.runtimeType}");
      if (object['message'].contains('Successful')){
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => cred(_user.email,_user.password)));
        });
      }
    }).catchError((err){
      print("Server side error");
    });
  }

  _createUpdateButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: MaterialButton(
        elevation: 5,
        minWidth: 600,
        padding: EdgeInsets.all(10),
        onPressed: () {
          _submitForm();
        },
        child: Text(
          'UPDATE',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        color: Colors.blueGrey[900],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;

    const url =
        'https://leverageedu.com/blog/wp-content/uploads/2019/11/Courses-for-Commerce-Students.png';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//
      body: SafeArea(
        child: Stack(

          children: <Widget>[
            Image.network(url, fit: BoxFit.cover),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//
                Container(

                  height: media.height * 0.40,
                  width: media.width * 0.95,


                  decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),


                  child: Form(
                    key: _formKey,
                    child: ListView(

                      padding: EdgeInsets.all(10),
                      children: <Widget>[

                        SizedBox(
                          height: media.height * 0.01,
                        ),

                        Text(
                          'CHANGE PASSWORD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),

                        ),
                        SizedBox(
                          height: media.height * 0.02,


                        ),
                        TextFormField(
                          onSaved: (value) {
                            widget.password = value;
                          },
                          validator: (String val) {
                            return _validateTxt(val);
                          },
                          keyboardType: TextInputType.text,
                          controller: _pwdCtrl,
                          decoration: InputDecoration(
                              labelText: "ENTER PASSWORD",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange))),
                        ),


                        SizedBox(
                          height: 17,
                        ),


                        _createUpdateButton(),


                      ],
                    ),
                  ),
                )
              ],
            )
          ],

        ),
      ),
    );
  }
}