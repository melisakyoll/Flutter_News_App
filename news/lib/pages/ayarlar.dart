import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/auth/girisYap.dart';

class Ayarlar extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/Anasayfa");
          },
        ),
        title: Text(
          "Ayarlar",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
                    child: Text(
                      "Yeni Bir Yaşam İçin",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7b0707),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings_applications,
                    color: Colors.green[700],
                  ),
                  title: Text("Uygulama Ayarları"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.red,
                  ),
                  title: Text("Bildirim Ayarları"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.visibility,
                    color: Colors.blueAccent,
                  ),
                  title: Text("Görünüm Ayarları"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.orange[400],
                  ),
                  title: Text("Dil"),
                ),
                Divider(
                  thickness: 1.5,
                  height: 15.0,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment_ind,
                    color: Colors.grey[800],
                  ),
                  title: Text("Geliştrici Hakkında"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.feedback,
                    color: Colors.lightGreen,
                  ),
                  title: Text("Geri Bildirim Gönder"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.grade,
                    color: Colors.yellowAccent,
                  ),
                  title: Text("Uygulamayı Oyla"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.cached,
                    color: Colors.indigoAccent,
                  ),
                  title: Text("Versiyon Bilgisi"),
                ),
                Divider(
                  thickness: 1.5,
                  height: 15.0,
                  color: Colors.grey[400],
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.teal[600],
                  ),
                  title: Text("Çıkış Yap"),
                  onTap: () async {
                    _auth.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => GirisYap(),
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
