
import 'package:flutter/material.dart';
import 'package:news/view/add_news_page.dart';

import '../../view/home_page.dart';
import '../../view/info_page.dart';


class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;

  RouteGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigator(const HomePage());
      case "info":
        return _navigator( const InfoPage(data: {},));
      case "profile":
        return _navigator(const AddNewsPage() );
    }
  }

  MaterialPageRoute _navigator(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
