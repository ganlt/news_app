import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/redux/state.dart';
import 'package:news_app/common/style/style.dart';
import 'package:news_app/common/utils/navigator_utils.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
    ///防止多次进入
    Store<NewsState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      // UserDao.initUserInfo(store).then((res) {
      //   if (res != null && res.result) {
          NavigatorUtils.goHome(context);
      //   } else {
      //     NavigatorUtils.goLogin(context);
      //   }
      //   return true;
      // });
    });
  }


  @override
  Widget build(BuildContext context) {
    return StoreBuilder<NewsState>(
      builder: (context, store) {
        double size = 200;
        return new Container(
          color: NewsColors.white,
          child: Column(
            children: <Widget>[
              new Center(
                child: new Text(
                  'Welcome.'
                )
              ),
            ],
          ),
        );
      },
    );
  }
}
