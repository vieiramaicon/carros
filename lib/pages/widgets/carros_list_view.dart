import 'package:flutter/material.dart';
import 'dart:async';
import '../../api/carros_api.dart';
import '../../bloc/carros_bloc.dart';
import '../../entity/usuario.dart';
import '../../entity/carro.dart';
import 'text_error.dart';

class CarrosListView extends StatelessWidget with AutomaticKeepAliveClientMixin<CarrosListView>{
  final carros;
  
  CarrosListView(this.carros);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          Carro carro = carros[index];
            return _item(carro, context);
        }
      )
    );
  }

  Widget _item(Carro c, BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            _imagemCarro(c),
            _nomeCarro(c),
            _dscCarro(),
            _buttonBar(c, context),
          ]
        )
      )
    );
  }

  Widget _imagemCarro(Carro c) {
    return Center(child: Image.network(c.urlFoto, width: 200));
  }

  Widget _nomeCarro(Carro c) {
    return Text(c.nome, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 25));
  }

  Widget _dscCarro() {
    return Text('descrição...');
  }

  Widget _buttonBar(Carro c, BuildContext context) {
    return ButtonBarTheme(
      data: ButtonBarTheme.of(context),
      child: ButtonBar(
        children: [
          TextButton(
            child: Text('DETALHES'),
            onPressed: () => Navigator.of(context).pushNamed('/CarroPage', arguments: c),
          ),
          TextButton(
            child: Text('SHARE'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}