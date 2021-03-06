import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  static Route<dynamic> route(int id) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryScreen(id);
      },
    );
  }

  final int id;

  CategoryScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category $id'),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            itemCount: 10,
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
        ),
      ),
    );
  }
}
