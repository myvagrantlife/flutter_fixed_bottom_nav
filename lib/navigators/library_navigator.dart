import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/library_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/detail_screen.dart';
import 'package:flutter_fixed_bottom_nav/widgets/bottom_navigation.dart';

class LibraryNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class LibraryNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  LibraryNavigator({
    this.navigatorKey,
    this.tabItem,
  });

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      LibraryNavigatorRoutes.root: (context) => LibraryScreen(),
      LibraryNavigatorRoutes.detail: (context) => DetailScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: LibraryNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
