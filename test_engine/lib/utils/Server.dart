import 'dart:convert' as json;
import 'dart:io';

import 'package:http/http.dart' as http;
import "../models/User.dart";
import './UrlConstants.dart';
class Server{
  static doRegister(User user) async{
    print("NOW JSON STRING IS ${user.toMapRegister()}");
    var jsonString = json.jsonEncode(user.toMapRegister());
    print("JSON String is $jsonString");
    var map = await http.post(UrlConstants.REGISTER_URL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonString);
    print('After Server Call');
    print(map.body);
    //print(map[]);
    return map;
  }

  static doLogin(User user) async {
    print("Now JSON string is ${user.toMapPassword()}");
    var jsonString = json.jsonEncode(user.toMapPassword());
    print("JSON String is $jsonString");
    var map = await http.post(UrlConstants.LOGIN_URL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
    body: jsonString);
    print("After server call");
    print(map.body);
    return map;
  }

  static doChangePassword(User user) async{
    print("Now JSON string is ${user.toMapChangePassword()}");
    var jsonString = json.jsonEncode(user.toMapChangePassword());
    print("JSON String is $jsonString");
    var map = await http.post(UrlConstants.CHANGEPASSWORD_URL,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    body: jsonString);
    print("After server call");
    print(map.body);
    return map;
  }

  static doCredentials(User user) async{
    print("Now JSON string is ${user.toMapCredentials()}");
    var jsonString = json.jsonEncode(user.toMapCredentials());
    print("JSON String is $jsonString");

    var map = await http.post(UrlConstants.SETCREDENTIALS_URL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonString);
    print("After server call");
    print(map.body);
    return map;
  }
  
  static doAssignTest(String gname , String tname) async {
    var map = await http.post("http://192.168.43.100:8080/testengine/grouptestmapping?groupName=$gname&testName=$tname",
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    print("After server call");
    print(map.body);
    return map;
  }
}