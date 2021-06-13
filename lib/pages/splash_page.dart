import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center( 
        child:CircularProgressIndicator(),
      )
    );
  }
}