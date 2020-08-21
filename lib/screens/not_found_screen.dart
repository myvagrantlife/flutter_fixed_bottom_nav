import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return NotFoundScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Container(
        child: Center(
          child: Text('Not Found Screen'),
        ),
      ),
    );
  }
}
