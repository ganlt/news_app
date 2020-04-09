import 'dart:async';
import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
// import 'package:news_app/common/localization/default_localizations.dart';
import 'package:news_app/common/style/style.dart';
import 'package:news_app/common/utils/common_utils.dart';
// import 'package:news_app/common/utils/navigator_utils.dart';
// import 'package:news_app/page/dynamic/dynamic_page.dart';
import 'package:news_app/page/my/my_page.dart';
import 'package:news_app/page/recommend/recommend_page.dart';
import 'package:news_app/page/video/video_page.dart';
import 'package:news_app/page/classification/classification_page.dart';
import 'package:news_app/widget/tabbar_widget.dart';
// import 'package:news_app/widget/titlebar_widget.dart';

class NewsHomePage extends StatelessWidget {
  static final String sName = "home";

  /// 不退出
  Future<bool> _dialogExitApp(BuildContext context) async {
    ///如果是 android 回到桌面
    if (Platform.isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: "android.intent.category.HOME",
      );
      await intent.launch();
    }

    return Future.value(false);
  }

  _renderTab(image, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // new Icon(icon, size: 24.0,),
          new Image(
            image: new AssetImage(image),
            color: NewsColors.primaryTabValue,
          ),
          new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(NewsICons.TAB_RECOMMEND, CommonUtils.getLocale(context).home_recommend),
      _renderTab(NewsICons.TAB_VIDEO, CommonUtils.getLocale(context).home_video),
      _renderTab(NewsICons.TAB_CLASSIFICATION, CommonUtils.getLocale(context).home_classification),
      _renderTab(NewsICons.TAB_MY, CommonUtils.getLocale(context).home_my),
    ];
    ///增加返回按键监听
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new NewsTabBarWidget(
        type: NewsTabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new NewsRecommendPage(),
          new NewsVideoPage(),
          new NewsClassificationPage(),
          new NewsMyPage(),
        ],
        backgroundColor: NewsColors.primarySwatch,
        indicatorColor: NewsColors.white,
      ),
    );
  }
}
