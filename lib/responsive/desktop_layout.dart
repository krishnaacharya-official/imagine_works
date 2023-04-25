import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imagine_works/responsive/resuable_components.dart';
import 'package:imagine_works/utlis/constants.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../models/feature_model.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DesktopLayout> {
  GlobalKey sliderKey = GlobalKey();
  GlobalKey aboutUsKey = GlobalKey();
  GlobalKey headerKey = GlobalKey();
  String reason = '';
  final CarouselController _controller = CarouselController();
  int _index = 0;
  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    debugPrint("Index in pageChange $index");
    setState(() {
      reason = changeReason.toString();
      _index = index;
    });
  }

  // late List<Widget> imageSlider;
  late List<Widget> imageSlider;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scroll();
  }

  Future<void> _scroll() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 40));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: carouselStrings.length * 10),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                                  color: Colors.black38,
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
                                  color: Colors.black38,
                                ))),
                      ),
                    ],
                  )),
            ))
        .toList();

    List<List<FeaturesModel>> subLists = splitList(carouselStrings, 4);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1920,
          child: SingleChildScrollView(
              child: StickyHeader(
            header: headerComponent(),
            content: Column(
              key: headerKey,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                topComponent(),
                sliderAndFeaturesComponent(subLists),
                getHorizontalSpace(10),
                showTrustedParnters
                    ? trustedPartners()
                    : const SizedBox.shrink(),
                awardsSection(),
                footerSection(),
              ],
            ),
          )),
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 60,
      //   child: Center(
      //     child:
      //   ),
      // ),
    );
  }

  Container footerSection() {
    return Container(
      decoration: BoxDecoration(gradient: webGradientOne),
      child: Column(
        children: [
          aboutUs(),
          const Divider(
            height: 0.5,
            thickness: 0.5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: maxWidthWeb,
            // constraints:
            //     BoxConstraints(minWidth: maxWidthWeb, maxWidth: maxWidthWeb),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\u00a9 AAUNO 2023",
                    style: webFooter,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 180,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Terms of Service",
                        style: webFooter,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {}, child: Text("Privacy", style: webFooter)),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text("Code of Conduct", style: webFooter))
                  ]),
                  Row(children: [
                    Row(
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/facebook.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/instagram.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/linkedin.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/reddit.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/twitter.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            'svg/youtube.svg',
                            height: 20,
                            width: 20,
                          ),
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
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/idea.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Join the beta",
                              style: webFooter.copyWith(
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ])
                ]),
          ),
        ],
      ),
    );
  }

  Container aboutUs() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: maxWidthWeb - 400,
          child: Column(
            children: [
              Text(
                "Who Are We ?",
                textAlign: TextAlign.center,
                style: webSubTitle.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 32),
              ),
              getHorizontalSpace(20),
              Text(
                "AAUNO is an independent research lab focused in the field of Artificial Intelligence, Blockchain and Autonomous Systems, exploring efficient and cost effective ways in solving problems in these domain.",
                style: webBody,
                textAlign: TextAlign.center,
              ),
              getHorizontalSpace(10),
              Text(
                "We believe everyone is unique and has a story. Our mission is to make technology accessible to all.",
                style: webBody,
                textAlign: TextAlign.center,
              ),
              getHorizontalSpace(10),
              Text(
                "We are a small self-funded, fully-distributed passionate team who are domain experts in there field working with decades of experience and an incredible set of open minded advisors.",
                style: webBody,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container awardsSection() {
    return Container(
      key: aboutUsKey,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(gradient: webGradientTwo),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        constraints: BoxConstraints(maxWidth: maxWidthWeb),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "An ",
                    style: webSubTitle.copyWith(
                        fontWeight: FontWeight.w100, color: Colors.black38),
                  ),
                  TextSpan(
                      text: "award-winning ",
                      style: webSubTitle.copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "platform.",
                    style: webSubTitle.copyWith(
                        fontWeight: FontWeight.w100, color: Colors.black38),
                  ),
                  TextSpan(
                      text: " Loved ",
                      style: webSubTitle.copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: "by customers.",
                    style: webSubTitle.copyWith(
                        fontWeight: FontWeight.w100, color: Colors.black38),
                  ),
                ])),
            const SizedBox(
              height: 20,
            ),
            const Text("Based on 10000+ customer reviews,"),
            getHorizontalSpace(20),
            GestureDetector(
              onTap: () {},
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 5,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            getHorizontalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                awardCard(
                    getHorizontalSpace,
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.amber,
                    ),
                    "Award text"),
                const SizedBox(
                  width: 20,
                ),
                awardCard(
                    getHorizontalSpace,
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.amber,
                    ),
                    "Award text"),
                const SizedBox(
                  width: 20,
                ),
                awardCard(
                    getHorizontalSpace,
                    Container(
                      width: 200,
                      height: 200,
                      color: Colors.amber,
                    ),
                    "Award text")
              ],
            ),
            Row()
          ],
        ),
      ),
    );
  }

  Card awardCard(SizedBox Function(double height) getHorizontalSpace,
      Widget image, String text) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            image,
            getHorizontalSpace(10),
            Text(text),
          ],
        ),
      ),
    );
  }

  Container trustedPartners() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Text(
            "Trust by the top creatives",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
                color: Colors.black38),
          ),
          getHorizontalSpace(10),
          SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: listPartner.length,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      SvgPicture.network(listPartner[index]),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }

  Container topComponent() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: webGradientTwo,
        // color: Colors.green,
      ),
      child: Column(
        children: [
          mainComponent(),
        ],
      ),
    );
  }

  Widget headerComponent() {
    return Material(
      elevation: 1,
      color: Colors.white,
      child: Center(
        child: Container(
          color: Colors.white,
          constraints:
              BoxConstraints(minWidth: maxWidthWeb, maxWidth: maxWidthWeb),
          width: double.infinity,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Scrollable.ensureVisible(
                      headerKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Row(children: [
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
                ),
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
                  InkWell(child: Text("Subscribe", style: webHeader)),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Scrollable.ensureVisible(
                          aboutUsKey.currentContext!,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text("About Us", style: webHeader))
                ]),
                Row(children: [
                  InkWell(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Row(
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
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
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
                            style:
                                webHeader.copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  )
                ])
              ]),
        ),
      ),
    );
  }

  Column sliderAndFeaturesComponent(List<List<FeaturesModel>> subLists) {
    return Column(
      key: sliderKey,
      children: [
        sliderComponent(subLists),
        featuresComponent(),
      ],
    );
    //
  }

  Container sliderComponent(List<List<FeaturesModel>> subLists) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        margin: const EdgeInsets.only(bottom: 10),
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

              joinTheBetaButton(() {
                context.push('/login');
              }),
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
      height: 600,
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          height: 500,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          aspectRatio: 1,
          onPageChanged: onPageChange,
          autoPlay: true,
        ),
        carouselController: _controller,
      ),
    );
  }

  Container featuresComponent() {
    return Container(
      width: double.infinity,
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

  Container mainComponent() {
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
            textAlign: TextAlign.center,
          ),
          getHorizontalSpace(100),
          joinTheBetaButton(() {
            context.push('/login');
          }),
        ],
      ),
    );
  }
}
