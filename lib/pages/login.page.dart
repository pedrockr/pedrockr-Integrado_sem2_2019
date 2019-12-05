import 'package:proj_integrado/pages/login2.page.dart';
import 'package:flutter/material.dart';
import 'package:proj_integrado/pages/signup.page.dart';
import 'widget_bezier.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  child: BezierWidget(),
                ),
                Positioned(
                  top: 115.0,
                  left: 20.0,
                  height: 300,
                  width:300,
                  child: Image.asset('assets/modulo2.png'),
                ),
              ],
            ),
            Container(
              height: 425.9,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 50.0,
                    top: 40.0,
                    child: Container(
                      height: 165.9,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0, top: 24.9),
                            width: 200.0,
                            height: 50.0,
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              color: Colors.green,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaPage(),
                                  ),
                                );
                              },
                              child: Text("Acessar", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                            ),
                          ),
                          Container(
                            child: Text("________________________________________", style: TextStyle(color: Colors.grey)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            width: 200.0,
                            height: 50.0,
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              color: Colors.blueAccent[400],
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                );
                              },
                              child: Text("Cadastro para Alunos", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 165.9),
                      child: Transform.rotate(
                        angle: 3.14,
                        child: Container(
                          child: BezierWidget(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
