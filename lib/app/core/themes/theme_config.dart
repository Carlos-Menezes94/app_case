import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static final theme = ThemeData(
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    fontFamily: GoogleFonts.montserrat().fontFamily,
    appBarTheme: AppBarTheme(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      elevation: 10,
      backgroundColor: Colors.yellow.shade700,
      toolbarHeight: 40,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 26,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00434C),
      primary: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[150],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF00434C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
