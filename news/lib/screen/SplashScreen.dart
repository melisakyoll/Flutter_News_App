import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/auth/SignIn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7b0707),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          SpinKitFadingFour(color: Colors.white, size: 100),
          //Image.asset('/assets/_logo.png'),
        ],
      ),
    );
  }
}
