import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:news/pages/anasayfa.dart';
//import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class GirisYap extends StatefulWidget {
  GirisYap({Key key}) : super(key: key);

  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7b0707),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              Container(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 120.0,
                ),
              ),
              SizedBox(
                height: 30.0,
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
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    hintText: "E - Mail",
                    hintStyle: TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key_outlined,
                      color: Colors.white,
                    ),
                    hintText: "Şifre Giriniz",
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60.0, 8.0, 60.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          //_signInWithEmailAndPassword();
                        }
                      },
                      color: Color(0xff7b0707),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: new BorderRadius.circular(20.0)),
                      elevation: 15.0,
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Color(0xff7b0707),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: new BorderRadius.circular(20.0)),
                      elevation: 15.0,
                      child: Text("Kayıt Ol",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/Kayit");
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60.0, 35.0, 60.0, 8.0),
                child: Column(
                  children: [
                    _SignInProv(
                      infoText: "Anonim  giriş yap",
                      buttonType: Buttons.Quora,
                      signInMethod: () async => _anonymouslySing(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _anonymouslySing() async {
    await _auth.signInAnonymously();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Anasayfa()));
  }
}

class _SignInProv extends StatefulWidget {
  final String infoText;
  final Buttons buttonType;
  final Function signInMethod;

  const _SignInProv({
    Key key,
    @required this.infoText,
    @required this.buttonType,
    @required this.signInMethod,
  }) : super(key: key);

  @override
  __SignInProvState createState() => __SignInProvState();
}

class __SignInProvState extends State<_SignInProv> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        child: SignInButton(
          widget.buttonType,
          text: widget.infoText,
          onPressed: () async => widget.signInMethod(),
        ),
      ),
    );
  }
}
