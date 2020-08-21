import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticleViewModel newsArticleViewModel;

  const NewsDetailScreen({Key key, this.newsArticleViewModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsArticleViewModel.author ?? "",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
        child: Column(
          children: [
            Text(
              this.newsArticleViewModel.title,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, wordSpacing: 3),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                this.newsArticleViewModel.publishedAt,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Hero(
                tag: newsArticleViewModel.title,
                child: Image.network(newsArticleViewModel.urlToImage ?? "")),
            SizedBox(
              height: 30,
            ),
            Text(
              newsArticleViewModel.description,
              style: TextStyle(fontSize: 16, wordSpacing: 3),
            ),
          ],
        ),
      ),
    );
  }
}
