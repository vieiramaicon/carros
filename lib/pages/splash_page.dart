import 'package:flutter/material.dart';
import '../entity/db_helper.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    
    Future futureDB = DatabaseHelper().db;
    Future futureTime = Future.delayed(Duration(seconds: 3));
    Future.wait([futureDB]).then((values) {
      Navigator.of(context).pushReplacementNamed('/LoginPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center( 
        child: CircularProgressIndicator(),
      )
    );
  }
}