import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rahat/common/ui_constants.dart';
import 'package:rahat/views/signinScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigate);
  }

  void navigate() async {
    // var auth = await AuthService.getSavedAuth();
    // if (auth != null) {

    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return IntegrationScreen();
    //   }));
    // } else {
    //   print("Going to login screen");
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return LoginPage();
    //   }));
    // }
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return SignInScreen();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        UIConstants.logo,
        height: UIConstants.fitToHeight(250, context),
        width: UIConstants.fitToWidth(250, context),
        fit: BoxFit.cover,
      )),
    );
  }
}
