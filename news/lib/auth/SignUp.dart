// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/constant/color_constant.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  //bool key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Form(
        key: _key,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 100.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "İsism - Soyisim Gereklidir";
                      }
                      return null;
                    },
                    style: TextStyle(color: whiteColor),
                    controller: namecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: whiteColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: whiteColor),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: whiteColor, width: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: whiteColor,
                      ),
                      hintText: "İsim - Soyisim",
                      hintStyle: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "E - Posta Gereklidir";
                      }
                      return null;
                    },
                    style: TextStyle(color: whiteColor),
                    controller: mailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: whiteColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: whiteColor),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: whiteColor, width: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: whiteColor,
                      ),
                      hintText: "E - Mail",
                      hintStyle: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Parola Gereklidir";
                      }
                      return null;
                    },
                    style: TextStyle(color: whiteColor),
                    controller: passcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(color: whiteColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0, color: whiteColor),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: whiteColor, width: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: whiteColor,
                      ),
                      hintText: "Şifre Giriniz",
                      hintStyle: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          color: secondary,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: whiteColor, width: 2.0),
                              borderRadius: new BorderRadius.circular(20.0)),
                          elevation: 15.0,
                          child: Text("Kayıt Ol",
                              style: TextStyle(color: whiteColor)),
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              _register();
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),
                FlatButton(
                  padding: EdgeInsets.only(top: 15.0),
                  onPressed: () {
                    Navigator.pushNamed(context, "/Giris");
                  },
                  child: Text(
                    "Zaten bir hesabın var mı?  Giriş Yap",
                    style: TextStyle(color: whiteColor, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: mailcontroller.text, password: passcontroller.text);
      final User user = userCredential.user;
      if (user != null) {
        setState(() {
          Navigator.popAndPushNamed(context, "/Anasayfa");
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
