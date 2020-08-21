import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/category_screen.dart';

class SearchScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return SearchScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CategoryScreen.route(index + 1),
                );
              },
              child: Card(
                child: Center(
                  child: GridTile(
                    child: Text('Category ${index + 1}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
