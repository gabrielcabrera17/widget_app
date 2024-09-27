import 'package:flutter/material.dart';

final Color customColor = Color.fromARGB(227, 6, 212, 71);

 List<Color >colorList = [
  customColor,
  Colors.blue,
  Colors.green,
  Colors.greenAccent,
  Colors.pink,
  Colors.purple
];


class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(selectedColor < colorList.length - 1, 'Selected color must be less or equal then ${ colorList.length}');


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true
    )
  );

  
}