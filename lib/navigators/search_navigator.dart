import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/search_screen.dart';
import 'package:flutter_fixed_bottom_nav/widgets/bottom_navigation.dart';

class SearchNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  SearchNavigator({
    this.navigatorKey,
    this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return SearchScreen.route();
      },
    );
  }
}
