import 'package:flutter/material.dart';

class RaisedButtonCustom extends StatelessWidget {
  bool showProgress;
  String _text;
  Function onPressed;

  RaisedButtonCustom(this._text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, child: 
      RaisedButton(
        color: Colors.blue, 
        child: _efeito(),
        onPressed: onPressed)
      );
  }

  Widget _efeito() {
    if (this.showProgress) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          )
        );
    }
    return Text(
      _text, 
      style: TextStyle(
        color: Colors.white, 
        fontSize: 20
      )
    );
  }
}