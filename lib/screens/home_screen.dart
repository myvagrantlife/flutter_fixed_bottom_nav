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
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250),
              Text('Home Screen'),
              SizedBox(height: 10),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(DetailScreen.route());
                },
                child: Text('view detail'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
