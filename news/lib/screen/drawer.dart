import 'package:flutter/material.dart';
import 'package:news/constant/color_constant.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: secondary,
              ),
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "YENİ YAŞAM",
                      style: TextStyle(color: whiteColor, fontSize: 37.0),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: deepOrangeAc,
              ),
              title: Text(
                "Hesabım",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              leading: Icon(
                Icons.bookmark,
                color: tealColor,
              ),
              title: Text(
                "Kategoriler",
                style: TextStyle(fontSize: 17.0),
              ),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.assessment,
                      color: grColor,
                    ),
                    title: Text(
                      "Ekonomi",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.public,
                      color: lightBlueColor,
                    ),
                    title: Text(
                      "Dünya",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.devices,
                      color: grey8,
                    ),
                    title: Text(
                      "Teknoloji",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.face,
                color: Colors.brown,
              ),
              title: Text(
                "Basında Biz",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
                color: Colors.green[800],
              ),
              title: Text(
                "İletişim",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: grey8,
              ),
              title: Text(
                "Ayarlar",
                style: TextStyle(fontSize: 17.0),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/Ayarlar");
              },
            ),
          ],
        ),
      ),
    );
  }
}
