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
  // textTheme: GoogleFonts.montserratTextTheme(),
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
    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    indicatorColor: lPalette.primary,
  ),
  primaryColor: const Color.fromARGB(220, 216, 196, 159),
);
ThemeData darkMode = ThemeData(brightness: Brightness.dark);

// https://picsum.photos/200/300