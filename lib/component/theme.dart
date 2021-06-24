import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/component/const.dart';

class HomeTheme {
  ThemeData theme = ThemeData(
    primaryColor: Colors.white,
    accentColor: secondary,
    cardColor: secondary.withOpacity(.1),
    buttonColor: secondary,
    dividerColor: secondary,
    splashColor: secondary.withOpacity(.4),
    highlightColor: secondary.withOpacity(.2),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: secondary,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: secondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: secondary,
      ),
      textTheme: TextTheme(
        bodyText2: GoogleFonts.poppins(color: secondary),
        headline6: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: secondary,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          secondary,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText2: GoogleFonts.poppins(color: secondary),
      headline1: GoogleFonts.poppins(color: secondary),
      headline2: GoogleFonts.poppins(color: secondary),
      headline3: GoogleFonts.poppins(color: secondary),
      headline4: GoogleFonts.poppins(color: secondary),
      headline5: GoogleFonts.poppins(color: secondary),
      headline6: GoogleFonts.poppins(color: secondary),
    ),
  );
}
