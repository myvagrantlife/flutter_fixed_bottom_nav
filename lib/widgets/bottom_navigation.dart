import 'package:flutter/material.dart';

enum TabItem { home, search, library }

Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.search: 'search',
  TabItem.library: 'library',
};

Map<TabItem, IconData> tabIcon = {
  TabItem.home: Icons.home,
  TabItem.search: Icons.search,
  TabItem.library: Icons.book,
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.search),
        _buildItem(tabItem: TabItem.library),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        color: _colorIsActive(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorIsActive(item: tabItem),
        ),
      ),
    );
  }

  Color _colorIsActive({TabItem item}) {
    return currentTab == item ? Colors.black87 : Colors.grey;
  }
}
