import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rahat/views/signinScreen.dart';
import 'package:rahat/views/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return MaterialApp(
      title: 'Rahat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffF47216),
        scaffoldBackgroundColor: Colors.black
      ),
      home: SplashScreen(),
    );
  }
}