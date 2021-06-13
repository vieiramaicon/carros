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
    Future futureTime = Future.delayed(Duration(seconds: 5));
    Future.wait([futureDB, futureTime]).then( (_) => Navigator.of(context).pushReplacementNamed('/LogiPage'))
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