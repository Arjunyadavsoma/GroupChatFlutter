// ignore_for_file: camel_case_types, unused_import, empty_statements, avoid_unnecessary_containers, use_build_context_synchronously

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/screens/chatroom_screen.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({super.key});

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  var userID=FirebaseAuth.instance.currentUser;
var db=FirebaseFirestore.instance;

List<Map<String,dynamic>> chatroomsList=[];

List<String> chatroomsIds=[];

void getChatRooms()async{
await db.collection("Chatrooms").get().then((dataSnapshot){
  
  chatroomsList.clear();
for(var singledata in dataSnapshot.docs){
  chatroomsList.add(singledata.data());
  chatroomsIds.add(singledata.id.toString());
}
setState(() {
  
});


});

  }



@override
  void initState() {
    getChatRooms();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    
var userprovider=Provider.of<UserProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      drawer: Drawer(child: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            ListTile(
              leading: CircleAvatar(child: Text(userprovider.userName[0]),),
              title:Text(userprovider.userName),
              subtitle: Text(userprovider.userEmail),
            ),
            SizedBox(height: 20,),
            ListTile(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return profile_data();
                }), );
              } ,
             leading: Icon(Icons.man),
             title: Text("Profile"),
            ), SizedBox(height: 5,),
            ListTile(
              onTap:()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  return Splash_screen();
                }), (route){
                  return false;
                }); (route){
return false;
                };
              } ,
             leading: Icon(Icons.logout),
             title: Text("Logout"),
            ),
            
          ],
        ),
      ),),
      body:
      ListView.builder(
  itemCount: chatroomsList.length,
  itemBuilder: (BuildContext context, int index) {
    final data = chatroomsList[index];
    final name = data["chatroom_name"] ?? data["Chatroom_name"] ?? "Unnamed";
    final desc = data["desc"] ?? "";
    return Card(
      child: ListTile(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatroomScreen(chatroomName: name,chatroomId:chatroomsIds[index],);
        }), );
      },
        leading: CircleAvatar(child: Text(name[0]),),
        title: Text(name),
        subtitle: Text(desc),
      ),
    );
  },
)


      
    
    );
  }
}