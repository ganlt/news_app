import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';

class MyAboutNewsPage extends StatefulWidget {
  MyAboutNewsPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _MyAboutNewsPageState createState() => _MyAboutNewsPageState();
}

class _MyAboutNewsPageState extends State<MyAboutNewsPage> {

  // final EdgeInsets _padding = MediaQuery.of(context).padding;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          '关于我',
          style: TextStyle(color: NewsColors.white,),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '当前版本：V1.0.0'
              )
            ],
          )
        ],
      )
    );
  }
}
