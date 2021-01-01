import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/screen/SplashScreen.dart';
import 'auth/girisYap.dart';
import 'pages/anasayfa.dart';
import 'pages/ayarlar.dart';
import 'auth/kayit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (BuildContext context) => SplashScreen(),
      "/Anasayfa": (BuildContext context) => Anasayfa(),
      "/Giris": (BuildContext context) => GirisYap(),
      "/Kayit": (BuildContext context) => KayitOl(),
      "/Ayarlar": (BuildContext context) => Ayarlar(),
    },
  ));
}
