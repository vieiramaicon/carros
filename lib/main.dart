import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/carro_page.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/SplashPage',
      routes: {
        '/': (context) => LoginPage(),
        '/SplashPage': (context) => SplashPage(),
        '/HomePage': (context) => HomePage(),
        '/CarroPage': (context) => CarroPage(),
      }
    );
  }
}