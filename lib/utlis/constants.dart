import 'package:flutter/material.dart';

LinearGradient get onBoardingGradient => const LinearGradient(
      begin: Alignment(0, -1),
      end: Alignment(-0, 1),
      colors: <Color>[Color(0xffe0e7ff), Color(0xfffff7ed), Color(0xffffffff)],
      stops: <double>[0, 0.5, 1],
    );
