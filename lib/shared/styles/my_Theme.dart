
import 'package:flutter/material.dart';

class MyTheme{
  
  static Color pryColor = Color(0XFF5D9CEC);
  static Color secColor = Color(0XFF61E757);
  static Color blackColor = Color(0XFF383838);
  static Color whiteColor = Color(0XFFFFFFFF);
  static Color redColor = Color(0XFFEC4B4B);
  static Color backColor = Color(0XFFDFECDB);


  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: backColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: whiteColor
      ),
      backgroundColor: pryColor,
      toolbarHeight: 160,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: pryColor,

    ),
    
    textTheme: TextTheme(
      headline1: TextStyle(
        color: whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: pryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      subtitle1:TextStyle(
        color: blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyText1:TextStyle(
        color: whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),

    ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: pryColor),
      unselectedIconTheme: IconThemeData(color: blackColor),
    )
  );


  static ThemeData darkMode = ThemeData(
  
  );

}