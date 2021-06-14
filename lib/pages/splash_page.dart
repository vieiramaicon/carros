import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../entity/carro.dart';
import '../entity/db_helper.dart';
import '../entity/carro_dao.dart';
import '../entity/usuario.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPage createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    
    Future<Database> futureDB = CarroDao().db;
    Future<void> futureTime = Future.delayed(Duration(seconds: 3));
    Future<Usuario> futureUser = Usuario.get();
    Future.wait([futureTime, futureUser]).then((values) {
      var user = values[1];
      if(user != null) {
        Navigator.of(context).pushReplacementNamed('/HomePage');
      } else {
        Navigator.of(context).pushReplacementNamed('/LoginPage');
      }
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