import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';
import 'package:news_app/views/news_detail_screen.dart';
import 'package:news_app/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({Key key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(
                        newsArticleViewModel: articles[index],
                      )));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: CircleImage(
                urlToImage: articles[index].urlToImage,
              ),
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              articles[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
