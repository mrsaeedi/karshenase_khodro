import 'package:flutter/material.dart';

//! ========= all textTheme property's is in this class ==========
class MyTextTheme {
  static const String fontFamily = 'Vazir';
//
  static TextTheme myTextThemeLight = const TextTheme(
    titleLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),

//
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 17, 17, 17)),
//
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 124, 124, 124)),
//
    bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(157, 77, 77, 77)),
  );
//! dark mode text theme
  static TextTheme myTextThemeDark = const TextTheme(
    titleLarge: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
//
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 201, 201, 201)),
//
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 197, 197, 197)),
//
    bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 177, 177, 177)),
  );
}

// ! =========== buttons styel are in this class==============
class MyButtonStyle {
  //elevetedButton Style
  static ElevatedButtonThemeData myElevetedButton =
      const ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(115, 34, 204, 247))));
}

//!============== theme data classes and propertys ==============
class AppTheme {
  //!lighti theme propertys
  static final lightTheme = ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(115, 34, 204, 247),
      ),
      primaryColor: Color.fromARGB(115, 34, 204, 247),
// elevetedButtom style
      elevatedButtonTheme: MyButtonStyle.myElevetedButton,
// primery colors
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
      ),
      fontFamily: MyTextTheme.fontFamily,
      brightness: Brightness.light,
      // useMaterial3: true,
// text styles
      textTheme: MyTextTheme.myTextThemeLight);

  //!dark theme propertys
  static final darkTheme = ThemeData(
    //elevetedButton Style
    elevatedButtonTheme: MyButtonStyle.myElevetedButton,
    fontFamily: MyTextTheme.fontFamily,
    colorScheme: ColorScheme.dark(),
    textTheme: MyTextTheme.myTextThemeDark,
  );
}
