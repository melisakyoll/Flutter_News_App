import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff7b0707),
              ),
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "YENİ YAŞAM",
                      style: TextStyle(color: Colors.white, fontSize: 37.0),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.deepOrangeAccent,
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
                color: Colors.teal[600],
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
                      color: Colors.green[400],
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
                      color: Colors.lightBlue[200],
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
                      color: Colors.grey[800],
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
                color: Colors.grey[800],
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
