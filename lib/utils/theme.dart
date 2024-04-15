import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple[400]!);
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.deepPurple);

// const Color.fromARGB(255, 5, 99, 125)

ThemeData lightTheme() => ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.primary,
        elevation: 0,
        foregroundColor: kColorScheme.primaryContainer),
    cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer)),
    textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: kColorScheme.onSecondaryContainer,
        )));

ThemeData darkTheme() => ThemeData.dark().copyWith(
    colorScheme: kDarkColorScheme,
    cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer)));
