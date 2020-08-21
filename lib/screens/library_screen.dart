import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return LibraryScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: Container(
        child: Center(
          child: Text('Library Screen'),
        ),
      ),
    );
  }
}
