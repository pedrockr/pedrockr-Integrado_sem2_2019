import 'package:flutter/material.dart';
import 'editar_ata.dart';
import 'package:http/http.dart' as http;

class visualizarAta extends StatefulWidget {
  List list;
  int index;
  visualizarAta({this.index, this.list});

  @override
  _visualizarAtaState createState() => _visualizarAtaState();
}

class _visualizarAtaState extends State<visualizarAta> {
  List<String> listItems = [];

  void teste() {
    var arr = [];
    arr = widget.list[widget.index]["usuario"];
    for (final item in arr) {
      listItems.add(item['usuario_nome']);
    }
  }

  void deletarAta() async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/deletar_ata.php?ata_id=' +
            widget.list[widget.index]["ata_id"]);
  }

  void initState() {
    teste();
    super.initState();
  }

  TextStyle defaultStyle = TextStyle(fontSize: 18, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E8449),
        centerTitle: true,
        title: Text("${widget.list[widget.index]['ata_nome']}"),
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
                      "Titulo da Ata:",
                      style: defaultStyle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${widget.list[widget.index]['ata_nome']}",
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
                      "Data: ",
                      style: defaultStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.list[widget.index]['data']}",
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
                      "Hora: ",
                      style: defaultStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      "${widget.list[widget.index]['hora']}",
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
                      "Pauta da Ata: ",
                      style: defaultStyle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${widget.list[widget.index]['ata_pauta']}",
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
                      "Participantes: ",
                      style: defaultStyle,
                    ),
                  ),
                  Container(
                    child: Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: listItems.length,
                            itemBuilder: (context, i) {
                              return Text(
                                listItems[i],
                                style: defaultStyle,
                              );
                            })),
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
                      "Relatorio: ",
                      style: defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "${widget.list[widget.index]['ata_relatorio']}",
                      style: defaultStyle,
                      softWrap: true,
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
                      onPressed: () {
                        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=>EditarAta(list: widget.list, index: widget.index ),
                      )
                    );
                      },
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
                        deletarAta();
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
                    onPressed: ()=>Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context)=>EditarAta(list: widget.list, index: widget.index ),
                      )
                    ),
                    child: Text('Editar'),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: (){
                      deletarAta();
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
