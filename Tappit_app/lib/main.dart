import 'package:flutter/material.dart';
import './screens/showticket.dart';
import './screens/chat.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
void main(){
  StreamSocket streamSocket = StreamSocket();
  void connectAndListen(){
   IO.Socket socket = IO.io("http://3.135.249.124:8000");
    socket.onConnect((data) {
      print("Connect");
      socket.emit("joinchat",'Message sent');
    });

    socket.on('message',(message) => streamSocket.addResponse);
  }
  runApp(MaterialApp(
      title: "Tappit",
    debugShowCheckedModeBanner: false,
    home: Ticket(),
  ));
}