import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode initTheme = ThemeMode.light;

  void changeThiming(ThemeMode theme){

    initTheme = theme ;

    notifyListeners();

  }
}