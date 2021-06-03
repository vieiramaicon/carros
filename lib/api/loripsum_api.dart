import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = Uri.parsse('https://loripsum.net/api/plaintext');
    var response = await http.read(url);
    var text = response.body;

    return text;
  }
}
