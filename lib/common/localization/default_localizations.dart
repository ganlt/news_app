import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/common/style/string_base.dart';
import 'package:news_app/common/style/string_en.dart';
import 'package:news_app/common/style/string_zh.dart';

///自定义多语言实现
class NewsLocalizations {
  final Locale locale;

  NewsLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///XSStringEn和XSStringZh都继承了XSStringBase
  static Map<String, NewsStringBase> _localizedValues = {
    'en': new NewsStringEn(),
    'zh': new NewsStringZh(),
  };

 NewsStringBase get currentLocalized {
    if(_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 Localizations
  ///获取对应的 StringBase
  static NewsLocalizations of(BuildContext context) {
    return Localizations.of(context, NewsLocalizations);
  }
}
