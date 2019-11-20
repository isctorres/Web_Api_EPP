import 'package:flutter/material.dart';
import 'package:flutter_wepapi/models/productos.dart';
import 'package:flutter_wepapi/tarjeta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Productos extends StatelessWidget{
  List tarjetas = List.generate(20, (i)=>Tarjeta()).toList();
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: ListView(
          children: tarjetas,
        ),
      ),
    );
  }
}

Future<DAOProductos> getProductos() async{
      http.Response response = await http.get(
        Uri.encodeFull("http://192.168.1.107:8888/productos"),
        headers: { "Accept" : "application/json"}
      );

      if( response.statusCode == 200 )
        return DAOProductos.fromJson(json.decode(response.body));
      else
        throw Exception('Fallo al obtener los datos');
  }
