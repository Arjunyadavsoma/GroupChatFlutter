// ignore_for_file: unused_import
import 'package:myapp/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/splash_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context){
      return UserProvider();
    },
    child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: ("Poppins"),
      ),
      home:Splash_screen()
    );
  }
}