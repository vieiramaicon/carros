import 'package:flutter/material.dart';
import 'dart:async';
import '../../api/carros_api.dart';
import '../../bloc/carros_bloc.dart';
import '../../entity/usuario.dart';
import '../../entity/carro.dart';
import 'carros_list_view.dart';
import 'text_error.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;
  const CarrosPage(this.tipo);

  @override
  _CarrosPage createState() => _CarrosPage();
}

class _CarrosPage extends State<CarrosPage> with AutomaticKeepAliveClientMixin<CarrosPage> {
  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.fetch(widget.tipo);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<List<Carro>>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError('Não foi possível buscar os carros!');
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<Carro> carros = snapshot.data;
        return CarrosListView(carros);
      }
    );
  }
}