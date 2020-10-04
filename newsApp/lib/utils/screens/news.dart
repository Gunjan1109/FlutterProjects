import 'package:flutter/material.dart';
class ShowNews extends StatelessWidget {
  @override
  String _title,_content,_description;
  String _image;
  ShowNews({String title,String detail,String description,String image}){
    this._title = title;
    this._content = detail;
    this._description = description;
    this._image = image;
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('News'),

      ),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Text(
                _title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              _description,
              style: TextStyle(fontSize: 15 , color: Colors.grey),

            ),
            SizedBox(height: 15,),
            Image.network(_image),
            SizedBox(height: 15,),
            Text(
              _content,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
