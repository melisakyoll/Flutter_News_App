import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/auth/SignIn.dart';
import 'package:news/auth/SignUp.dart';
import 'package:news/constant/color_constant.dart';

import 'package:news/screen/SplashScreen.dart';
import 'pages/home_page.dart';
import 'pages/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primary,
          // ignore: deprecated_member_use
          accentColor: primary,
          iconTheme: IconThemeData(color: whiteColor)),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => SplashScreen(),
        "/Anasayfa": (BuildContext context) => HomePage(),
        "/Giris": (BuildContext context) => SignIn(),
        "/Kayit": (BuildContext context) => SignUp(),
        "/Ayarlar": (BuildContext context) => Settings(),
      },
      home: SplashScreen(),
    );
  }
}
