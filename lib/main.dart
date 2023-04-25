import 'package:flutter/material.dart';
import 'package:imagine_works/router.dart';
import 'package:imagine_works/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Imagine Works',
        theme: theme,
        routerConfig: router);
  }
}
