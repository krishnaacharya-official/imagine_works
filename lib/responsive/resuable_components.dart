import 'package:flutter/material.dart';
import 'package:imagine_works/models/feature_model.dart';
import 'package:imagine_works/utlis/constants.dart';

List<FeaturesModel> carouselStrings = [
  FeaturesModel("Custom Models", "", [
    "images/image.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image2.jpg",
    "images/image2.jpg",
    "images/image2.jpg"
  ]),
  FeaturesModel("Image Generation", "", [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image.jpg",
    "images/image3.jpg",
    "images/image2.jpg",
    "images/image2.jpg"
  ]),
  FeaturesModel("Video Generation", "", [
    "images/image2.jpg",
    "images/image2.jpg",
    "images/image2.jpg",
    "images/image2.jpg",
    "images/image2.jpg",
    "images/image2.jpg"
  ]),
  FeaturesModel("Image Upscaling", "", [
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg"
  ]),
  FeaturesModel("Inpainting", "", [
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg"
  ]),
  FeaturesModel("Outpainting", "", [
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg"
  ]),
  FeaturesModel("Image to Image", "", [
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg"
  ]),
  FeaturesModel("Video to Video", "", [
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "images/image3.jpg"
  ]),
];

Widget joinTheBetaButton(callback) {
  return InkWell(
    onTap: () {
      callback();
    },
    child: Container(
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
    ),
  );
}

SizedBox getHorizontalSpace(double height) {
  return SizedBox(
    height: height,
  );
}
