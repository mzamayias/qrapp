import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isLightTheme = true;

  ThemeMode get currentTheme =>
      _isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      shadowColor: const Color(0xff303030),
      primaryColor: const Color(0xff303030),
      backgroundColor: const Color(0xfff3f3f3),
      scaffoldBackgroundColor: const Color(0xfff3f3f3),
      fontFamily: GoogleFonts.firaSans().fontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: const Color(0xff303030),
        ),
        headline2: TextStyle(
          color: const Color(0xff303030),
        ),
        headline3: TextStyle(
          color: const Color(0xff303030),
        ),
        headline4: TextStyle(
          color: const Color(0xff303030),
        ),
        headline5: TextStyle(
          color: const Color(0xff303030),
        ),
        headline6: TextStyle(
          color: const Color(0xff303030),
        ),
        subtitle1: TextStyle(
          color: const Color(0xff303030),
        ),
        subtitle2: TextStyle(
          color: const Color(0xff303030),
        ),
        bodyText1: TextStyle(
          color: const Color(0xff303030),
        ),
        bodyText2: TextStyle(
          color: const Color(0xff303030),
        ),
        caption: TextStyle(
          color: const Color(0xff303030),
        ),
        button: TextStyle(
          color: const Color(0xff303030),
        ),
        overline: TextStyle(
          color: const Color(0xff303030),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}