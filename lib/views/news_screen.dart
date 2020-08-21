import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:news_app/views/news_detail_screen.dart';
import 'package:news_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "News",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: NewsGrid(
          articles: listViewModel.articles,
        ));
  }
}
