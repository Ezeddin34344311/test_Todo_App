import 'package:flutter/material.dart';


class LanguageProvider extends ChangeNotifier {

  String initLocale = 'en';

  void changeLocale (String locale){
    initLocale = locale ;

    notifyListeners();
  }

  


}