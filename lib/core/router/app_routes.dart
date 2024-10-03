import 'package:flutter/material.dart';
import 'package:qazo_namozlar/feature/presentation/pages/language_page/language_page.dart';
import 'package:qazo_namozlar/feature/presentation/pages/splash_page/splash_page.dart';

part 'name_route.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case Routes.language:
        return MaterialPageRoute(
          builder: (context) => const LanguagePage(),
        );
    }
    return null;
  }
}
