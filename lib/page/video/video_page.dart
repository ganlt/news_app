import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';

class NewsVideoPage extends StatefulWidget {
  NewsVideoPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _NewsVideoPageState createState() => _NewsVideoPageState();
}

class _NewsVideoPageState extends State<NewsVideoPage> {

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
