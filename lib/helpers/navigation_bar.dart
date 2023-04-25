import 'package:flutter/material.dart';
import 'package:imagine_works/utlis/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  GlobalKey sliderKey = GlobalKey();
  GlobalKey aboutUsKey = GlobalKey();

  GlobalKey headerKey = GlobalKey();
  CustomNavigationBar(
      {super.key, required this.sliderKey, required this.aboutUsKey});

  @override
  Widget build(BuildContext context) {
    debugPrint("Helllo");
    return Drawer(
      width: 300,
      child: Container(
        padding: const EdgeInsets.only(top: 52, right: 32, left: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                  height: 15,
                ),
                InkWell(child: Text("Subscribe", style: webHeader)),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        aboutUsKey.currentContext!,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text("About Us", style: webHeader)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_add),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Join the beta",
                    style: webHeader.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
