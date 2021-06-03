import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    //var url = Uri.parse('https://loripsum.net/api/plaintext');
    var url = Uri.parse('https://example.com/foobar.txt');
    var response = await http.get(url);
    var text = response.body;

    return text;
  }
}
