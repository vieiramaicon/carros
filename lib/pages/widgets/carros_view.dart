import 'package:flutter/material.dart';
import 'dart:async';
import '../../api/carros_api.dart';
import '../../bloc/carros_bloc.dart';
import '../../entity/usuario.dart';
import '../../entity/carro.dart';
import 'carros_list_view.dart';
import 'text_error.dart';

class CarrosView extends StatefulWidget {
  final String tipo;
  const CarrosView(this.tipo);

  @override
  _CarrosView createState() => _CarrosView();
}

class _CarrosView extends State<CarrosView> with AutomaticKeepAliveClientMixin<CarrosView> {
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
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child:CarrosListView(carros)
        );
      }
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(widget.tipo); 
  }
}