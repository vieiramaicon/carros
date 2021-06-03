import 'package:http/http.dart' as http;
import 'dart:convert';
import '../entity/usuario.dart';
import '../entity/response_api.dart';

class LoginApi {
  static Future<ResponseAPI<Usuario>> login(String login, String senha) async {
    try {
      var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

      Map<String, String> headers = {};
      headers['Content-Type'] = 'application/json';

      Map<String, String> mapBody = {};
      mapBody['username'] = login;
      mapBody['password'] = senha;
      String body = jsonEncode(mapBody);

      var response = await http.post(url, headers: headers, body: body);
      Map mapResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final Usuario user = Usuario.fromJson(mapResponse);
        user.save();
        return ResponseAPI.ok(user);
      }

      return ResponseAPI.error(mapResponse['error']);
    } catch (error) {
      return ResponseAPI.error('Não foi possível fazer login.');
    }
  }
}
