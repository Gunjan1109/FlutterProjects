import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './passwordscreen.dart';
import '../models/User.dart';
import '../models/db.dart';
import '../utils/Server.dart';
import 'dart:convert' as json;
import './dashboard.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User _user = User();
  Db _db = Db();
  TextEditingController _useridCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();





  String message = '';


  _createLoginButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: MaterialButton(
        elevation: 5,
        minWidth: 600,
        padding: EdgeInsets.all(10),
        onPressed: () {
           _doLogin();
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
        color: Colors.blueGrey[900],
      ),
    );
  }

  _doLogin(){
      _user.userid = _useridCtrl.text;
      _user.password = _passwordCtrl.text;

      Future future = Server.doLogin(_user);
      future.then((response) {
        var jsonString = response.body;
        var object = json.jsonDecode(jsonString);
        print(object.runtimeType);
        if (object['message'].contains('SuccessFully')){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(name: object['name']??'',address: object['address']??'',email: object['email']??'',phone: object['phone']??'',photo: object['photo']??"",role: object['roleName']??'',sub: object['subject']??'')));
          });
        }
        else{
          setState(() {
            message = "Wrong userid or password";
          });
        }
      }).catchError((){
        message = "Server side error";
      });
  }

  _doRegister() async {
    // edumaker3@gmail.com
    // qwertyuiop123@#$
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
    print("GSA is ${gsa.idToken} and ${gsa.accessToken}");
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gsa.idToken, accessToken: gsa.accessToken);
    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser user = result.user;
    
    _user.name = user.displayName;
    _user.email = user.email;
    _user.phohtoUrl = user.photoUrl;
    print("User Info ${user.displayName} ${user.email} ");
    Future future =  Server.doRegister(_user);
    future.then((response) {
      var jsonString = response.body;
      var object = json.jsonDecode(jsonString);
      print(
          ":::::: Map is ${object['message']} and Type is ${object.runtimeType}");
      if (object['message'].contains('Successful')){
       setState(() {
         Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(_user.email)));
       });
      }
      else if(object['message'].contains('Same')){
        setState(() {
          message = "Email already exists";
        });

      }
    }).catchError((err){

    });
  }

  _createStyle() {
    return TextStyle(fontSize: 20, color: Colors.black54,);
  }

  _createUserid() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _useridCtrl,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: 'UserID',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }

  _createPwd() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _passwordCtrl,
        obscureText: true,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            hintText: ' Password ',
            hintStyle: _createStyle(),
            prefixIcon: Icon(
              Icons.lock,
              size: 30,
              color: Colors.black,
            )),
      ),
    );
  }

  _createGmailButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: MaterialButton(
        elevation: 5,
        minWidth: 200,
        padding: EdgeInsets.all(10),
        onPressed: () {
           _doRegister();
        },
        child: Text(
          'Gmail Register',
          style: TextStyle(fontSize: 20,color: Colors.white,fontStyle: FontStyle.italic),
        ),
        color: Colors.red,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    const url =
        'https://leverageedu.com/blog/wp-content/uploads/2019/11/Courses-for-Commerce-Students.png';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        title: Text('Login'),
//      ),
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: <Widget>[
            Image.network(url, fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                  height: media.height * 0.50,
                  width: media.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),

                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: media.height * 0.09,

                      ),

                      SizedBox(height: 20,),
                      _createUserid(),
                      _createPwd(),
                      _createLoginButton(),
                      Text(message,style: TextStyle(fontWeight: FontWeight.w700),)


                    ],
                  ),
                ),
                _createGmailButton(),

              ],
            )
          ],

        ),
      ),
    );
  }
}




