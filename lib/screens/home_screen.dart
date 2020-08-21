import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return HomeScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fixed Bottom Nav'),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext content, int index) {
          return Container(
            child: ListTile(
              title: Text('Item ${index + 1}'),
              trailing: Icon(Icons.chevron_right),
              onTap: () => {
                Navigator.of(context).push(DetailScreen.route(index + 1)),
              },
            ),
          );
        },
      ),
    );
  }
}
