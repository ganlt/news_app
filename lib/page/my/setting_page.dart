import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';

class MySettingPage extends StatefulWidget {
  MySettingPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _MySettingPageState createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {

  // final EdgeInsets _padding = MediaQuery.of(context).padding;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          '更多设置',
          style: TextStyle(color: NewsColors.white,),
        ),
      ),
      body: ListView()
    );
  }
}
