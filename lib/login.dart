import 'package:flutter/material.dart';
import 'package:flutter_wepapi/productos.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login>{

  final txtUserController = TextEditingController();
  final txtPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    Future<int> validateUser() async{
      var usr = txtUserController.text;
      var pwd = txtPwdController.text;
      
      http.Response response = await http.get(
        Uri.encodeFull("http://192.168.1.107:8888/usuarios/$usr/$pwd"),
        headers: { "Accept" : "application/json"}
      );

      var token = response.body; // Obtener el token de la peticion o el error
      return response.statusCode;
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 48.0,
        child: Image.network("http://i.pravatar.cc/300"),
      ),
    );

    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
      //autofocus: false,
      decoration: InputDecoration(
        hintText: 'Introduce el e-mail',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final txtPwd = TextFormField(
      //autofocus: false,
      //initialValue: 'some password',
      controller: txtPwdController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          var codigo = await validateUser();
          //print(codigo);
          if( codigo == 200 ){
            //Navigator.push(context, MaterialPageRoute(builder:(context)=>Dashboard()));
            Navigator.pushReplacementNamed(context, '/dash');
          }else{
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Mensaje de la APP"),
                  content: Text("Error al Autenticarse"),
                  actions: <Widget>[
                    new FlatButton(
                      child: Text("Cerrar"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            );
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 40.0),
            txtEmail,
            SizedBox(height: 30.0),
            txtPwd,
            SizedBox(height: 30.0),
            loginButton
          ],
        ),
      ),
    );
  }
}