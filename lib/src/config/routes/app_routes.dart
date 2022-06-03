import 'package:flutter/material.dart';

import '../../domain/entities/article.dart';
import '../../presentation/views/breaking_news_view.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BreakingNewsView());

      default:
        return _materialRoute(const BreakingNewsView());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
