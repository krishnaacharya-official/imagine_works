import 'package:flutter/material.dart';
import 'package:imagine_works/models/user_model.dart';
import 'package:imagine_works/utlis/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _emailKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormState>();
  TextEditingController? _emailAddressController;
  TextEditingController? _password;
  bool _formChecked = false;

  @override
  void initState() {
    super.initState();
    _emailAddressController = TextEditingController();
    _password = TextEditingController();
  }

  SizedBox getHorizontalSpace(double height) {
    return SizedBox(
      height: height,
    );
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
                          getHorizontalSpace(
                            30,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Join ImagineWorks",
                                style: heading,
                              )),
                          getHorizontalSpace(
                            30,
                          ),
                          Text(
                            "Email Address",
                            style: title,
                          ),
                          getHorizontalSpace(
                            10,
                          ),
                          emailField(),
                          getHorizontalSpace(
                            20,
                          ),
                          Text(
                            "Password",
                            style: title,
                          ),
                          getHorizontalSpace(10),
                          passwordField(),
                          getHorizontalSpace(
                            20,
                          ),
                          nextButton(),
                          getHorizontalSpace(
                            10,
                          ),
                          alreadyExists()
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

  Align alreadyExists() {
    return Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            InkWell(
              onTap: () {},
              child: const Text(
                "Login",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ));
  }

  InkWell nextButton() {
    return InkWell(
      onTap: () {
        if (_emailKey.currentState!.validate() &&
            _passKey.currentState!.validate()) {
          User payload = User(_emailAddressController!.text, _password!.text);

          // Use payload.toJson() to send the payload to the api
        }

        setState(() {
          _formChecked = true;
        });
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: Colors.grey),
            gradient: buttonGraident),
        child: Center(
          child: Text(
            "Create",
            style: title,
          ),
        ),
      ),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      key: _passKey,
      obscureText: true,
      validator: (value) {
        if (value == null || _emailAddressController?.text.trim() == "") {
          return "Password can't be empty";
        }
        if (value.length < 8) {
          return 'Password length cannot be less than 8';
        }
        return null;
      },
      controller: _password,
      autovalidateMode:
          _formChecked ? AutovalidateMode.always : AutovalidateMode.disabled,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      key: _emailKey,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || _emailAddressController?.text.trim() == "") {
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
      autovalidateMode:
          _formChecked ? AutovalidateMode.always : AutovalidateMode.disabled,
      decoration: const InputDecoration(
        hintText: 'Email address',
      ),
    );
  }
}
