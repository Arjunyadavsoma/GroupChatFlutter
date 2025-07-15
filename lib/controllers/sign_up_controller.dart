// ignore_for_file: empty_catches, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/screens/splash_screen.dart';
// ignore: camel_case_types
class Sign_up_controller{
 static Future<void> createaccount({required BuildContext context,required email,required String password,required String name,required String country }) async{
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    var userId =FirebaseAuth.instance.currentUser!.uid;
    var db=FirebaseFirestore.instance;
Map<String,dynamic> data={
  "name":name,
  "country":country,
  "email":email,
  "id":userId.toString()
};
try {
await db.collection("users").doc(userId.toString()).set(data);
}
catch (e){
}


Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
    return Splash_screen();
  }),(route){
    return false;
  });

    }
    catch (e){
      SnackBar message=SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }



}