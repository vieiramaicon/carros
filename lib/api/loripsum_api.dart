import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v1/carros/');
    var response = await http.get(url);
    var text = response.body;

    return text;
  }
}
