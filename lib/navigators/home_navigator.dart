import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/home_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/detail_screen.dart';
import 'package:flutter_fixed_bottom_nav/widgets/bottom_navigation.dart';

class HomeNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class HomeNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  HomeNavigator({
    this.navigatorKey,
    this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeNavigatorRoutes.root,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeNavigatorRoutes.root:
            return HomeScreen.route();
            break;
          case HomeNavigatorRoutes.detail:
            return DetailScreen.route();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
      },
    );
  }
}
