import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import 'package:proj_integrado/pages/login.page.dart';
import 'package:proj_integrado/pages/reset-password.page.dart';

String username = '';
String usernivel='';

class TelaPage extends StatefulWidget {
  TelaPage({Key key}) : super(key: key);

  @override
  _TelaPageState createState() => _TelaPageState();
}

class _TelaPageState extends State<TelaPage> {
  //CONTROLLERS
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerSenha = new TextEditingController();
  //VARIAVEIS
  String msg = '';
  //FUNCOES
  Future<List> _login() async {
    var url2 = "https://www.marciosantos.com.br/flutterHunt/mobile/login.php";
    var url = "https://lippiboard.000webhostapp.com/login.php";
    final response = await http.post(url2, body: {
      "usuario_email": controllerEmail.text,
      "usuario_senha": controllerSenha.text
    });
    print(response.body);
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Email ou senha errado";
        Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
      });
    } else {
      if (datauser[0]['usuario_status'] == 'A') {
        if (datauser[0]['usuario_nivel'] == 'Coordenador') {
          Navigator.pushReplacementNamed(context, '/home_page');
        } else if (datauser[0]['usuario_nivel'] == 'Professor') {
          Navigator.pushReplacementNamed(context, '/home_page');
        } else {
          Navigator.pushReplacementNamed(context, '/home_page');
        }
      } else {
        setState(() {
          msg = "Usuario excluido";
          Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
        });
      }
      print(msg);

      setState(() {
        username = datauser[0]['usuario_nome'];
        usernivel = datauser[0]['usuario_nivel'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black54,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ),
      
      body: Container(
        padding: EdgeInsets.only(top: 1, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("assets/moduloo.png"),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              child: TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              child: TextFormField(
                controller: controllerSenha,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Esqueceu sua senha?",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
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
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        child: SizedBox(
                          child: Image.asset("assets/iconemm.gif"),
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/cruzeiro.png'),
            )
          ],
        ),
      ),
    );
  }
}
