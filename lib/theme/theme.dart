import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightPalette {
  var backgroundColor = Colors.white54;
  Color primary = const Color.fromARGB(220, 216, 196, 159);
  Color secondary = Colors.orange;
  Color tetiary = Colors.deepOrange;
  Color text = Colors.black54;
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
      fontSize: 20,
    ),
    unselectedLabelStyle: GoogleFonts.pacifico(fontWeight: FontWeight.bold),
    indicatorColor: lPalette.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(57, 158, 158, 158), width: 7),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color.fromARGB(144, 76, 175, 79), width: 7),
          borderRadius: BorderRadius.circular(10))),
  primaryColor: const Color.fromARGB(220, 216, 196, 159),
);
ThemeData darkMode = ThemeData(brightness: Brightness.dark);

// https://picsum.photos/200/300