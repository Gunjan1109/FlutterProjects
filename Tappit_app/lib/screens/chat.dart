import 'dart:async';
import '../utils/streamSocket.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';
class Chat extends StatefulWidget {
  String customerId, orderId;
  Chat({String customerId, String orderId}){
    customerId = customerId;
    orderId = orderId;
  }
  @override
  _ChatState createState() => _ChatState();
}

class StreamSocket {

  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}



class _ChatState extends State<Chat> {

  var customerId, orderId, roomId;
  StreamSocket streamSocket =StreamSocket();
  List messages = [];
  List historyMessages = [];
  IO.Socket socket;
  final myController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  onSend(data) async{
    myController.clear();
    print(messages);
    socket.emit('sendMessage',data);
  }


  getHistory() async{
    socket.emit('get-message-history', socket.id);

    socket.on('output-messages', (messages) => historyMessages.add(messages));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Area'),
        centerTitle: true,
      ),
       body: Column(
         children: <Widget>[
           StreamBuilder(
             stream: streamSocket.getResponse,
               builder:(context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: Text(''),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                      itemBuilder: (parent,index){
                      return Container(
                        child: Text(snapshot.data[index]),
                      );
                      }
                  );
               }
           ),
           Stack(
    children: <Widget>[
    Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.75),
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
                    print("Button pressed");
                    onSend(myController.text);

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
    );
  }
}
