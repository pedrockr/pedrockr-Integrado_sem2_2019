import 'package:flutter/material.dart';
import '../ata_reuniao/index_ata.dart';
import '../usuario/index_usuario.dart';

class HomePage extends StatelessWidget {
  HomePage({this.username, this.usernivel});
  final String username;
  final String usernivel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E8449),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('LippiBoard'),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              // ListView contains a group of widgets that scroll inside the drawer
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff1E8449),
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Image.asset('assets/register.png'),
                          ),
                          Text(
                            "$username",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (usernivel == "Coordenador")
                        ? true
                        : (usernivel == "Professor")
                            ? true
                            : (usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.library_books),
                      title: Text('Ata de Reuniao'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ListaAta');
                      },
                    ),
                  ),
                  Visibility(
                    visible: (usernivel == "Coordenador")
                        ? true
                        : (usernivel == "Professor")
                            ? true
                            : (usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Gestão de Eventos'),
                      onTap: () {},
                    ),
                  ),
                  Visibility(
                    visible: (usernivel == "Coordenador")
                        ? true
                        : (usernivel == "Professor")
                            ? true
                            : (usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text('Projetos Interdisciplinares'),
                      onTap: () {},
                    ),
                  ),
                  Visibility(
                    visible: (usernivel == "Coordenador")
                        ? true
                        : (usernivel == "Professor")
                            ? true
                            : (usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.people),
                      title: Text('Gestão de Usuários'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ListaUser');
                      },
                    ),
                  ),
                ],
              ),
            ),
            // This container holds the align
            Container(
                // This align moves the children to the bottom
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    // This container holds all the children that will be aligned
                    // on the bottom and should not scroll with the above ListView
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings')),
                        ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text('Sair'),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                        )
                      ],
                    ))))
          ],
        ),
      ),
    );
  }

  Widget enDrawer() {
    if (usernivel == 'Coordenador') {}
  }
}
