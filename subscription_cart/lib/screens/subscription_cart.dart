import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  DateTime currentdate = DateTime.now();
  DateTime choosedDate;
  int quantity = 0;
  List values = [10,20,30];
  int selection = 0;
  var prefs;
  bool _mondayPressed = false;
  bool tuesdayPressed = false;
  bool wednesdayPressed = false;
  bool thrusdayPressed=false;
  bool fridayPressed=false;
  bool saturdayPressed=false;
  bool sundayPressed = false;

  selectDate(context) async{
      final DateTime pickedDate = await showDatePicker(
          context: context,
          initialDate: currentdate,
          firstDate: currentdate,
          lastDate: DateTime(2050)
      );
      if(pickedDate != null && pickedDate != currentdate){
        setState(() {
            choosedDate = pickedDate;
        });
      }
  }
  getSharedInstance() async{
     prefs = await SharedPreferences.getInstance();
  }
  @override
  void initState() {
    // TODO: implement initState
    getSharedInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Subscription',style: TextStyle(color: Colors.black),),
          leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.lightBlue,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://images-na.ssl-images-amazon.com/images/I/61X5N08zQgL._SX522_.jpg"),
                      radius: MediaQuery.of(context).size.width * 0.12,

                    ),
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20,bottom: 10,left: 20),child: Text("Tata Tea Gold(1kg)",style: TextStyle(fontSize: 20),)),
                      Padding(padding: EdgeInsets.only(bottom: 15),child: Text("Rs531",style: TextStyle(fontSize: 20),))
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Quantity'),
              subtitle: Text('per day'),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      child: FloatingActionButton(
                          child: Icon(Icons.remove),
                          backgroundColor: Colors.lightBlue,
                          onPressed: (){
                            if(quantity > 0) {
                              setState(() {
                                quantity = quantity - 1;
                              });
                            }
                          }
                      ),
                    ),
                    Text('$quantity'),
                    Container(
                      height: 30,
                      child: FloatingActionButton(
                          child: Icon(Icons.add),
                          backgroundColor: Colors.lightBlue,
                          onPressed: (){
                              setState(() {
                                quantity++;

                              });
                          }
                      ),
                    ),
                  ],
                ),
              ),

            ),
            Divider(),
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Column(
                children: <Widget> [
                  Padding(padding: EdgeInsets.only(left: 20),child: Align(alignment: Alignment.topLeft,child: Text('Repeat DAILY'))),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                    children: [
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: _mondayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('M',style: TextStyle(color: _mondayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              _mondayPressed = !_mondayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,

                        child: FloatingActionButton(
                          backgroundColor: tuesdayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('T',style: TextStyle(color: tuesdayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              tuesdayPressed = !tuesdayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: wednesdayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('W',style: TextStyle(color: wednesdayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              wednesdayPressed = !wednesdayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: thrusdayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('T',style: TextStyle(color: thrusdayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              thrusdayPressed = !thrusdayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: fridayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('F',style: TextStyle(color: fridayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              fridayPressed = !fridayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: saturdayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('S',style: TextStyle(color: saturdayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              saturdayPressed = !saturdayPressed;
                            });

                          },
                        ),
                      ),
                      Container(
                        height: 40,
                        child: FloatingActionButton(
                          backgroundColor: sundayPressed ? Colors.lightBlue : Colors.white,
                          child: Text('S',style: TextStyle(color: saturdayPressed ? Colors.white : Colors.lightBlue),),
                          onPressed: (){
                            setState(() {
                              sundayPressed = !sundayPressed;
                            });

                          },
                        ),
                      )
                    ],
                ),
                  ),
        ],
              ),
            ),
            Divider(),
            ListTile(
                onTap: (){

                },
                leading: Icon(Icons.restore),
                title: PopupMenuButton(
                  onSelected: (result){
                    setState(() {
                      selection = result;
                    });

                  },
                  child: Text('Recharge/Top up'),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: values[0],child: Text('10')),
                    PopupMenuItem(value: values[1],child: Text('20')),
                    PopupMenuItem(value: values[2],child: Text('30')),
                  ],
                ),
                subtitle: PopupMenuButton(
                  onSelected: (result){
                    setState(() {
                      selection = result;
                    });

                  },
                  child: Text('$selection Deliveries'),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: values[0],child: Text('10')),
                    PopupMenuItem(value: values[1],child: Text('20')),
                    PopupMenuItem(value: values[2],child: Text('30')),
                  ],
                ),

              ),

            Divider(),
            ListTile(
              onTap: (){
                  selectDate(context);
              },
              leading: Icon(Icons.calendar_today),
              title: Text('Start Date'),
              subtitle: Text('$choosedDate'),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Row(
                  children: [
                    ElevatedButton(
                      style : ElevatedButton.styleFrom(primary: Colors.white,padding: EdgeInsets.all(20),side: BorderSide(color: Colors.lightBlue,)),
                        onPressed: (){

                        },
                        child: Text('DELIVER ONCE', style: TextStyle(color: Colors.lightBlue),)

                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ElevatedButton(

                          style : ElevatedButton.styleFrom(primary: Colors.lightBlue,padding: EdgeInsets.only(top: 20,bottom: 20,left: 50,right: 50)),
                          onPressed: (){
                            var orderValue = 531*quantity*selection;
                            prefs.setInt('quantity',quantity);
                            prefs.setInt('recharge',selection);
                            prefs.setString('date',choosedDate.toString());
                            print(orderValue);
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return AlertDialog(
                                      title: Text("Order Value"),
                                      content: Text('$orderValue'),
                                      actions: [
                                        TextButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'))
                                      ],
                                    );
                                  }
                              );
                          },
                          child: Text('SUBSCRIBE', style: TextStyle(color: Colors.white))
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


