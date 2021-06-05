import '../api/carros_api.dart';
import 'simple_bloc.dart';
import '../entity/carro.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<void> fetch(String tipo) async {
    try {
      List<Carro> carros = await CarrosAPI.getCarros(tipo);
      add(carros);
      //return carros;
    } catch(e) {
      addError(e);
    }
  }
}