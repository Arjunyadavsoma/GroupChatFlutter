import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier{
String userName="";
String userEmail="";
String userId="";


Map<String ,dynamic>? userData={};
var userID=FirebaseAuth.instance.currentUser;
var db=FirebaseFirestore.instance;


void getUserDetails(){
  var userID=FirebaseAuth.instance.currentUser;
  db.collection("users").doc(userID!.uid).get().then((dataSnapshot){
    userName=dataSnapshot.data()?["name"]??"";
    userEmail=dataSnapshot.data()?["email"]??"";
    userId=dataSnapshot.data()?["id"]??"";
    notifyListeners();
  });
}

}
