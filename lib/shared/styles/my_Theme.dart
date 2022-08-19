import 'package:flutter/material.dart';

class MyTheme{
  
  static Color pryColor = Color(0XFF5D9CEC);
  static Color secColor = Color(0XFF61E757);
  static Color blackColor = Color(0XFF383838);
  static Color whiteColor = Color(0XFFFFFFFF);
  static Color redColor = Color(0XFFEC4B4B);
  static Color backColor = Color(0XFFDFECDB);
  static Color backAndColorDark = Color(0XFF060E1E);
  static Color backbottomNavi = Color(0XFF141922);



  static ThemeData lightMode = ThemeData(
   
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: whiteColor
      ),
      backgroundColor: pryColor,
      toolbarHeight: 140,
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
      unselectedLabelStyle: TextStyle(color: blackColor)
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor,
    ),
    iconTheme: IconThemeData(
      color: backAndColorDark
    ),
  );


  static ThemeData darkMode = ThemeData(

      scaffoldBackgroundColor: backAndColorDark,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: backAndColorDark
      ),
      backgroundColor: pryColor,
      toolbarHeight: 140,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: pryColor,

    ),
    
    textTheme: TextTheme(
      headline1: TextStyle(
        color: backAndColorDark,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: pryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      subtitle1:TextStyle(
        color: whiteColor,
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
      unselectedIconTheme: IconThemeData(color: whiteColor),
      unselectedLabelStyle: TextStyle(color: whiteColor)
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: backbottomNavi,
      
    ),
    iconTheme: IconThemeData(
      color: whiteColor
    ),
  
  );

}