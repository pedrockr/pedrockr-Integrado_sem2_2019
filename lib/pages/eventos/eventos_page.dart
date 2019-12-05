import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  static String tag = 'eventos-page';

  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  //Criação de campo
  TextEditingController campo = TextEditingController();
  TextEditingController _textController = TextEditingController();

  //Criação de variaveis
  int currentTabIndex = 0;
  final formatT = DateFormat("HH:mm");
  final formatD = DateFormat("yyyy-MM-dd");
  List<String> listItems = [];
  List<String> _categoria = ['Projeto', 'Palestra', 'Curso'];
  String _selectedCategoria; //opção 1

//Função
  void addItem() {
    var rng = campo.text;
    setState(() {
      listItems.add(rng.toString());
    });
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

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<String> listItems1 = [];
  List<String> _area = [
    'Administração',
    'Prova',
    'Tecnologia',
    'Direito',
    'Pedagogia'
  ];
  // opções
  String _selectedArea; // opção 2

  //Função
  void addItems1() {
    var rne = campo.text;
    setState(() {
      listItems1.add(rne.toString());
    });
  }

  void deleteItems1(index) {
    setState(() {
      listItems1.removeAt(index);
    });
  }

  void undoDeletions1(index, item) {
    setState(() {
      listItems1.insert(index, item);
    });
  }

  onTappeds1(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
  List<String> listItems2 = [];
  List<String> _status = [
    'Ativo',
    'Cancelado',
    'Atrasado'
  ]; // opções
  String _selectedStatus; // opção 2

  //Função
  void addItems2() {
    var rne = campo.text;
    setState(() {
      listItems2.add(rne.toString());
    });
  }

  void deleteItems2(index) {
    setState(() {
      listItems2.removeAt(index);
    });
  }

  void undoDeletions2(index, item) {
    setState(() {
      listItems2.insert(index, item);
    });
  }

  onTappeds2(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Eventos',
              style: TextStyle(fontSize: 20.0, color: Colors.red)),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  child: Text('Cadastro'),
                ),
                Tab(
                  child: Text('Descrição'),
                ),
                Tab(
                  child: Text('Relatorio'),
                ),
              ]),
          actions: <Widget>[],
        ),
        body: TabBarView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SingleChildScrollView(
                //Lista de Categoria
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    ),
                    //Titulo
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButton(
                        hint: Text('Selecione a categoria do Evento'),
                        value: _selectedCategoria,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategoria = newValue;
                            listItems.add(_selectedCategoria.toString());
                          });
                        },
                        items: _categoria.map((categoria) {
                          return DropdownMenuItem(
                            child: Text(categoria),
                            value: categoria,
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: DropdownButton(
                        hint: Text('Selecione a categoria do Evento'),
                        value: _selectedArea,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedArea = newValue;
                            listItems1.add(_selectedArea.toString());
                          });
                        },
                        items: _area.map((area) {
                          return DropdownMenuItem(
                            child: Text(area),
                            value: area,
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.black87,
                              )),
                          hintText: 'Título do Evento',
                          hintStyle: TextStyle(color: Colors.black),
                          helperText: 'Escreva o Titulo do Evento',
                          labelText: 'Título do Evento',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    //Data
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.green,
                          primaryColorDark: Colors.red,
                        ),
                        child: DateTimeField(
                          format: formatD,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(45.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                              hintText: 'Entre com a data do evento',
                              hintStyle: TextStyle(color: Colors.black),
                              helperText: '',
                              labelText: 'Data',
                              labelStyle: TextStyle(color: Colors.black),
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
                    //Horas
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.green,
                          primaryColorDark: Colors.red,
                        ),
                        child: DateTimeField(
                          format: formatT,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(45.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                              hintText: 'Entre co a hora do evento',
                              hintStyle: TextStyle(color: Colors.black),
                              helperText: '',
                              labelText: 'Hora',
                              labelStyle: TextStyle(color: Colors.black),
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
                    Container(
                      child: RaisedButton(
                          color: Colors.teal,
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                          child: Text('Salvar', style: TextStyle(color: Colors.white),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Descreva o evento ',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),

                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                      color: Colors.teal,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        'Slavar',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ]),
            ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45.0),
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownButton(
                          hint: Text('Selecione o Status do Evento'),
                          value: _selectedStatus,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedStatus = newValue;
                              listItems2.add(_selectedStatus.toString());
                            });
                          },
                          items: _status.map((categoria) {
                            return DropdownMenuItem(
                              child: Text(categoria),
                              value: categoria,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 20,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Relatório do Evento ',
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),

                          ),
                        ),
                      ),
                      Container(
                        child: RaisedButton(
                            color: Colors.teal,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Text(
                              'Slavar',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
