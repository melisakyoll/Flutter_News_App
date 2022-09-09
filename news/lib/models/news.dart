import 'article.dart';

class News {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  News(
      {required this.status,
      required this.totalResults,
      required this.articles});

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      // ignore: deprecated_member_use
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    return data;
  }
}
