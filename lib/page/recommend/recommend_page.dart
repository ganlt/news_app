import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';

class NewsRecommendPage extends StatefulWidget {
  NewsRecommendPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _NewsRecommendPageState createState() => _NewsRecommendPageState();
}

class _NewsRecommendPageState extends State<NewsRecommendPage> {

  _renderItem() {
    return Card(
      child: Text('hello'),
    );
  }
  // final EdgeInsets _padding = MediaQuery.of(context).padding;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _renderItem()
      ],
    );
  }
}
