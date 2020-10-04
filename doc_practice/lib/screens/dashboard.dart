import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../models/myModel.dart';
import '../models/user.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
enum options {primary, secondary, high, graduate}
class _DashboardState extends State<Dashboard> {
  static bool _isLiked = true;
  static int _likes = 41;
  String defaultValue = 'One';
  options _selection;
  @override

   _toggleFavorite(){

  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      //mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Oeschein lake Campground',style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Kandsterg, Switerland',style: TextStyle(color: Colors.black26,fontSize: 10),),
              )
            ],
          ),
        ),

        IconButton(
          icon: (_isLiked ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.orange[500],
          onPressed: (){
//            setState(() {
//              if(_isLiked == false){
//                _isLiked = true;
//                _likes = _likes + 1;
//              }
//              else{
//                _isLiked = false;
//                _likes = _likes - 1;
//              }
//            });
          }
        ),
        Text('$_likes')
      ],
    ),
  );

//  Column _buildButton(Color color , String text, IconData icon){
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Icon(icon, color: color,),
//        Container(
//          padding: const EdgeInsets.only(top: 8),
//          child: Text(
//            text,
//            style: TextStyle(color: color),
//          ),
//        )
//      ],
//    );
//  }
  
  Widget buttonBuilder = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
    Column(
    mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.call, color: Colors.blue,),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Call',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.near_me, color: Colors.blue,),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Route',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    ),
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.share, color: Colors.blue,),
        Container(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Share',
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    )
      ],
    ),
  );

  Widget buttonUser = Container(
      child: RaisedButton(
        child: Text('Click'),
        onPressed: (){
          User _user;
          Consumer<MyModel>(
            builder: (context,myModel,child){
               _user = User(myModel.name,myModel.email);
            },
          );
         // Map userMap = jsonDecode(_user);
        },
        color: Colors.purple[400],
      ),
  );

  Widget description = Container(
    padding:const EdgeInsets.all(32),
    child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,),
  );
  
  Widget imageSection = Container(
    child: Image.network("https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg",height: 240,width: 600,fit: BoxFit.cover,),
  );
  Widget build(BuildContext context) {
    var provider = Provider.of<MyModel>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Practice'),
          leading: Icon(Icons.home),
          actions: <Widget>[
            Consumer<MyModel>(
              builder: (context,myModel,child){
              return IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: (){
                  myModel.onClick();
                },
      );
      }
              ),

          ],
        ),
//      body: GestureDetector(
//        onVerticalDragDown: (covariant){
//          print("Drag down ");
//        },
//        onTap: (){
//          print("Button was tapped");
//        },
//      ),

//    body: Container(
//      child: Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//              Icon(Icons.star, color: Colors.yellow[300],),
//            Icon(Icons.star, color: Colors.yellow[300],),
//            Icon(Icons.star, color: Colors.yellow[300],),
//            Icon(Icons.star),
//            Icon(Icons.star),

//            child : Stack(
//              alignment: Alignment(0.6,0.6),
//              children: <Widget>[
//                CircleAvatar(
//                  child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 100,maxWidth: 200,minHeight: 100) ,child: Image.network("https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg")),
//                  radius: 100
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.black45,
//                  ),
//                  child: Text('Nature'),
//                )
//              ],
//            )
//         ],
//        ),
//      ),
//    ),

      body: ListView(
        children: <Widget>[
          imageSection,
            titleSection,
          buttonBuilder,
          description,
          Container(
            color: Colors.orange[600],
            child: Consumer<MyModel>(
              builder: (context,myModel,child){
                return Text(myModel.value);
              },
            )
          ),
          buttonUser,
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: DropdownButton<String>(
              value: defaultValue,
              icon: Icon(Icons.keyboard_arrow_down),
              underline: Container(
                height: 2,
                color: Colors.orange[900],
              ),
              onChanged: (String value){
                setState(() {
                  defaultValue = value;
                });
              },

              items: <String>['One','Two','Three','Four'].map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            child: PopupMenuButton(
              onSelected: (options result){
                setState(() {
                  _selection = result;
                });
              },
              itemBuilder: (BuildContext context){
                return <PopupMenuEntry<options>>[
                  const PopupMenuItem(value: options.primary,child: Text('Studying in Primary')),
                  const PopupMenuItem(value: options.secondary ,child: Text('Studying in Secondary')),
                  const PopupMenuItem(value: options.high ,child: Text('Studying in High School')),
                  const PopupMenuItem(value: options.graduate ,child: Text('Studying in Graduation'))

                ];
              },
              //color: Colors.blue[300],
              icon: Icon(Icons.menu),
              //child: Text('$_selection'),
            ),
          ),
          Container(
            child: CheckboxListTile(

            ),
          )
        ],
      ),
      );

  }
}


