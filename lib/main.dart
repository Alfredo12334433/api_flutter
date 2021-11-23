import 'package:flutter/material.dart';

import 'dart:convert' as convert;

import "package:http/http.dart" as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo interaccion API'),
        ),
        body: Center(
          child: Container(
            child: ElevatedButton(
              child: Text('Clic aqui'),
              onPressed: () async {
                var url = Uri.http('10.0.2.2:8000', '/api/productos', {});

                // Await the http get response, then decode the json-formatted response.
                var response = await http.get(url);
                if (response.statusCode == 200) {
                  var jsonResponse = convert.jsonDecode(response.body);
                  String producto = jsonResponse[0]['producto'];
                  print('Producto 1: $producto');
                } else {
                  print('Request failed with status: ${response.statusCode}.');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
