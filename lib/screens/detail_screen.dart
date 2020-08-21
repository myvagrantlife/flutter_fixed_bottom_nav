import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static Route<dynamic> route(int id) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return DetailScreen(id);
      },
    );
  }

  final int id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item $id'),
      ),
      body: Container(
        child: Center(
          child: Text('Detail Screen'),
        ),
      ),
    );
  }
}
