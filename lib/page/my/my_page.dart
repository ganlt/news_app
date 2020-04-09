import 'package:flutter/material.dart';
import 'package:news_app/common/style/style.dart';
import 'package:news_app/common/utils/navigator_utils.dart';

// import 'package:news_app/page/my/my_News_track.dart';
// import 'package:news_app/page/my/my_box.dart';
// import 'package:news_app/page/my/my_dynamic_page.dart';
// import 'package:news_app/page/my/my_imo.dart';
// import 'package:news_app/page/my/my_ranking_page.dart';
// import 'package:news_app/page/my/my_setting_page.dart';
// import 'package:news_app/page/my/my_task_page.dart';

class NewsMyPage extends StatefulWidget {
  NewsMyPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _NewsMyPageState createState() => _NewsMyPageState();
}

class _NewsMyPageState extends State<NewsMyPage> {

  _renderItem(image, text, index, page) {

    var borderWidth = index == 2 || index == 5 ? 9.0 : 3.0;

    return new Container(
      padding: EdgeInsets.fromLTRB(2.0, 5.0, 0, 5.0),
      constraints: BoxConstraints.tightFor(width: double.infinity),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: NewsColors.primaryLineValue,
            width: borderWidth,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: FlatButton(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 14.0),
                    child: new Image(
                      image: new AssetImage(image),
                      width: 28,
                      height: 28,
                      color: NewsColors.primarySwatch,
                    ),
                  ),
                  Text(
                    text,
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Image(
                    image: new AssetImage(NewsICons.MY_EXPAND),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
        onPressed: () {
          NavigatorUtils.NavigatorRouter(context, page);
        },
      ),
    );
  }

  // final EdgeInsets _padding = MediaQuery.of(context).padding;
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset('assets/images/avatar.jpg', width: 66.0);
    List<Widget> _items = [
      // _renderItem(NewsICons.MY_MY_TASK, '我的任务', 1, MyTaskPage()),
      // _renderItem(NewsICons.MY_MY_TRACK, '行善轨迹', 2, NewsTrackPage()),
      // _renderItem(NewsICons.MY_MY_RANKING, '我的排名', 3, MyRankingPage()),
      // _renderItem(NewsICons.MY_MY_BOX, '我的宝箱', 4, MyBox()),
      // _renderItem(NewsICons.MY_MY_IMO, '我的imo+', 5, MyIMO()),
      // _renderItem(NewsICons.MY_MY_DYNAMIC, '我的动态', 6, MyDynamicPage()),
      // _renderItem(NewsICons.MY_MY_SETTING, '更多设置', 7, MySettingPage()),
    ];
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.tightFor(height: 164.0),
          decoration: BoxDecoration(
            color: NewsColors.primarySwatch
          ),
          child: Row(
            children: <Widget>[
              FlatButton(
                child: Container(
                  padding: EdgeInsets.fromLTRB(21.0, 16.0, 16.0, 16.0),
                  child: ClipOval(
                    child: avatar,
                  ),
                ),
                onPressed: () {
                  // NavigatorUtils.goLogin(context);
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      '行小善',
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '行善号: xingxiaoshan',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        _items[0],
        _items[1],
        _items[2],
        _items[3],
        _items[4],
        _items[5],
        _items[6],
      ],
    );
  }
}
