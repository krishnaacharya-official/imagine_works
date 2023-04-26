import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imagine_works/helpers/navigation_bar.dart';
import 'package:imagine_works/models/feature_model.dart';
import 'package:imagine_works/responsive/resuable_components.dart';
import 'package:imagine_works/utlis/constants.dart';
import 'package:video_player/video_player.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  GlobalKey sliderKey = GlobalKey();
  GlobalKey headerKey = GlobalKey();
  GlobalKey aboutUsKey = GlobalKey();

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

  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _scroll();
    // _videoPlayerController = VideoPlayerController.network(
    //     "https://d3phaj0sisr2ct.cloudfront.net/site/videos/hero-homepage-v0.mp4")
    //   ..initialize().then((_) {
    //     _videoPlayerController.play();
    //     _videoPlayerController.setLooping(true);
    //     // Ensure the first frame is shown after the video is initialized
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> _scroll() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 40));
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: carouselStrings.length * 5),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    imageSlider = carouselStrings
        .map((item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: 1100,
                  height: 500,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            // image: AssetImage('images/image2.webp'))),
                            image: AssetImage("assets/${item.images[0]}"))),
                    // color: Colors.amber,
                  ),
                ),
                // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Visibility(
                  visible: carouselStrings[_index] == item,
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
            )))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              headerKey.currentContext!,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SvgPicture.asset(
              'assets/svg/idea.svg',
              width: 30,
              height: 30,
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
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(Icons.menu));
          })
        ],
      ),
      endDrawer:
          CustomNavigationBar(aboutUsKey: aboutUsKey, sliderKey: sliderKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainSection(),
            sliderSection(),
            featureSection(),
            getHorizontalSpace(10),
            showTrustedParnters ? trustedPartners() : const SizedBox.shrink(),
            awardsSection(),
            footerSection(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                style: webFooter.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container aboutUs() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      width: double.infinity,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: maxWidthWeb - 400,
          child: Column(
            children: [
              Text(
                "Who Are We ?",
                textAlign: TextAlign.center,
                style: mobileSubTitle.copyWith(
                    fontWeight: FontWeight.w500, fontSize: 26),
              ),
              getHorizontalSpace(20),
              Text(
                "AAUNO is an independent research lab focused in the field of Artificial Intelligence, Blockchain and Autonomous Systems, exploring efficient and cost effective ways in solving problems in these domain.",
                style: mobileBody,
                textAlign: TextAlign.center,
              ),
              getHorizontalSpace(10),
              Text(
                "We believe everyone is unique and has a story. Our mission is to make technology accessible to all.",
                style: mobileBody,
                textAlign: TextAlign.center,
              ),
              getHorizontalSpace(10),
              Text(
                "We are a small self-funded, fully-distributed passionate team who are domain experts in there field working with decades of experience and an incredible set of open minded advisors.",
                style: mobileBody,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\u00a9 AAUNO 2023",
                          style: mobileFooter,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ]),
                ),
                getHorizontalSpace(10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Terms of Service",
                          style: mobileFooter,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Text("Privacy", style: mobileFooter)),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Text("Code of Conduct", style: mobileFooter))
                    ]),
                getHorizontalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/facebook.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/instagram.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/linkedin.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/reddit.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/twitter.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/svg/youtube.svg',
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Card awardCard(SizedBox Function(double height) getHorizontalSpace,
      Widget image, String text) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            image,
            getHorizontalSpace(6),
            Text(text),
          ],
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
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: maxWidthWeb),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "An ",
                    style: mobileSubTitle.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black45),
                  ),
                  TextSpan(
                      text: "award-winning ",
                      style: mobileSubTitle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black87)),
                  TextSpan(
                    text: "platform.",
                    style: mobileSubTitle.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black45),
                  ),
                  TextSpan(
                      text: " Loved ",
                      style: mobileSubTitle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black87)),
                  TextSpan(
                    text: "by customers.",
                    style: mobileSubTitle.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.black45),
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
            Column(
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
                  height: 10,
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
                  height: 10,
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
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black38),
          ),
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

  Container featureSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      decoration: BoxDecoration(gradient: webGradientOne),
      child: Column(
        children: [
          Text(
            carouselStrings[_index].title,
            style: mobileSubTitle,
          ),
          getHorizontalSpace(20),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 2),
            children: [
              ...carouselStrings[_index].images.map((e) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage("assets/$e"))),
                    width: 150,
                    height: 150,
                    // child: Text(e),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Column sliderSection() {
    return Column(
      key: sliderKey,
      children: [
        Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(gradient: webGradientThree),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Our Products",
                    style: mobileSubTitle,
                  ),
                  getHorizontalSpace(20),
                  // Wrap(children: imageSlider.map((e) => e).toList()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      featureTabRow(carouselStrings),
                    ],
                  ),
                  getHorizontalSpace(20),
                  carouselComponent(),
                  getHorizontalSpace(20),

                  joinTheBetaButton(() {
                    context.push('/login');
                  }),
                ]))
      ],
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
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          aspectRatio: 1,
          onPageChanged: onPageChange,
          autoPlay: true,
        ),
        carouselController: _controller,
      ),
    );
  }

  Widget featureTabRow(List<FeaturesModel> subLists) {
    return GridView.count(
      childAspectRatio: 4,
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 2,
      crossAxisSpacing: 4,
      physics: const NeverScrollableScrollPhysics(),
      children: subLists
          .map((e) => InkWell(
                onTap: () {
                  debugPrint("${carouselStrings.indexOf(e)}");
                  setState(() {
                    _index = carouselStrings.indexOf(e);
                    _controller.animateToPage(_index);
                  });
                },
                child: Container(
                  alignment: carouselStrings.indexOf(e) % 2 == 0
                      ? Alignment.centerRight // Right align for left column
                      : Alignment.centerLeft,
                  child: Chip(
                    side: BorderSide.none,
                    label: Text(
                      e.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: e == carouselStrings[_index]
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                    backgroundColor: e == carouselStrings[_index]
                        ? Colors.grey.shade400
                        : Colors.grey.withOpacity(0.1),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget mainSection() {
    return Stack(
      children: [
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     FittedBox(
        //       fit: BoxFit.fill,
        //       child: Container(
        //         color: Colors.black,
        //         height: 845,
        //         width: 1600,
        //         child: VideoPlayer(_videoPlayerController),
        //       ),
        //     ),
        //   ],
        // ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: webGradientTwo,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getHorizontalSpace(20),
              SvgPicture.asset(
                'assets/svg/idea.svg',
                width: 40,
                height: 40,
              ),
              getHorizontalSpace(20),
              Text(
                "Where Imagination Meets Intelligence",
                style: mobileTitle,
                textAlign: TextAlign.center,
              ),
              getHorizontalSpace(40),
              joinTheBetaButton(() {
                context.push('/login');
              }),
            ],
          ),
        ),
      ],
    );
  }
}
