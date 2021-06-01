import 'prefs.dart';
import 'dart:convert';

class Usuario {
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  Usuario.fromJson(Map<String, dynamic> map)
      : this.login = map['login'],
        this.nome = map['nome'],
        this.email = map['email'],
        this.urlFoto = map['urlFoto'],
        this.token = map['token'],
        this.roles = map['roles'] != null ? map['roles'].map<String>((x) => x.toString()).toList() : null;
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['login'] = this.login;
    map['nome'] = this.nome;
    map['email'] = this.email;
    map['urlFoto'] = this.urlFoto;
    map['token'] = this.token;
    map['roles'] = this.roles;

    return map;
  }

  void save() {
    Map map = toJson();
    String json = jsonEncode(map);
    Prefs.setString('user.prefs', json);
  }

  static void clear() {
    Prefs.setString('user.prefs', '');
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString('user.prefs');
    if(json.isEmpty) {
      return null;
    }
    Map map = jsonDecode(json);
    return Usuario.fromJson(map);  
  }

  String toString() {
    String msg = 'Login: ${this.login}\n';
    msg += 'Nome: ${this.nome}\n';
    msg += 'Email: ${this.email}';

    return msg;
  }
}