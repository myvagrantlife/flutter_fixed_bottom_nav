import 'package:flutter/material.dart';

import 'package:flutter_fixed_bottom_nav/screens/category_screen.dart';
import 'package:flutter_fixed_bottom_nav/screens/detail_screen.dart';

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
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250),
              Text('Search Screen'),
              SizedBox(height: 10),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(CategoryScreen.route());
                },
                child: Text('view category'),
              ),
              SizedBox(height: 30),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(DetailScreen.route());
                },
                child: Text('view detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
