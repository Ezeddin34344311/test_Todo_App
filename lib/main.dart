import 'package:flutter/material.dart';
import 'package:test_todo_app/layout/home_layout.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      routes:{ Home.routeName :(context) => Home()},
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
    debugShowCheckedModeBanner: false,
    );
  }
}

