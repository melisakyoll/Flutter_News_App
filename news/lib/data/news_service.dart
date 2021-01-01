import 'dart:convert';

import 'package:news/models/article.dart';
import 'package:news/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }
  static Future<List<Articles>>getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=3618b01c9acc4736afae75a85d4eee2d';
    final response = await http.get(url);
    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
