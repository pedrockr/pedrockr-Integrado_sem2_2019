import 'package:flutter/material.dart';
import 'package:flutter_app/busca.dart';
import 'package:flutter_app/eventos_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static String tag = 'myapp_page';

  @override
  _ApState createState() => new _ApState();
}

class _ApState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Eventos',
          style: TextStyle(fontSize: 25.0, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: ListView(
          children: <Widget>[
            Container(
              child: ListTile(
                title: Text('Cadastro de Eventos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 5.0, fontSize: 30.0, color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              height: 250.0,
              width: 8.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imagens/cadastro.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: ListTile(
                title: Text('Busca de Eventos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 5.0, fontSize: 30.0, color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Busca()),
                  );
                },
              ),
              height: 250.0,
              width: 8.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/imagens/busca.jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
