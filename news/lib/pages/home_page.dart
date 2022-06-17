import 'package:flutter/material.dart';
import 'package:news/constant/color_constant.dart';
import 'package:news/data/news_service.dart';
import 'package:news/models/article.dart';
import 'package:news/screen/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: buildAppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return buildNews(index);
          },
        ),
      ),
      drawer: DrawerMenu(),
    );
  }

  Card buildNews(int index) {
    return Card(
      child: Column(
        children: [
          Image.network(articles[index].urlToImage),
          ListTile(
            title:
                Text(articles[index].title, style: TextStyle(fontSize: 19.0)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15.0),
            child: Text(articles[index].description),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  launch(articles[index].url);
                },
                child: Text("Habere Git"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: secondary,
    title: Text(
      "YENİ YAŞAM",
      style: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
  );
}
