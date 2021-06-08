import 'package:http/http.dart' as http;
import 'dart:convert';
import '../entity/carro.dart';
import '../entity/usuario.dart';
import '../entity/carro_dao.dart';

class TipoCarro {
  static final String classicos = 'classicos';
  static final String esportivos = 'esportivos';
  static final String luxo = 'luxo';
}

class CarrosAPI {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['Authorization'] = 'Bearer ${user.token}';

    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');
    var response = await http.get(url, headers: headers);

    var lista = jsonDecode(response.body);
    lista = lista.map<Carro>((map) => Carro.fromJson(map)).toList();
    lista = lista.where((carro) => carro.urlFoto != null).toList();

    final dao = CarroDAO();

    return lista;
  }
}
