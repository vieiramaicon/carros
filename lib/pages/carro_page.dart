import 'package:flutter/material.dart';
import '../api/loripsum_api.dart';
import '../bloc/loripsum_bloc.dart';
import '../entity/carro.dart';

class CarroPage extends StatefulWidget {
  @override
  _CarroPage createState() => _CarroPage();
}

class _CarroPage extends State<CarroPage> {
  final _bloc = LoripsumBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetch();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Carro carro = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: null 
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: null 
          ),
          PopupMenuButton(
            onSelected: null,
            itemBuilder: (_) => [
              PopupMenuItem(value: 'Editar', child: Text('Editar')),
              PopupMenuItem(value: 'Deletar', child: Text('Deletar')),
              PopupMenuItem(value: 'Sahre', child: Text('Share'))
            ]
          )
        ]
      ),
      body: _body(carro),
    );
  }

  _body(carro){
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Image.network(carro.urlFoto),
          _barra(carro),
          Divider(thickness: 1,),
          _dscCarro(carro),
        ]
      )
    );
  }

  _barra(carro) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                carro.nome,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                carro.tipo,
                style: TextStyle(fontSize: 16)
              )
            ]
          )
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.favorite,
              size: 40,
              color: Colors.red
            ),
            onPressed: null
          )
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.share,
              size: 40,
            ),
            onPressed: null
          )
        ),
      ]
    );
  }

  _dscCarro(carro) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          carro.descricao,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )
        ),
        SizedBox(height: 20),
        StreamBuilder(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Text(
              snapshot.data,
              style: TextStyle(
                fontSize: 16,
              )
            );
          }
        )
      ]
    );
  }
}