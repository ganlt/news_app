import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';

class NewsRecommendPage extends StatefulWidget {
  NewsRecommendPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _NewsRecommendPageState createState() => _NewsRecommendPageState();
}

class _NewsRecommendPageState extends State<NewsRecommendPage> {

  // final EdgeInsets _padding = MediaQuery.of(context).padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.tightFor(height: 164.0),
          decoration: BoxDecoration(
            color: NewsColors.primarySwatch
          ),
        ),
      ],
    );
  }
}
