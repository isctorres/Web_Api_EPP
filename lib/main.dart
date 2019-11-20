import 'package:flutter/material.dart';
import 'package:flutter_wepapi/clientes.dart';
import 'package:flutter_wepapi/dashboard.dart';
import 'package:flutter_wepapi/frmClientes.dart';
import 'package:flutter_wepapi/productos.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_wepapi/login.dart';

void main() => runApp(Splash());

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      routes: {
        '/login'  : (context) => Login(),
        '/dash' : (context) => Dashboard(),
        '/prod' : (context) => Productos(),
        '/ctes' : (context) => Clientes(),
        '/frmctes' : (context) => FrmClientes(),
      },
      onUnknownRoute: (RouteSettings conf){
        return MaterialPageRoute(builder: (context)=>Productos());
      },


      title: "Bienvenido",
      home: SplashScreen(
        seconds: 5,
      navigateAfterSeconds: Login(),
      title: Text("Bienvenidos",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.network('https://www.industrialstarter.com/files/images/brand/ansell.png'),
      //image: Image.asset("images/logo.png",width: 150, height: 150),
      gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
      //backgroundColor: Colors.white,
      styleTextUnderTheLoader:  new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red,
      ),
    );
  }
}