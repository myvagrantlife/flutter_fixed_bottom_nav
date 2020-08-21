import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/favorites_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/history_screen.dart';

class AccountScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return AccountScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
      ),
      body: ListView(
        children: [
          Container(
            child: ListTile(
              title: Text('Favorites'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => {
                Navigator.of(context).push(FavoritesScreen.route()),
              },
            ),
          ),
          Container(
            child: ListTile(
              title: Text('History'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => {
                Navigator.of(context).push(HistoryScreen.route()),
              },
            ),
          ),
        ],
      ),
    );
  }
}
