import 'dart:async';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = Uri.parse('https://loripsum.net/api/10/short/headers');
    var response = await http.get(url);
    var text = response.body;

    text = text.replaceAll('<p>', '');
    text = text.replaceAll('</p>', '');

    text = text.replaceAll('<h1>', '');
    text = text.replaceAll('</h1>', '');

    return text;
  }
}
