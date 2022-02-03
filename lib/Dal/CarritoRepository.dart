import 'dart:convert';
import 'package:turismo/Entity/Carrito.dart';

import 'Global.dart';
import 'package:http/http.dart' as http;

Future<List> listarCarrito() async {
  String urls = urlServidor + "/consultarProductoCarrito.php";
  final response = await http.post(Uri.parse(urls));
  var datauser = jsonDecode(response.body.toString());
  return datauser;
}

void RegistrarCarrito(Carrito carrito) async {
  //print(carrito.toString());
  String urls = urlServidor + "/registrarCarrito.php";

  final response = await http.post(Uri.parse(urls), body: {
    "id_cliente": carrito.id_cliente,
    "id_producto": carrito.id_producto,
  });
  //print(json.decode(response.body.toString()));
}
