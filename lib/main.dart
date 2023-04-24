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

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  TextEditingController? _emailAddressController;
  TextEditingController? _password;
  bool _formChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailAddressController = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: onBoardingGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                constraints: const BoxConstraints(maxWidth: 350),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                margin: const EdgeInsets.only(top: 72),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: -50,
                      child: Image.asset(
                          width: 70, height: 70, 'assets/images/logo.png'),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Join ImagineWorks",
                                style: heading,
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Email Address",
                            style: title,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  _emailAddressController?.text.trim() == "") {
                                return "Email address cannot be empty";
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Invalid Email Address';
                              }
                              return null;
                            },
                            controller: _emailAddressController,
                            autovalidateMode: _formChecked
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Password",
                            style: title,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  _emailAddressController?.text.trim() == "") {
                                return "Password can't be empty";
                              }
                              if (value.length < 8) {
                                return 'Password length cannot be less than 8';
                              }
                              return null;
                            },
                            controller: _password,
                            autovalidateMode: _formChecked
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _formChecked = true;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                    top: BorderSide(
                                        width: 0.5, color: Colors.grey),
                                    left: BorderSide(
                                        width: 0.5, color: Colors.grey),
                                    right: BorderSide(
                                        width: 0.5, color: Colors.grey),
                                    bottom: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                gradient: const LinearGradient(
                                  begin: Alignment(0, -1),
                                  end: Alignment(-0, 1),
                                  colors: <Color>[
                                    Color.fromARGB(255, 244, 242, 242),
                                    Color.fromARGB(255, 230, 230, 230)
                                  ],
                                  stops: <double>[0, 1],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: title,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account? "),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
                                ],
                              ))
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
