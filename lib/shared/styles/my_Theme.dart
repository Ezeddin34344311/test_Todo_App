// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyTheme{
  
  static Color pryColor =const Color(0XFF5D9CEC);
  static Color secColor =const Color(0XFF61E757);
  static Color blackColor =const Color(0XFF383838);
  static Color whiteColor =const Color(0XFFFFFFFF);
  static Color redColor =const Color(0XFFEC4B4B);
  static Color backColor =const Color(0XFFDFECDB);
  static Color backAndColorDark =const Color(0XFF060E1E);
  static Color backbottomNavi = const Color(0XFF141922);



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
    dialogTheme:DialogTheme(
      backgroundColor: whiteColor,
      titleTextStyle: TextStyle(color: whiteColor),
      
    ) ,
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
    
    dialogTheme:DialogTheme(
      backgroundColor: backbottomNavi,
      titleTextStyle: TextStyle(color: whiteColor),


    )
  
  );

}