import 'package:flutter/material.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
      color: MyColors.myRed,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),


  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myRed,
      selectedItemColor: MyColors.myWhite,
      unselectedItemColor: MyColors.myGrey),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey.shade500),
    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
    displayMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
      titleMedium: const TextStyle(
          fontSize: 20 , fontWeight: FontWeight.w900 , color: MyColors.myWhite
      )
  ),

);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      color: MyColors.myRed,
      iconTheme: IconThemeData(color: Colors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.myRed,
      selectedItemColor: MyColors.myWhite,
      unselectedItemColor: MyColors.myLightGrey),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey.shade500),
    bodySmall: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    displayMedium: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
      titleMedium: const TextStyle(
          fontSize: 20 , fontWeight: FontWeight.w900 , color: MyColors.myWhite
      )
  ),
);
