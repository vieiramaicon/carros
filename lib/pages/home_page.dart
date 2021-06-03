import 'package:flutter/material.dart';
import '../api/carros_api.dart';
import '../entity/usuario.dart';
import '../entity/carro.dart';
import '../entity/prefs.dart';
import 'widgets/carros_view.dart';
import 'widgets/drawer_custom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  Future<void> _initTabs() async {
    int idx = await Prefs.getInt('idx');

    _tabController = TabController(length: 3, vsync: this);
    setState( () => _tabController.index = idx );
    _tabController.addListener(() => Prefs.setInt('idx', _tabController.index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Carros'),
          centerTitle: true,
          bottom: _tabController == null 
          ? null
          : TabBar(
              controller: _tabController, 
              tabs: [
                Tab(text: 'Clássicos'),
                Tab(text: 'Esportivos'),
                Tab(text: 'Luxo'),
              ]
            ),
        ),
        drawer: DrawerCustom(),
        body: _tabController == null 
            ? Center(
                child: CircularProgressIndicator() 
            )
            : TabBarView(
                controller: _tabController, 
                children: [
                    CarrosView(TipoCarro.classicos),
                    CarrosView(TipoCarro.esportivos),
                    CarrosView(TipoCarro.luxo),
                ]
            )
    );
  }
}