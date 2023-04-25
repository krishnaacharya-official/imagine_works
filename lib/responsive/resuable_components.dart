import 'package:flutter/material.dart';
import 'package:imagine_works/models/feature_model.dart';
import 'package:imagine_works/utlis/constants.dart';

List<FeaturesModel> carouselStrings = [
  FeaturesModel("Custom Models", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel("Image Generation", "",
      ["Yello", "Yello", "Yello", "Yello", "Yello", "Yello"]),
  FeaturesModel("Video Generation", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel("Image Upscaling", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel(
      "Inpainting", "", ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel("Outpainting", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel("Image to Image", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  FeaturesModel("Video to Video", "",
      ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
];

get joinTheBetaButton => Container(
      height: 48,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 0.5, color: Colors.grey),
        gradient: const LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(-0, 1),
          colors: <Color>[Color(0xffffffff), Color(0xfff3f4f6)],
          stops: <double>[0, 1],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        "Join the Beta",
        style: title.copyWith(fontWeight: FontWeight.bold),
      ),
    );
SizedBox getHorizontalSpace(double height) {
  return SizedBox(
    height: height,
  );
}
