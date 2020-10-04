import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:testengine/Add%20Question.dart';
//import './Create Test.dart';
//import './Add Question.dart';
//import 'editprofile.dart';
//import 'createtest.dart';
//import 'AddQuestion.dart';
//import 'groupcreate.dart';
import 'assigntest.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
  String name,photo,rolename,subject,email,address,phone;
  Dashboard({String name,String photo,String role,String sub,String email,String address,String phone}){
    this.name = name;
    this.phone = phone;
    this.photo = photo;
    this.subject = sub;
    this.address = address;
    this.rolename = role;
    this.email = email;
  }
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  Icon cusIcon = Icon(Icons.search);

  Widget cusSearchBar = Text("Dashboard");


  _createDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var mediaQuery = MediaQuery.of(context).size;
      
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(hintText: "Search Here"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Dashboard");
                }
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.network(
                  widget.photo),
              //Image.network('https://www.desktopbackground.org/p/2014/06/28/784987_dark-demon-jin-devil-video-games-tekken-hd-desktop-wallpapers_800x600_h.jpg'),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: media.height * 0.01,
            ),
            ListTile(
              title: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () => debugPrint("test create selceted"),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            ListTile(
              title: Text(
                widget.rolename,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => debugPrint("Test Wise Score selceted"),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            ListTile(
              title: Text(
                'Subject : ' + widget.subject,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => debugPrint("question create selcted"),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            ListTile(
              title: Text(
                "PNo. " + widget.phone,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => debugPrint("groupe create selceted"),
            ),
            SizedBox(
              height: media.height * 0.02,
            ),
            ListTile(
              title: Text(
                widget.address,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => debugPrint("tset assign selceted"),
            ),

            SizedBox(
              height: media.height * 0.17,
            ),
            GestureDetector(
                child: Text("EDIT PROFILE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontStyle: FontStyle.italic)),
//                onTap: () {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => edit()));
//                }
                )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      key: key,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: <Widget>[
            SizedBox(
              height: mediaQuery.height * 0.03,
            ),
            Center(
              child: Container(
                width: mediaQuery.width * 0.95,
                height: mediaQuery.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.lightBlueAccent.shade100),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: CircleAvatar(
                        child: Image.network("https://cdn.iconscout.com/icon/free/png-256/laptop-user-1-1179329.png"),
                        maxRadius: mediaQuery.width * 0.09,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.rolename,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            width: mediaQuery.width * 0.35,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                                border: Border.all(color: Colors.black38)),
                            child: Text('25 Test Assigned'),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            width: mediaQuery.width * 0.35,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                                border: Border.all(color: Colors.black38)),
                            child: Text('40 Teammates'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: media.height * 0.08,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('HELLO,',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                ),
                Container(
                  child: Text(widget.name +'!',
                      style:
                      TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10),
                        width: mediaQuery.width * 0.44,
                        height: mediaQuery.height * 0.15,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.orange.shade400,
                        ),
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: InkWell(
                                  child: new Text('Test create',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      )),
//                                  onTap: () {
//                                    Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: (context) =>
//                                                createTest()));
//                                  }
                                  ),
                            ),
                            new Positioned(
                              right: 0.0,
                              bottom: 95,
                              child: new Icon(Icons.class_),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        width: mediaQuery.width * 0.44,
                        height: mediaQuery.height * 0.15,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.lightGreen.shade400,
                        ),
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: InkWell(
                                  child: new Text('Question create',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      )),
//                                  onTap: () {
//                                    Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: (context) =>
//                                                addQuestion()));
//                                  }
                                  ),
                            ),
                            new Positioned(
                              right: 0.0,
                              bottom: 95,
                              child: new Icon(Icons.question_answer),
                            ),
                          ],
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10),
                        width: mediaQuery.width * 0.44,
                        height: mediaQuery.height * 0.15,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.purple.shade300,
                        ),
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: InkWell(
                                  child: new Text('Group create',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      )),
//                                  onTap: () {
//                                    Navigator.push(
//                                        context,
//                                        MaterialPageRoute(
//                                            builder: (context) =>
//                                                grp()));
//                                  }
                                  ),
                            ),
                            new Positioned(
                              right: 0.0,
                              bottom: 95,
                              child: new Icon(Icons.group_add),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        width: mediaQuery.width * 0.44,
                        height: mediaQuery.height * 0.15,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.red.shade300,
                        ),
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                              left: 0.0,
                              bottom: 0.0,
                              child: InkWell(
                                  child: new Text('Test assign',
                                      style: new TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      )),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Assign(widget.name??'')));
                                  }
                                  ),
                            ),
                            new Positioned(
                              right: 0.0,
                              bottom: 95,
                              child: new Icon(Icons.person),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  height: media.height * 0.07,
                ),
                Container(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text('Recently added tests and questions',
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                ),
              ],
            ),
            Center(
              child: Container(
                  height: mediaQuery.height * 0.15,
                  width: mediaQuery.width * 0.88,
                  margin: EdgeInsets.all(mediaQuery.width * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.lightBlueAccent,
                  ),
                  child: new Stack(
                    children: <Widget>[
                      SizedBox(
                        height: media.height * 0.04,
                      ),
                      new Positioned(
                        left: 20,
                        bottom: 95,
                        child: new Text('View added tests',
                            style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                      new Positioned(
                        right: 15,
                        bottom: 95,
                        child: new Icon(Icons.library_books),
                      ),
                      new Positioned(
                        left: 20,
                        bottom: 20,
                        child: new Text('View questions added',
                            style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                      new Positioned(
                        right: 15,
                        bottom: 22,
                        child: new Icon(Icons.question_answer),
                      ),
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }
}