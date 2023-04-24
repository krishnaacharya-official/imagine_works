import 'package:flutter/material.dart';
import 'package:imagine_works/utlis/constants.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Open Sans',
            useMaterial3: true,
            textTheme: const TextTheme()),
        home: const OnBoardingScreen());
  }
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: onBoardingGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              margin: const EdgeInsets.only(top: 36),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text("Join ImagineWorks")),
                    const Text("Email Address"),
                    TextFormField(),
                    const Text("Password"),
                    TextFormField(),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(-0, 1),
                          colors: <Color>[Color(0xffffffff), Color(0xfff3f4f6)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: const Text(
                        "Next",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text("Already have an account? Login"))
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
