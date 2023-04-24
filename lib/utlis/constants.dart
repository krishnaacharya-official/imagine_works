import 'package:flutter/material.dart';

LinearGradient get onBoardingGradient => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffe0e7ff), Color(0xfffff7ed), Color(0xffffffff)],
      stops: <double>[0, 0.5, 1],
    );

TextStyle get heading =>
    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

TextStyle get title =>
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
