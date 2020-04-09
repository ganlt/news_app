import 'package:flutter/material.dart';
import 'package:news_app/redux/theme_redux.dart';
import 'package:news_app/redux/locale_redux.dart';
// 创建state类
class NewsState {
  ThemeData themeData;
  Locale locale;
  Locale platformLocale;
  // 构造方法
  NewsState({
    this.themeData,
    this.locale
  });
}

NewsState appReducer(NewsState state, action) {
  return NewsState(
    themeData: ThemeDataReducer(state.themeData, action ),
    locale: LocaleReducer(state.locale, action),
  );
}