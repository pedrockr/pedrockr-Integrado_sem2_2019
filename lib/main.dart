//import 'package:facul/pages/detalhe.page.dart';
import 'package:proj_integrado/pages/home_page/home_page.dart';
import 'package:proj_integrado/pages/login.page.dart';
import 'package:flutter/material.dart';

import 'package:proj_integrado/pages/login2.page.dart';
import 'package:proj_integrado/pages/login2.page.dart' as prefix0;
import 'pages/home_page/home_page.dart';
import 'pages/usuario/index_usuario.dart';
import 'pages/ata_reuniao/index_ata.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: LoginPage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/home_page': (BuildContext context)=> HomePage(username: username, usernivel:usernivel,),
        '/ListaUser': (BuildContext context)=> IndexUsuario(username: username,usernivel:usernivel,),
        '/ListaAta': (BuildContext context)=> IndexAta(username: username,usernivel:usernivel,),
      }
    );
  }
}