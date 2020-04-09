import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/common/event/http_error_event.dart';
import 'package:news_app/common/event/index.dart';
import 'package:news_app/redux/state.dart';
import 'package:news_app/common/utils/common_utils.dart';
import 'package:news_app/common/localization/localizations_delegate.dart';
import 'package:news_app/common/style/style.dart';
import 'package:news_app/common/net/code.dart';

import 'package:news_app/page/welcome_page.dart';
import 'package:news_app/page/home/home_page.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = new Store<NewsState>(
    appReducer,
    initialState: new NewsState(
      themeData: CommonUtils.getThemeData(NewsColors.primarySwatch),
      locale: Locale('zh', 'CH'),
    ),
  );

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: StoreBuilder<NewsState>(builder: (context, store) {
        return new MaterialApp(
          title: '行善',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            NewsLocalizationsDelegate.delegate,
          ],
          theme: store.state.themeData,
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
          routes: {
            WelcomePage.sName: (context) {
              store.state.platformLocale = WidgetsBinding.instance.window.locale;
              return WelcomePage();
            },
            NewsHomePage.sName: (context) {
              ///通过 Localizations.override 包裹一层，
              return new NewsHomePage();
            },
          },
        );
      }),
    );
  }
}

class NewsLocalizations extends StatefulWidget {
  final Widget child;

  NewsLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<NewsLocalizations> createState() {
    return new _NewsLocalizations();
  }
}

class _NewsLocalizations extends State<NewsLocalizations> {
  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<NewsState>(builder: (context, store) {
      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    ///Stream演示event bus
    stream = eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  ///网络错误提醒
  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error);
        break;
      case 401:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_401);
        break;
      case 403:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_403);
        break;
      case 404:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_404);
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_timeout);
        break;
      default:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_unknown +
                " " +
                message);
        break;
    }
  }
}
