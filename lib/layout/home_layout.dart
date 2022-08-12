import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
    );
  }
}