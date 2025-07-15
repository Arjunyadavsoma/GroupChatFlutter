// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';


class profile_data extends StatefulWidget {
  const profile_data({super.key});

  @override
  State<profile_data> createState() => _profile_dataState();
}

class _profile_dataState extends State<profile_data> {

  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<UserProvider>(context);
    
     return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),

      ),
      body: Container(
        width: double.infinity,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50,child: Text(userProvider.userName[0]),),
            SizedBox(height: 8,),
            Text(userProvider.userName,style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(userProvider.userEmail),
SizedBox(height: 8,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return EditProfileScreen();
              }));

            }, child: Text("Edit Profile"))
          ],
        ),
      ),
    );
  }
}