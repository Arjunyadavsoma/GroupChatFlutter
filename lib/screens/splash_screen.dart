// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/dashboard.dart';
// ignore: unused_import
import 'package:myapp/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
var user=FirebaseAuth.instance.currentUser;
@override
  void initState() {

   Future.delayed(Duration(seconds: 2),(){ if(user==null){
      openlogin();
    }
    else{
      openDashboard();
    }});
    super.initState();
  }



void openDashboard(){

Provider.of<UserProvider>(context,listen: false).getUserDetails();


  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return Dashboard_Screen();
  }));
}

void openlogin(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return LoginScreen();
  }));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
              
              child: Image.asset("assets/images/ic_launcher.png")),
            ),
    );
  }
}