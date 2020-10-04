import 'package:cloud_firestore/cloud_firestore.dart';
import './User.dart';
class Db{
  final dbRef = Firestore.instance;

// Future<String> addUser(User user) async{
//  var documentRef =await dbRef.collection('Users').add(user.toMap());
//  var documentpath = documentRef.path.substring(6);
//  print(documentpath);
//  return documentpath;
//  }

  update(ref,password) async{
    dbRef.collection("Users").document(ref.toString()).updateData({"password" : password});
  }

  Future<DocumentReference> getData(ref) async{
   var document = await dbRef.collection("Users").document(ref);
   return document;
  }
}