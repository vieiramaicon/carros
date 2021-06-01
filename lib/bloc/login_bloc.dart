import '../api/login_api.dart';
import 'simple_bloc.dart';
import '../entity/response_api.dart';
import '../entity/usuario.dart';

class LoginBloc extends SimpleBloc<bool> {
  Future<ResponseAPI<Usuario>> login(String login, String senha) async {
    add(true);
    final response = await LoginApi.login(login, senha);
    add(false);

    return response;
  }
}