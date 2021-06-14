import 'package:flutter/material.dart';
import 'dart:async';
import '../bloc/login_bloc.dart';
import '../entity/response_api.dart';
import '../entity/usuario.dart';
import 'widgets/raised_button_custom.dart';
import 'widgets/text_form_custom.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _focusSenha = FocusNode();
  final _bloc = LoginBloc();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'), 
        centerTitle: true), 
      body: _body()
    );
  }

  Widget _body() {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(children: [
            TextFormFieldLogin(
              controller: _tLogin, 
              validator: _validateLogin, 
              onFieldSubmitted: (text) => FocusScope.of(this.context).requestFocus(_focusSenha)),
            SizedBox(
              height: 10,
            ),
            TextFormFieldSenha(
              controller: _tSenha, 
              validator: _validateLogin, 
              focusNode: _focusSenha),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return RaisedButtonCustom(
                  'Login',
                  showProgress: snapshot.data, 
                  onPressed: () => _onClickLogin()
                );
              }
            )
          ]
        ),
      )
    );
  }

  void _onClickLogin() async {
    var login = _tLogin.text;
    var senha = _tSenha.text;
    var formOk = _formKey.currentState.validate();

    if (!formOk) 
      return;

    
    final response = await _bloc.login(login, senha);
    
    if(response.ok){
      Navigator.of(this.context).pushReplacementNamed('/HomePage', arguments: response.data);
    } else {
        _alert(response.msg);
    }
  }

  Widget _alert(String msg) {
    showDialog(
      context: this.context,
      builder: (context) => AlertDialog(
        title: Text('Carros'),
        content: Text(msg),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop()
          )
        ]
      )
    );
  }

  String _validateLogin(String text) {
    return text.isEmpty ? 'Digite o login' : null;
  }

  String _validateSenha(String text) {
    return text.isEmpty ? 'Digite a senha' : null;
  } 
}