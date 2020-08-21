import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return CategoryScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Container(
        child: Center(
          child: Text('Category Screen'),
        ),
      ),
    );
  }
}
