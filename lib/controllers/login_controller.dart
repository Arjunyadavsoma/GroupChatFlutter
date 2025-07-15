// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/splash_screen.dart';

// ignore: camel_case_types
class Login_controller{
 static Future<void> loginAccount({required BuildContext context,required email,required String password})async{
    try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);


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
