import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CadastroAta extends StatefulWidget {
  CadastroAta({Key key}) : super(key: key);

  @override
  _CadastroAtaState createState() => _CadastroAtaState();
}

class _CadastroAtaState extends State<CadastroAta> {
  //Controllers
  TextEditingController _ata_data = new TextEditingController();
  TextEditingController _ata_hora = new TextEditingController();
  TextEditingController controllerTitulo = TextEditingController();
  TextEditingController controllerData = TextEditingController();
  TextEditingController controllerPauta = TextEditingController();
  TextEditingController controllerRelatorio = TextEditingController();
  TextEditingController controllerStatus = TextEditingController();
  TextEditingController campo = new TextEditingController();

  //**Variaveis
  final formatT = DateFormat("HH:mm:ss");
  final formatD = DateFormat("yyyy-MM-dd");
  List<String> listItems = [];
  List data = [];
  String _selectedLocation;

//**Funcoes

  void addItem() {
    //var rng = campo.text;
    //setState(() {
    //listItems.add(rng.toString());
    //});

    print(listItems);
    //print(teste);
  }

  void deleteItem(index) {
    setState(() {
      listItems.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    setState(() {
      listItems.insert(index, item);
    });
  }

  void CadastrarAta() async {
    var url = "https://lippiboard.000webhostapp.com/ata.php?function=addata";
    var url2 = "https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/adicionar_ata.php";
    String encodedString = jsonEncode(listItems);
    final string = listItems.reduce((value, element) => value + ',' + element);

    var response = await http.post(url2, body: {
      "ata_nome": controllerTitulo.text,
      "ata_data_e_hora": controllerData.text,
      "ata_pauta": controllerPauta.text,
      "ata_relatorio": controllerRelatorio.text,
      "ata_status": controllerStatus.text,
      "ata_data": _ata_data.text,
      "ata_hora": _ata_hora.text,
      "usuarios": string,
    });
    //print(encodedString);
    //print('Response body: ${response.body}');
  }

  void DropDown_usuario() async {
    var url = "http://lippiboard.000webhostapp.com/ata.php?function=partic";
    var url2 = "https://www.marciosantos.com.br/flutterHunt/mobile/ata_de_reuniao/sel_participantes.php";
    final response = await http
        .get(url2);
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }
  @override
  void initState() {
    DropDown_usuario();    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff1E8449),
          elevation: 0,
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
            ListView(
              children: <Widget>[
                Container(
                  child: Column(
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


                      //--Campo Hora
                      

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          maxLines: 5,
                          controller: controllerPauta,
                          decoration: InputDecoration(
                            hintText: "Ata da Pauta",
                            labelText: "Ata da Pauta",
                          ),
                        ),
                      ),
                      
                    ],
                  ),
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
                  Container(
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
                        setState(() {
                          _selectedLocation = newValue;
                          listItems.add(_selectedLocation.toString());
                        });
                      },
                      items: data.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location['usuario_nome']),
                          value: location['usuario_nome'],
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
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                    itemCount: listItems.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: ObjectKey(listItems[index]),
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
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Color.fromRGBO(0, 16, 133, 6),
                                  ),
                                  Text(listItems[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                      )),
                                ],
                              ),
                            )),
                        onDismissed: (direction) {
                          var item = listItems.elementAt(index);
                          //Deletar itens
                          deleteItem(index);
                          //Mostrar a barra com undo
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Item deleted"),
                              action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    //To undo deletion
                                    undoDeletion(index, item);
                                  })));
                        },
                      );
                    },
                  )),
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
                        CadastrarAta();
                        Navigator.pushReplacementNamed(context, '/ListaAta');
                      },
                        child: Text(
                          'Cadastrar',
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
