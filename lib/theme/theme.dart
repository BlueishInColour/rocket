import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightPalette {
  var backgroundColor = Colors.grey[100];
  Color primary = Colors.black;
  Color secondary = Colors.orange;
  Color tetiary = Colors.deepOrange;
  var text = const Color.fromARGB(255, 255, 255, 255);
  var darkText = Colors.black54;
}

LightPalette lPalette = LightPalette();

class DarkPalette {
  var backgroundColor = Colors.grey[200];
  Color primary = Colors.teal;
  Color secondary = Colors.teal;
  Color tetiary = Colors.teal;
}

DarkPalette dPalette = DarkPalette();

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: GoogleFonts.pacificoTextTheme(
    Typography.blackCupertino,
  ),
  scaffoldBackgroundColor: lPalette.backgroundColor,
  appBarTheme: AppBarTheme(
      elevation: 0,
      color: lPalette.primary,
      foregroundColor: lPalette.text,
      toolbarHeight: 30,
      titleTextStyle: GoogleFonts.pacifico(color: Colors.white60)
      // backgroundColor: lPalette.primary,
      ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lPalette.primary, foregroundColor: lPalette.text),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.values.first,
    labelColor: Colors.green,
    unselectedLabelColor: Colors.black54,
    dividerColor: lPalette.primary,
    labelStyle: GoogleFonts.pacifico(
      fontWeight: FontWeight.bold,
      fontSize: 17,
    ),
    unselectedLabelStyle: GoogleFonts.pacifico(fontWeight: FontWeight.bold),
    indicatorColor: lPalette.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38, width: 7),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 7),
          borderRadius: BorderRadius.circular(10))),
  primaryColor: const Color.fromARGB(220, 216, 196, 159),
);
ThemeData darkMode = ThemeData(brightness: Brightness.dark);

// https://picsum.photos/200/300