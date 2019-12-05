import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'visualizar_usuario.dart';
import 'cadastro_usuario.dart';

class IndexUsuario extends StatefulWidget {
    IndexUsuario({this.username, this.usernivel});
    final String username;
    final String usernivel;
  @override
  _IndexUsuarioState createState() => new _IndexUsuarioState();
}

class _IndexUsuarioState extends State<IndexUsuario> {  
  //VARIAVEIS  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //FUNCOES
  //Pegar json apresentada pela pagina
  Future<List> getData() async {
    var sql =
        "https://www.marciosantos.com.br/flutterHunt/mobile/usuario/lista_usuarios.php";
    var sql2 = "https://lippiboard.000webhostapp.com/ata.php?function=listaAta";
    final response = await http.get(sql);
    //print (json.decode(response.body));
    return json.decode(response.body);
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff1E8449),
        elevation: 0,
        title: Text('Gestão de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
        ],
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
                            widget.username,
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
                    visible: (widget.usernivel == "Coordenador")
                        ? true
                        : (widget.usernivel == "Professor")
                            ? true
                            : (widget.usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.library_books),
                      title: Text('Ata de Reuniao'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/ListaAta');
                      },
                    ),
                  ),
                  Visibility(
                    visible: (widget.usernivel == "Coordenador")
                        ? true
                        : (widget.usernivel == "Professor")
                            ? true
                            : (widget.usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text('Gestão de Eventos'),
                      onTap: () {},
                    ),
                  ),
                  Visibility(
                    visible: (widget.usernivel == "Coordenador")
                        ? true
                        : (widget.usernivel == "Professor")
                            ? true
                            : (widget.usernivel == "Aluno") ? false : false,
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text('Projetos Interdisciplinares'),
                      onTap: () {},
                    ),
                  ),
                  Visibility(
                    visible: (widget.usernivel == "Coordenador")
                        ? true
                        : (widget.usernivel == "Professor")
                            ? true
                            : (widget.usernivel == "Aluno") ? false : false,
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
                            title: Text('Sair'))
                      ],
                    ))))
          ],
        ),
      ),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new ItemList(list: snapshot.data)
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return SignupPage();
          }));
        },
        icon: Icon(Icons.add),
        label: Text(
          "Novo",
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Color(0xff0066FF),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100,
              child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home_page');
                },
              ),
            ),
            Container(
              width: 100,
              child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState.openEndDrawer()),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      visualizarUsuario(list: list, index: i),
                ),
              ),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Text(list[i]['usuario_nome']),
                  subtitle: Text(list[i]['usuario_matricula']),
                  trailing: Text(list[i]['usuario_nivel']),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Image.asset('assets/register.png'),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
