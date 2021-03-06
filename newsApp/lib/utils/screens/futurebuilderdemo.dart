import 'package:flutter/material.dart';

import '../server.dart';
import './news.dart';
class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  List list = [];
  getList() async {
    // List<String> list = ["Orange", "Mango", "Apple"];
    var map = await Server.callNews();
    print("Map is..... $map");

    list = map["articles"];
    print("Now List is $list");
    return list; // list is wrapped in future
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Call");
    getList();
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called....$list");
    //List<String> fruits = getList();
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Simple'),
        ),
        body: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
            if (asyncsnapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: asyncsnapshot.data.length,
              itemBuilder: (parent, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (cx) => ShowNews(title: asyncsnapshot.data[index]["title"],detail: asyncsnapshot.data[index]["content"],description: asyncsnapshot.data[index]["description"],image: asyncsnapshot.data[index]["urlToImage"],)));
                    },
                    leading: Image.network(asyncsnapshot.data[index] == null
                        ? "https://internetdevels.com/sites/default/files/public/blog_preview/404_page_cover.jpg"
                        : asyncsnapshot.data[index]["urlToImage"]),
                    title: Text(
                      asyncsnapshot.data[index] == null
                          ? ""
                          : asyncsnapshot.data[index]["title"],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
