import 'package:flutter/material.dart';

class TextFormFieldSenha extends StatelessWidget {
  FocusNode focusNode;
  TextEditingController controller;
  FormFieldValidator<String> validator;

  TextFormFieldSenha(
    {
      @required this.controller, 
      @required this.validator,
      @required this.focusNode
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField (
      controller: controller, 
      obscureText: true, 
      validator: validator, 
      keyboardType: TextInputType.number,
      focusNode: focusNode,
      style: TextStyle(
        color: Colors.blue, 
        fontSize: 20
      ), 
      decoration: InputDecoration(
        labelText: 'Senha', 
        labelStyle: TextStyle(
          color: Colors.grey, 
          fontSize: 20
        ), 
        hintText: 'Digite a senha', 
        hintStyle: TextStyle(
          fontSize: 15
        ),
        border: OutlineInputBorder()
      )
    );
  }
}

class TextFormFieldLogin extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String> validator;
  ValueChanged<String> onFieldSubmitted;

  TextFormFieldLogin(
    {
      @required this.controller, 
      @required this.validator,
      @required this.onFieldSubmitted
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: onFieldSubmitted,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20
      ),
      decoration: InputDecoration(
        labelText: 'Login', 
        labelStyle: TextStyle(
          color: Colors.grey, 
          fontSize: 20
        ), 
        hintText: 'Digite o login', 
        hintStyle: TextStyle(
          fontSize: 15
        ),border: OutlineInputBorder()
      )
    );
  }
}