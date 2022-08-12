import 'package:flutter/material.dart';
import 'package:test_todo_app/layout/home_layout.dart';
import 'package:test_todo_app/shared/styles/my_Theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.routeName,
      routes:{ Home.routeName :(context) => Home()},
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
    
    );
  }
}

