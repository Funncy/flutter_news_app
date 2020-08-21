import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  //초기에 로딩 데이터 없음
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  //기사 가져오기
  void topHeadLines() async {
    //기사 가져오고 현재 상태 로딩중으로 변경
    List<NewsArticle> newsArticles = await NewsAPI().fetchArticle();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles
        .map((item) => NewsArticleViewModel(newsArticle: item))
        .toList();

    //가져온 데이터가 비어있으면 빈 상태 아니면 성공 상태
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
