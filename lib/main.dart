import 'package:flutter/material.dart';
import 'package:imagine_works/onboarding_screen.dart';
import 'package:imagine_works/responsive/desktop_layout.dart';
import 'package:imagine_works/responsive/mobile_layout.dart';
import 'package:imagine_works/responsive/responsive_layout.dart';
import 'package:imagine_works/theme.dart';

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
          mobileBody: MobileLayout(),
          desktopBody: DesktopLayout(),
        ));
  }
}
