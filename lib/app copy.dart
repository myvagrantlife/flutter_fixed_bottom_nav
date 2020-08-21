import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/widgets/bottom_navigation.dart';
import 'package:flutter_fixed_bottom_nav/navigators/home_navigator.dart';
import 'package:flutter_fixed_bottom_nav/navigators/library_navigator.dart';
import 'package:flutter_fixed_bottom_nav/navigators/search_navigator.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.home;

  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.library: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.search),
          _buildOffstageNavigator(TabItem.library),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    Widget navigator;
    switch (tabItem) {
      case TabItem.home:
        navigator = HomeNavigator();
        break;
      case TabItem.search:
        navigator = SearchNavigator();
        break;
      case TabItem.library:
        navigator = LibraryNavigator();
        break;
      default:
    }

    return Offstage(
      offstage: _currentTab != tabItem,
      child: navigator,
    );
  }
}
