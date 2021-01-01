import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KayitOl extends StatefulWidget {
  KayitOl({Key key}) : super(key: key);

  @override
  _KayitOlState createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
 final _key = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  //bool key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7b0707),
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
                  style: TextStyle(color: Colors.white),
                  controller: namecontroller,
                  keyboardType: TextInputType.name,
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
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    hintText: "İsim - Soyisim",
                    hintStyle: TextStyle(color: Colors.white),
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
                  style: TextStyle(color: Colors.white),
                  controller: mailcontroller,
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
                  controller: passcontroller,
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
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xff7b0707),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: new BorderRadius.circular(20.0)),
                          elevation: 15.0,
                          child: Text("Kayıt Ol",
                              style: TextStyle(color: Colors.white)),
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
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
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
