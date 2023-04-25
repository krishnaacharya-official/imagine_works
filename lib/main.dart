import 'package:flutter/material.dart';
import 'package:imagine_works/responsive/desktop_layout.dart';
import 'package:imagine_works/responsive/mobile_layout.dart';
import 'package:imagine_works/responsive/responsive_layout.dart';
import 'package:imagine_works/responsive/tablet_layout.dart';
import 'package:imagine_works/theme.dart';

import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Imagine Works',
        theme: theme,
        home: const ResponsiveLayout(
          tabletBody: TabletLayout(),
          mobileBody: MobileLayout(),
          desktopBody: DesktopLayout(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.orange),
    Container(color: Colors.purple),
    Container(color: Colors.red),
    Container(color: Colors.teal),
    Container(color: Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: _pages,
              options: CarouselOptions(
                height: 300,
                initialPage: _currentIndex,
                viewportFraction: 0.6,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _pages.map((page) {
                int index = _pages.indexOf(page);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
