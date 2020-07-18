import 'dart:convert';

import 'package:flutter_news/helper/constant.dart';
import 'package:flutter_news/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> news = [];

  Future<void> getNews() async {

  String url = "https://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);

  if(jsonData['status'] == 'ok'){
    jsonData['articles'].forEach((element) {
      if(element['urlToImage'] != null && element['description'] != null){
        Article article = Article(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          urlToImage: element['urlToImage'],
          publishedAt: DateTime.parse(element['publishedAt']),
          content: element['content'],
          articleUrl: element['url']
        );
        news.add(article);
      }
    });
  }

}

}

class NewsForCategory {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) {
        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
              articleUrl: element['url']
          );
          news.add(article);
        }
      });
    }

  }
}