import 'package:flutter/material.dart';
import 'Button.dart';
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  String _expression1 = ' ';
  String _expression2 = ' ';
  String _operator;
  double _result;
  int check;
  bool _flag = false;
  void getExpression(String str,String value){
    setState(() {
      if((value == '1')||(value == '2')||(value == '3')||(value == '4')||(value == '5')||(value == '6')||(value == '7')||(value == '8')||(value == '9')||(value == '0') ){
        if(_flag == false)
        _expression1 += value;
        else
          _expression2 += value;

      }
      if((value == '+') || (value == '-') || (value == 'x') || (value == '/')){
        _operator = value;
        _flag = true;
      }
      if(value == '+')
        check = 1;
      else if(value == '-')
        check = 2;
      else if(value == 'x')
        check = 3;
      else if(value == '/')
        check = 4;

      if(value == '='){
        calculateResult();
      }
      if(value == 'C'){
        _expression1 = ' ';
        _expression2 = ' ';
        _operator = ' ';
        _result = 0;
        _flag = false;
      }
    });

  }

  void calculateResult(){
    double expression1 = double.parse(_expression1);
    double expression2 = double.parse(_expression2);
    setState(() {

    if(check == 1){
      _result = expression1 + expression2;
    }
    else if(check == 2)
      _result = expression1 - expression2;
    else if(check == 3)
      _result = expression1 * expression2;
    else if(check == 4)
      _result = expression1 / expression2;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator' , style: TextStyle(fontSize: 25))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Button(num: '7',fn: getExpression,),Button(num: '8', fn: getExpression,),Button(num:'9' , fn: getExpression)
              ],
            ),
            Row(
              children: <Widget>[
                Button(num: '4',fn: getExpression,),Button(num: '5', fn: getExpression,),Button(num: '6', fn: getExpression)
              ],
            ),
            Row(
              children: <Widget>[
                Button(num: '1',fn: getExpression),Button(num: '2', fn: getExpression,),Button(num: '3', fn: getExpression,)
              ],
            ),
            Row(
              children: <Widget>[
                Button(num: '+', fn: getExpression,),Button(num: '-', fn: getExpression,),Button(num: '=', fn: getExpression)
              ],
            ),
            Row(
              children: <Widget>[
                Button(num: 'x', fn: getExpression,),Button(num: '/', fn: getExpression,),Button(num: 'C', fn: getExpression,)
              ],
            ),
            Row(
              children: <Widget>[
                Text('${_expression1??' '} ',style: TextStyle(fontSize: 20)),
                Text('${_operator??' '}', style: TextStyle(fontSize: 20)),
                Text('${_expression2??' '}', style: TextStyle(fontSize: 20))
              ],
            ),
            Row(
              children: <Widget>[
                Text('${_result??' '}', style: TextStyle(fontSize: 30))
              ],
            )
          ],
        ),
      ),
    );
  }
}
