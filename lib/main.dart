import 'package:flutter/material.dart';
import 'package:test_todo_app/layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      routes:{ Home.routeName :(context) => Home()},
    
    );
  }
}

