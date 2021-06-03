import 'dart:async';
import 'package:http/http.dart' as http;
import '../api/loripsum_api.dart';
import 'simple_bloc.dart';

class LoripsumBloc extends SimpleBloc<String> {
  void fetch() async {
    var url = Uri.parse('https://loripsum.net/api/plaintext');
    var response = await http.get(url);
    var text = response.body;

    try {
      //var text = await LoripsumApi.getLoripsum();
      add(text);
    } catch (e) {
      addError(e);
    }
  }
}
