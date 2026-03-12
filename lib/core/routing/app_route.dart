import 'package:flutter/material.dart';
import 'package:islamic/core/routing/routes.dart';
import 'package:islamic/features/home/presentation/view/home_view.dart';
import 'package:islamic/features/prayer/presentation/view/prayer_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.prayerView:
        return MaterialPageRoute(builder: (_) => const PrayerView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
