import 'package:flutter/material.dart';
import 'dart:async';
import '../../api/carros_api.dart';
import '../../bloc/carros_bloc.dart';
import '../../entity/usuario.dart';
import '../../entity/carro.dart';
import 'text_error.dart';

class CarrosListView extends StatelessWidget {
  final String tipo;
  const CarrosListView(this.tipo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          Carro carro = lista[index];
            return _item(carro);
        }
      )
    );
  }

  Widget _item(Carro c) {
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
            _buttonBar(c),
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

  Widget _buttonBar(Carro c) {
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