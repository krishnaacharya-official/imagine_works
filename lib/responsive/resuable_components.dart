import 'package:flutter/material.dart';
import 'package:imagine_works/models/feature_model.dart';
import 'package:imagine_works/utlis/constants.dart';

List<FeaturesModel> carouselStrings = [
  FeaturesModel("Custom Models", "", [
    "images/image.jpg",
    "images/image3.jpg",
    "images/image3.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg"
  ]),
  FeaturesModel("Image Generation", "", [
    "images/image1.jpg",
    "https://images.deepai.org/art-image/0de84ea178de439b8140f0179300d1ab/close-up-of-tall-dark-haired-female-warrior-eeb6ea-th.jpg",
    "https://images.deepai.org/art-image/0de84ea178de439b8140f0179300d1ab/close-up-of-tall-dark-haired-female-warrior-eeb6ea-th.jpg",
    "https://images.deepai.org/art-image/0de84ea178de439b8140f0179300d1ab/close-up-of-tall-dark-haired-female-warrior-eeb6ea-th.jpg",
    "https://images.deepai.org/art-image/0de84ea178de439b8140f0179300d1ab/close-up-of-tall-dark-haired-female-warrior-eeb6ea-th.jpg",
    "https://images.deepai.org/art-image/0de84ea178de439b8140f0179300d1ab/close-up-of-tall-dark-haired-female-warrior-eeb6ea-th.jpg"
  ]),
  FeaturesModel("Video Generation", "", [
    "images/image2.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg",
    "https://images.deepai.org/art-image/22428d8a4ca7435ca03a85cceb4ed927/a-dark-techpriest-of-mars-with-a-dirty-red-cloak-with.jpg"
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
