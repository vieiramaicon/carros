import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    print('a');
    //var url = Uri.parse('https://loripsum.net/api/plaintext');
    var url = Uri.parse('https://example.com/foobar.txt');
    print('b');
    var response = await http.get(url);
    print('c');
    var text = response.body;
    print('d');

    return text;
  }
}
