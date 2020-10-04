import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/db.dart';
import './empInfo.dart';
import '../screens/update.dart';
class EmpList extends StatefulWidget {
  @override
  _EmpListState createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  @override
  Db db = Db();

//  getList() async{
//
//      var data = await db.read();
//    //data.forEach((String , dynamic) => list.add(data(String , dynamic)));
//  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body:
//        child: RaisedButton(
//          child: Text('Click'),
//          onPressed: (){
//            getList();
//          },
//        ),
//        child: FutureBuilder(
//          future: getList(),
//            builder: (BuildContext context, AsyncSnapshot asyncsnapshot){
//              if (asyncsnapshot.data == null) {
//                return Center(
//                  child: Text(' '),
//                );
//              }
//
//              return
//                  Expanded(
//                      child: ListView.builder(
//                          itemCount: asyncsnapshot.data.length,
//                          itemBuilder: (parent , index){
//                              return Card(
//                                elevation: 3,
//                                child: ListTile(
//                                    title: Text(
//                                      asyncsnapshot.data[index] == null
//                                          ? "" :asyncsnapshot.data[index]["name"],
////                                      style: TextStyle(fontSize: 15),
//                                    ),
//                                ),
//                              );
//                          },
//                      ),
//                  );
//            }
//        ),
      StreamBuilder(
          stream: Firestore.instance.collection("emps").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Text('Loading data...Please wait..');
            return ListView.builder(

                itemCount: snapshot.data.documents.length,
                itemBuilder: (parent, index) {
                  return Card(
                    elevation: 6,
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (cx) => Update(index)));
                        },
                      ),
                      onTap: (){
//                        print(snapshot.data.documents[index].runtimeType);
//                        print(snapshot.data.documents[index]["name"].runtimeType);

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (cx) => EmpInfo(index)));
                      },
                      title: Text(
                          snapshot.data.documents[index]["name"]


                      ),
                    ),
                  );
                },
              );

          }
      ),
    );
  }
}