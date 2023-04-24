import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imagine_works/utlis/constants.dart';

import '../models/feature_model.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DesktopLayout> {
  GlobalKey sliderKey = GlobalKey();
  String reason = '';
  final CarouselController _controller = CarouselController();
  int _index = 0;
  List<FeaturesModel> carouselStrings = [
    FeaturesModel("Custom Models", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Image Generation", "",
        ["Yello", "Yello", "Yello", "Yello", "Yello", "Yello"]),
    FeaturesModel("Video Generation", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Image Upscaling", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Inpainting", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Outpainting", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Image to Image", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
    FeaturesModel("Video to Video", "",
        ["Hello", "Hello", "Hello", "Hello", "Hello", "Hello"]),
  ];
  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    debugPrint("Index in pageChange $index");
    setState(() {
      reason = changeReason.toString();
      _index = index;
    });
  }

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
  // late List<Widget> imageSlider;
  late List<Widget> imageSlider;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = scrollController.position.minScrollExtent;
      double maxScrollExtent1 = scrollController.position.maxScrollExtent;
      //
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 25,
          scrollController);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // timer ??= Timer.periodic(const Duration(seconds: 5), (timer) {
    //   double minScrollExtent = scrollController.position.minScrollExtent;
    //   double maxScrollExtent = scrollController.position.maxScrollExtent;
    //   animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 25,
    //       scrollController);
    // });
    SizedBox getHorizontalSpace(double height) {
      return SizedBox(
        height: height,
      );
    }

    List<List<FeaturesModel>> splitList(
        List<FeaturesModel> list, int chunkSize) {
      List<List<FeaturesModel>> chunks = [];
      for (var i = 0; i < list.length; i += chunkSize) {
        chunks.add(list.sublist(
            i, i + chunkSize > list.length ? list.length : i + chunkSize));
      }
      return chunks;
    }

    imageSlider = carouselStrings
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 1100,
                        height: 500,
                        child: Container(
                          color: Colors.amber,
                          child: Center(
                            child: Text(
                              item.title,
                            ),
                          ),
                        ),
                      ),
                      // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Visibility(
                        visible: carouselStrings[_index] == item,
                        // visible: _index == imgList.indexOf(item),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  _controller.previousPage();
                                },
                                iconSize: 100,
                                icon: const Icon(
                                  Icons.navigate_before,
                                  color: Colors.black26,
                                ))),
                      ),
                      Visibility(
                        visible: _index == carouselStrings.indexOf(item),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  _controller.nextPage();
                                },
                                iconSize: 100,
                                icon: const Icon(
                                  Icons.navigate_next,
                                  color: Colors.black26,
                                ))),
                      ),
                    ],
                  )),
            ))
        .toList();

    List<List<FeaturesModel>> subLists = splitList(carouselStrings, 4);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topComponent(getHorizontalSpace),
              getHorizontalSpace(20),
              sliderAndFeaturesComponent(getHorizontalSpace, subLists),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: ((context, index) => Container(
                          color: Colors.amber,
                          width: 200,
                          height: 200,
                          child: const Text("Hello"),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container topComponent(SizedBox Function(double height) getHorizontalSpace) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: webGradientTwo,
        // color: Colors.green,
      ),
      child: Column(
        children: [
          headerComponent(),
          mainComponent(getHorizontalSpace),
        ],
      ),
    );
  }

  Container headerComponent() {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidthWeb),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SvgPicture.asset(
                'assets/svg/idea.svg',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "ImagineWorks",
                style: webHeader.copyWith(fontWeight: FontWeight.bold),
              )
            ]),
            ///////////////////////////////////////////////////////////////////////////////////////////////
            Row(children: [
              const SizedBox(
                width: 80,
              ),
              InkWell(
                onTap: () {
                  Scrollable.ensureVisible(
                    sliderKey.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "Product",
                  style: webHeader,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text("Subscribe", style: webHeader),
              const SizedBox(
                width: 15,
              ),
              Text("About Us", style: webHeader)
            ]),
            Row(children: [
              Row(
                children: [
                  const Icon(Icons.login),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login",
                    style: webHeader,
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
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
                child: Row(
                  children: [
                    const Icon(Icons.person_add),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Join the beta",
                      style: webHeader.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ])
          ]),
    );
  }

  Column sliderAndFeaturesComponent(
      SizedBox Function(double height) getHorizontalSpace,
      List<List<FeaturesModel>> subLists) {
    return Column(
      key: sliderKey,
      children: [
        sliderComponent(getHorizontalSpace, subLists),
        featuresComponent(getHorizontalSpace),
      ],
    );
    //
  }

  Container sliderComponent(SizedBox Function(double height) getHorizontalSpace,
      List<List<FeaturesModel>> subLists) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        decoration: BoxDecoration(gradient: webGradientThree),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Our Products",
                style: webSubTitle,
              ),
              getHorizontalSpace(20),
              // Wrap(children: imageSlider.map((e) => e).toList()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  featureTabRow(subLists[0]),
                  getHorizontalSpace(20),
                  featureTabRow(subLists[1]),
                ],
              ),
              getHorizontalSpace(20),
              carouselComponent(),
              getHorizontalSpace(20),

              joinTheBetaButton,
            ]));
  }

  SingleChildScrollView featureTabRow(List<FeaturesModel> subLists) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: subLists
            .map((e) => InkWell(
                  onTap: () {
                    debugPrint("${carouselStrings.indexOf(e)}");
                    setState(() {
                      _index = carouselStrings.indexOf(e);
                      _controller.animateToPage(_index);
                    });
                  },
                  child: Row(
                    children: [
                      Chip(
                        side: BorderSide.none,
                        label: Text(
                          e.title,
                          style: TextStyle(
                              fontWeight: e == carouselStrings[_index]
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                        backgroundColor: e == carouselStrings[_index]
                            ? Colors.grey.shade400
                            : Colors.grey.withOpacity(0.1),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  SizedBox carouselComponent() {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          height: 400,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          aspectRatio: 1,
          onPageChanged: onPageChange,
          autoPlay: true,
        ),
        carouselController: _controller,
      ),
    );
  }

  Container featuresComponent(
      SizedBox Function(double height) getHorizontalSpace) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(gradient: webGradientOne),
      child: Column(
        children: [
          Text(
            carouselStrings[_index].title,
            style: webSubTitle,
          ),
          getHorizontalSpace(20),
          Container(
            constraints: BoxConstraints(maxWidth: maxWidthWeb),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 3),
              children: [
                ...carouselStrings[_index].images.map((e) => Container(
                      width: 150,
                      height: 150,
                      color: Colors.amber,
                      child: Text(e),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container mainComponent(SizedBox Function(double height) getHorizontalSpace) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      constraints: BoxConstraints(maxWidth: maxWidthWeb),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getHorizontalSpace(80),
          SvgPicture.asset(
            'assets/svg/idea.svg',
            width: 100,
            height: 100,
          ),
          getHorizontalSpace(60),
          Text(
            "Where Imagination Meets Intelligence",
            style: webTitle,
          ),
          getHorizontalSpace(100),
          joinTheBetaButton,
        ],
      ),
    );
  }
}
