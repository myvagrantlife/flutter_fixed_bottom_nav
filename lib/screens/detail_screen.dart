import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return DetailScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Container(
        child: Center(
          child: Text('Detail Screen'),
        ),
      ),
    );
  }
}
