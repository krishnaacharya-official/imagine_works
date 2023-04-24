import 'package:flutter/material.dart';

final OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(
    color: Colors.grey,
    width: 1.0,
  ),
);

final OutlineInputBorder focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(
    color: Colors.grey,
    width: 2.0,
  ),
);
ThemeData get theme => ThemeData(
    fontFamily: 'Open Sans',
    useMaterial3: true,
    inputDecorationTheme:
        InputDecorationTheme(border: border, focusedBorder: focusedBorder));
