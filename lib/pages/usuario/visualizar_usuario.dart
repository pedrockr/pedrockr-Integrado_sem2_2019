import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class visualizarUsuario extends StatefulWidget {
  List list;
  int index;
  visualizarUsuario({this.index, this.list});

  @override
  _visualizarUsuarioState createState() => _visualizarUsuarioState();
}

class _visualizarUsuarioState extends State<visualizarUsuario> {
  //VARIAVEIS
  TextStyle defaultStyle = TextStyle(fontSize: 18, color: Colors.black);
  final _formKey = GlobalKey<FormState>();
  List<String> _nivel = ["Professor", "Coordenador", "Aluno"];
  String _nivelSelecionado;

  void deletarUsuario() async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/usuario/deletar_usuario.php?usuario_id=' +
            widget.list[widget.index]["usuario_id"]);
  }

  void editarUsuario() async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/usuario/editar_usuario.php?usuario_id=' +
            widget.list[widget.index]["usuario_id"] +
            '&usuario_nivel=' +
            _nivelSelecionado);
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Escolha o novo tipo de cadastro"),
                  Text(" "),
                  Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: Colors.blueGrey)),
                    child: DropdownButton(
                      value: _nivelSelecionado,
                      hint: Text('Nível'),
                      onChanged: (newValue) {
                        setState(() {
                          _nivelSelecionado = newValue;
                        });
                      },
                      items: _nivel.map((elemento) {
                        return DropdownMenuItem(
                          child: new Text(elemento),
                          value: elemento,
                        );
                      }).toList(),
                    ),
                  ),
                  Text(" "),
                  Container(
                    height: 40,
                    width: 150,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFF008000),
                          Color(0xFF39B546),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: SizedBox.expand(
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "    Atualizar",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        onPressed: () {
                          editarUsuario();
                          Navigator.of(context).pop();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              );
              }
            ),
          );
        });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E8449),
        centerTitle: true,
        title: Text("${widget.list[widget.index]['usuario_nome']}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    child: Text(
                      "Nome:",
                      style: defaultStyle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${widget.list[widget.index]['usuario_nome']}",
                      style: defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    child: Text(
                      "CPF: ",
                      style: defaultStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.list[widget.index]['usuario_cpf']}",
                      style: defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    child: Text(
                      "Matricula: ",
                      style: defaultStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.list[widget.index]['usuario_matricula']}",
                      style: defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    child: Text(
                      "Tipo de cadastro: ",
                      style: defaultStyle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${widget.list[widget.index]['usuario_nivel']}",
                      style: defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFF008000),
                          Color(0xFF39B546),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () => _displayDialog(context),
                      child: Text(
                        'Editar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xFFc0392b),
                          Color(0xFFcd6155 ),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        deletarUsuario();
                      Navigator.pop(context);
                      },
                      child: Text(
                        'Deletar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  /* RaisedButton(
                    color: Colors.blue,
                    onPressed: () => _displayDialog(context),
                    child: Text('Editar'),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      deletarUsuario();
                      Navigator.pop(context);
                    },
                    child: Text('Delete'),
                  ), */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
