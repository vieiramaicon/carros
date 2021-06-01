import 'package:flutter/material.dart';
import '../../entity/usuario.dart';
import '../../entity/prefs.dart';

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Usuario> future =  Usuario.get();
    
    return SafeArea(
        child: Drawer(
            child: ListView(
                children: [
                    FutureBuilder<Usuario>(
                        future: future,
                        builder: (context, snapshot) {
                            Usuario user = snapshot.data;
                            if(user == null)
                                return Container();
                            return _header(user);
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.star), 
                        title: Text('Favoritos'), 
                        subtitle: Text('Mais infomrações...'), 
                        trailing: Icon(Icons.arrow_forward)
                    ),
                    ListTile(
                        leading: Icon(Icons.help), 
                        title: Text('Ajuda'), 
                        subtitle: Text('Mais infomrações...'), 
                        trailing: Icon(Icons.arrow_forward)
                    ),
                    ListTile(
                        leading: Icon(Icons.exit_to_app), 
                        title: Text('Logout'), 
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () => _logout(context),
                    ),
                ]
            )
        )
    );
  }

  Widget _header(user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome), 
      accountEmail: Text(user.email), 
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto)
      )
    );
  }

  void _logout(BuildContext context) {
    Usuario.clear();
    Navigator.of(context).pushReplacementNamed('/');
  }
}