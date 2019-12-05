import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'index_ata.dart';

class EditarAta extends StatefulWidget {
  final List list;
  final int index;
  EditarAta({this.list, this.index});
  @override
  _EditarAtaState createState() => _EditarAtaState();
}

class _EditarAtaState extends State<EditarAta> {
  //Controllers
  TextEditingController controllerTitulo;
  TextEditingController controllerData;
  TextEditingController controllerPauta;
  TextEditingController controllerRelatorio;
  TextEditingController controllerStatus;
  TextEditingController campo;
  TextEditingController _ata_data;
  TextEditingController _ata_hora;

  //**Variaveis
  List data = [];
  String _selectedLocation;
  final formatT = DateFormat("HH:mm:ss");
  final formatD = DateFormat("yyyy-MM-dd");

//**Funcoes

  void EditarAta() async {
    var url =
        "https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/editar_ata.php";
    var response = await http.post(url, body: {
      "ata_id": widget.list[widget.index]["ata_id"],
      "ata_nome": controllerTitulo.text,
      //"ata_data_e_hora": controllerData.text,
      "ata_pauta": controllerPauta.text,
      "ata_relatorio": controllerRelatorio.text,
      "ata_status": controllerStatus.text,
      "ata_data": _ata_data.text,
      "ata_hora": _ata_hora.text,
    });
  }

  //Funcao que cria a lista de participantes na aba 2
  Future<List> ListaUsuario() async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/lista_participantes.php?id=' +
            widget.list[widget.index]["ata_id"]);
    //print(widget.list[widget.index]["ata_id"]);
    return json.decode(response.body);
  }

  void DropDown_usuario() async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/sel_participantes.php');
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  void AdicionarUsuario(valor) async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/adicionar_usuario.php?ata_id=' +
            widget.list[widget.index]["ata_id"] +
            '&participante_id=' +
            valor);
  }

  @override
  void initState() {
    DropDown_usuario();
    ListaUsuario();
    controllerTitulo =
        TextEditingController(text: widget.list[widget.index]['ata_nome']);
    controllerData = TextEditingController(
        text: widget.list[widget.index]['ata_data_e_hora']);
    controllerPauta =
        TextEditingController(text: widget.list[widget.index]['ata_pauta']);
    controllerRelatorio =
        TextEditingController(text: widget.list[widget.index]['ata_relatorio']);
    controllerStatus =
        TextEditingController(text: widget.list[widget.index]['ata_status']);
    _ata_data = TextEditingController(text: widget.list[widget.index]['data']);
    _ata_hora = TextEditingController(text: widget.list[widget.index]['hora']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff1E8449),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Ata de Reunião',
            style: TextStyle(fontSize: 20.0),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              labelColor: Color(0xff1E8449),
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Container(
                      margin: new EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: Text('Titulo')),
                ),
                Tab(
                  child: Container(
                      margin: new EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: Text('Participantes')),
                ),
                Tab(
                  child: Container(
                      margin: new EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      child: Text('Relatório')),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //Aba 1
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: controllerTitulo,
                        decoration: InputDecoration(
                          hintText: "Nome da Ata",
                          labelText: "Nome da Ata",
                        ),
                      ),
                    ),
                    //Campo Data
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.indigo,
                          primaryColorDark: Colors.red,
                        ),
                        child: DateTimeField(
                          controller: _ata_data,
                          format: formatD,
                          decoration: InputDecoration(
                              hintText: 'Escolha a data',
                              helperText: '',
                              labelText: 'Data',
                              prefixIcon: const Icon(Icons.calendar_today)),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                    ),
                    //Campo Data

                    //--Campo Hora
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Theme(
                        data: new ThemeData(
                          primaryColor: Colors.indigo,
                          primaryColorDark: Colors.red,
                        ),
                        child: DateTimeField(
                          controller: _ata_hora,
                          format: formatT,
                          decoration: InputDecoration(
                              hintText: 'Escolha a hora',
                              helperText: '',
                              labelText: 'Hora',
                              prefixIcon: const Icon(Icons.access_time)),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        maxLines: 5,
                        controller: controllerPauta,
                        decoration: InputDecoration(
                          hintText: "Pauta da Ata",
                          labelText: "Pauta da Ata",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            //Aba 2
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              margin: new EdgeInsets.all(15.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: Colors.blueGrey)),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text(
                        'Selecione',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 16, 133, 6),
                        ),
                      ),
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        AdicionarUsuario(newValue);
                        setState(() {
                          ListaUsuario();
                        });
                      },
                      items: data.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location['usuario_nome']),
                          value: location['usuario_id'],
                        );
                      }).toList(),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(0, 16, 133, 6),
                  ),
                  Text(
                    'Lista de Participantes',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 16, 133, 6),
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: FutureBuilder<List>(
                          future: ListaUsuario(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);

                            return snapshot.hasData
                                ? new ItemList(list: snapshot.data)
                                : new Center(
                                    child: new CircularProgressIndicator(),
                                  );
                          }),
                    ),
                  ),
                ],
              ),
            ),

            //Aba 3
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: controllerRelatorio,
                        maxLines: 20,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: "Relatório",
                            labelText: "Relatório"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0xFF1a5276),
                            Color(0xFF2471a3),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: FlatButton(
                        onPressed: () {
                        EditarAta();
                        Navigator.pushReplacementNamed(context, '/ListaAta');
                      },
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                ),
                
              ],
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

  void deleteItem(index) async {
    final response = await http.get(
        'https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/deletar_usuario.php?id=' +
            index);
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: ObjectKey(list[i]),
            onDismissed: (direction) {
              var item = list[i]['participante_id'];
              deleteItem(item);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(list[i]['usuario_nome']),
              ),
            ),
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
