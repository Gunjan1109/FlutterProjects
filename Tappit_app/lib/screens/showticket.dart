import 'package:flutter/material.dart';
import 'package:tappit_app/screens/chat.dart';
import '../api/server.dart';
class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTickets();
  }

  getTickets() async{
      var list = await Server.getTickets();
      return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tappit Tickets'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getTickets(),
          builder: (BuildContext builder, AsyncSnapshot asyncsnapshot){
              if(asyncsnapshot.data == null){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: asyncsnapshot.data.length,
                  itemBuilder: (parent,index){
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (cx) => Chat(customerId: asyncsnapshot.data[index]['customerId'],orderId: asyncsnapshot.data[index]['orderId'],)));
                      },
                      leading: Image.network(asyncsnapshot.data[index]['snapshot'].contains('https')
                          ? asyncsnapshot.data[index]['snapshot'] : "https://internetdevels.com/sites/default/files/public/blog_preview/404_page_cover.jpg"),
                      title: Text(asyncsnapshot.data[index]['subject']),
                      subtitle: Text(asyncsnapshot.data[index]['ticketId']),
                    ),
                  );

                  }
              );

          },

        ),

    );
  }
}
