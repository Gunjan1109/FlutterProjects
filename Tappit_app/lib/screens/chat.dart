import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  String customer, order,room;
  Chat({String customerId, String orderId,String roomId}){
    customer = customerId;
    order= orderId;
    room=roomId;
  }
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final myController = TextEditingController();
  //final _channel = WebSocketChannel.connect(Uri.parse("ws://3.135.249.124:8000"));
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'),
  );
  @override
  void initState() {
    // TODO: implement initState

    _channel.sink.add("Customer Id : "+widget.customer+"\nOrder Id : "+widget.order+"\nRoom Id : "+widget.room);
//   print("DATA sent");
    super.initState();

  }
  @override
  void dispose(){
    _channel.sink.close();
    super.dispose();
  }

  sendMessage(data) async{
    if(myController.text.isNotEmpty){
      print(data);
      myController.clear();
      _channel.sink.add(data);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Area'),
        centerTitle: true,
      ),
       body: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             StreamBuilder(
               stream: _channel.stream,
                 builder:(context,snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: Text(''),
                      );
                    }

                    return Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),child: Text(snapshot.data,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green)))
                      ],
                    );
//                  return ListView.builder(
//                    itemCount: snapshot.data.length,
//                      itemBuilder: (parent,index){
//                      return Container(
//                        child: Text(snapshot.data[index]),
//                      );
//                      }
//                  );
                 }
             ),
             Stack(
    children: <Widget>[
    Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.71),
          child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      sendMessage(myController.text);

                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],

              ),
          ),
      ),
    ),
    ],
    ),
    ],
         ),
       ),
    );
  }
}
