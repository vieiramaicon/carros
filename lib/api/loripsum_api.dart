import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    print('Entrou');
    var url = Uri.parse('https://loripsum.net/api/plaintext');
    var response = await http.get(url);
    var text = response.body;
    print('saiu');

    return text;
  }
}
