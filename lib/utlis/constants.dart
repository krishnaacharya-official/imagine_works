import 'package:flutter/material.dart';

LinearGradient get onBoardingGradient => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffe0e7ff), Color(0xfffff7ed), Color(0xffffffff)],
      stops: <double>[0, 0.5, 1],
    );

LinearGradient get buttonGraident => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[
        Color.fromARGB(255, 244, 242, 242),
        Color.fromARGB(255, 230, 230, 230)
      ],
      stops: <double>[0, 1],
    );

TextStyle get heading =>
    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

TextStyle get title =>
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

LinearGradient get webGradientOne => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffffffff), Color(0xffeff6ff)],
      stops: <double>[0, 1],
    );

LinearGradient get webGradientTwo => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffffffff), Color(0xfffaf5ff)],
      stops: <double>[0, 1],
    );

LinearGradient get webGradientThree => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffffffff), Color(0xfffaf5ff)],
      stops: <double>[0, 1],
    );

TextStyle get webHeaderBold =>
    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

TextStyle get webHeader => const TextStyle(
      fontSize: 36,
    );
TextStyle get mainHeader =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 56);

TextStyle get webButton =>
    const TextStyle(fontSize: 36, fontWeight: FontWeight.w500);

TextStyle get webBody =>
    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500);
