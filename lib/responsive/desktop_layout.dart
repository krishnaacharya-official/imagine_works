import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imagine_works/utlis/constants.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    SizedBox getHorizontalSpace(double height) {
      return SizedBox(
        height: height,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainComponent(getHorizontalSpace),
              Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                decoration: const BoxDecoration(color: Colors.green),
                //
              )
            ],
          ),
        ),
      ),
    );
  }

  Container mainComponent(SizedBox Function(double height) getHorizontalSpace) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1100),
      decoration: BoxDecoration(
        gradient: webGradientTwo,
        // color: Colors.green,
      ),
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
            style: mainHeader,
          ),
          getHorizontalSpace(100),
          Container(
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
        ],
      ),
    );
  }
}
