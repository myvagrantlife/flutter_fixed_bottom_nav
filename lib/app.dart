import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/widgets/bottom_navigation.dart';
import 'package:flutter_fixed_bottom_nav/screens/home_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/library_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/not_found_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/search_screen.dart';

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
    return Offstage(
      offstage: _currentTab != tabItem,
      child: Navigator(
        key: _navigatorKeys[tabItem],
        onGenerateRoute: (settings) {
          switch (tabItem) {
            case TabItem.home:
              return HomeScreen.route();
              break;
            case TabItem.search:
              return SearchScreen.route();
              break;
            case TabItem.library:
              return LibraryScreen.route();
              break;
            default:
              return NotFoundScreen.route();
          }
        },
      ),
    );
  }
}
