import 'package:dio/dio.dart';
import 'package:news_app/models/news_article.dart';

class NewsAPI {
  var dio = Dio();

  Future<List<NewsArticle>> fetchArticle() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=kr&apiKey=05c75ed4750e491da8b5931d8049ee97";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((item) => NewsArticle.fromJson(item)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }
}
