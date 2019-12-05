import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //CONTROLLERS
  TextEditingController controller_usuario_nome = new TextEditingController();
  TextEditingController controller_usuario_cpf = new TextEditingController();
  TextEditingController controller_usuario_email = new TextEditingController();
  TextEditingController controller_usuario_matricula = new TextEditingController();
  TextEditingController controller_usuario_senha = new TextEditingController();
  TextEditingController controller_conf_usuario_senha = new TextEditingController();

  //VARIAVEIS
  List<String> _nivel = ["Professor", "Coordenador", "Aluno"];
  String _nivelSelecionado;

  //FUNCOES

  void CadastrarAta() async {
    var url = "https://www.marciosantos.com.br/flutterHunt/mobile/usuario/cadastro_de_usuario.php?id=1";
    var response = await http.post(url, body: {
      "usuario_nome": controller_usuario_nome.text,
      "usuario_cpf": controller_usuario_cpf.text,
      "usuario_email": controller_usuario_email.text,
      "usuario_matricula": controller_usuario_matricula.text,
      "usuario_senha": controller_usuario_senha.text,
      "usuario_nivel": _nivelSelecionado,
    });
    //print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E8449),
        automaticallyImplyLeading: true,
        
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 170,
              height: 170,
              alignment: Alignment(0.0, 1.15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/register.png"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              // autofocus: true,
              controller: controller_usuario_nome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: controller_usuario_cpf,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: controller_usuario_matricula,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Matricula",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // autofocus: true,
              controller: controller_usuario_email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(              
              controller: controller_usuario_senha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller_conf_usuario_senha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirme a Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80.0,
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      padding: EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: <Widget>[
                          DropdownButton(
                             value: _nivelSelecionado,
                            hint: Text(
                              'Nível'),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    if(controller_conf_usuario_senha.text == controller_usuario_senha.text){
                      CadastrarAta();
                    }else{
                      Toast.show("Senhas diferentes", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                    }
                    
                    },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
