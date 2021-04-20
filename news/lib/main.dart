import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/login/sign_in.dart';
import 'package:news/login/sign_up.dart';
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
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFFEF6C00),
          accentColor: Color(0xFFEF6C00),
          iconTheme: IconThemeData(color: Colors.white)),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => SplashScreen(),
        "/Anasayfa": (BuildContext context) => HomePage(),
        "/Giris": (BuildContext context) => GirisYap(),
        "/Kayit": (BuildContext context) => KayitOl(),
        "/Ayarlar": (BuildContext context) => Ayarlar(),
      },
      home: SplashScreen(),
    );
  }
}

