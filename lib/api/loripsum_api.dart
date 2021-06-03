import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = Uri.https('https://loripsum.net/api/plaintext');
    var response = http.get(url);
    var text = response.body;

    return text;
  }
}
