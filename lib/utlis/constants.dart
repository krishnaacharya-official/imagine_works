import 'package:flutter/material.dart';

double get maxWidthWeb => 1200;

bool get showTrustedParnters => true;

// String mainVideoUrl =
//     "https://d3phaj0sisr2ct.cloudfront.net/site/videos/hero-homepage-v0.mp4";
String mainVideoUrl = "video/sample.mp4";

List<String> listPartner = [
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/mbc.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/google.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/vox.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/pentagram.svg",

  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/mbc.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/google.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/vox.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/pentagram.svg",

  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/mbc.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/google.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/vox.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/pentagram.svg",

  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/mbc.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/google.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/vox.svg",
  "https://d3phaj0sisr2ct.cloudfront.net/site/logos/pentagram.svg",
  // "https://d3phaj0sisr2ct.cloudfront.net/site/logos/cbs.svg",
  // "https://d3phaj0sisr2ct.cloudfront.net/site/logos/corridor.svg",
  // "	https://d3phaj0sisr2ct.cloudfront.net/site/logos/mrbeast.svg",
  // "https://d3phaj0sisr2ct.cloudfront.net/site/logos/vaynermedia.svg",
];

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

TextStyle get webHeader => const TextStyle(
      fontSize: 20,
    );

TextStyle get webFooter =>
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle get mobileFooter =>
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
TextStyle get webTitle =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 56);
TextStyle get tabTitle =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 32);
TextStyle get mobileTitle =>
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 32);
TextStyle get webSubTitle => const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 36, letterSpacing: 0.8);
TextStyle get mobileSubTitle => const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 22, letterSpacing: 0.8);
TextStyle get tabSubTitle => const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 28, letterSpacing: 0.8);
TextStyle get webButton =>
    const TextStyle(fontSize: 36, fontWeight: FontWeight.w500);

TextStyle get webBody =>
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
TextStyle get mobileBody =>
    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
