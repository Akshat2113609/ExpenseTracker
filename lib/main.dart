import 'package:flutter/material.dart';
import 'package:myapp/Widgets/expenses.dart';
var kColorScheme = ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 77, 183, 240),);
var kDarkColorScheme=ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor:const Color.fromARGB(255, 5, 99, 125));
void main(){
runApp(
  MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
       cardTheme:const CardTheme().copyWith(
        color:const Color.fromARGB(255, 77, 183, 240),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical:8,
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
      foregroundColor: kDarkColorScheme.onPrimaryContainer,
     ),
     ),
    ),
    theme: ThemeData().copyWith(
      colorScheme:kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme:const CardTheme().copyWith(
        color:const Color.fromARGB(255, 77, 183, 240),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical:8,
        )
      ),
     elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer,
     ),
     ),
     textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color:  kColorScheme.onPrimaryContainer,
        fontSize: 16,
      ),
     ),
      ),
      themeMode: ThemeMode.system,
    home:const Expenses(),
  ),
);

}