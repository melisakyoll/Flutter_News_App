import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/auth/SignIn.dart';
import 'package:news/constant/color_constant.dart';

class Settings extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: buildAppBar(),
      body: Container(
        child: buildList(context),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.instance.darkBurgundy,
      title: Text(
        "Ayarlar",
        style: TextStyle(color: blackColor),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.search, color: blackColor),
        ),
      ],
    );
  }

  ListView buildList(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            buildContainer(),
            ListTile(
              leading: Icon(
                Icons.settings_applications,
                color: ColorConstants.instance.japaneseLaurel,
              ),
              title: Text("Uygulama Ayarları"),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: ColorConstants.instance.darkBurgundy,
              ),
              title: Text("Bildirim Ayarları"),
            ),
            ListTile(
              leading: Icon(
                Icons.visibility,
                color: ColorConstants.instance.easternBlue,
              ),
              title: Text("Görünüm Ayarları"),
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: ColorConstants.instance.goldenGrass,
              ),
              title: Text("Dil"),
            ),
            buildDivider(),
            ListTile(
              leading: Icon(
                Icons.assignment_ind,
                color: ColorConstants.instance.downy,
              ),
              title: Text("Geliştrici Hakkında"),
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: ColorConstants.instance.neptune,
              ),
              title: Text("Geri Bildirim Gönder"),
            ),
            ListTile(
              leading: Icon(
                Icons.grade,
                color: ColorConstants.instance.starship,
              ),
              title: Text("Uygulamayı Oyla"),
            ),
            ListTile(
              leading: Icon(
                Icons.cached,
                color: ColorConstants.instance.yellowGreen,
              ),
              title: Text("Versiyon Bilgisi"),
            ),
            buildDivider(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: ColorConstants.instance.sage,
              ),
              title: Text("Çıkış Yap"),
              onTap: () async {
                _auth.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
            ),
          ],
        )
      ],
    );
  }

  Container buildContainer() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
        child: Text(
          "Yeni Bir Yaşam İçin",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: ColorConstants.instance.darkBurgundy,
          ),
        ),
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      thickness: 1.5,
      height: 15.0,
      color: grey,
    );
  }
}
