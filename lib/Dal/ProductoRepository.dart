//registrarProductos.php
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Entity/Productos.dart';

void RegistrarProductos(Productos producto) async {
  String urls = urlServidor + "/registrarProductos.php";
  //print(producto.toMap());
  final response = await http.post(Uri.parse(urls), body: {
    "nombre": producto.nombre,
    "descripcion": producto.descripcion,
    "precio": producto.precio,
    "fechaVigencia": producto.fechaVigencia,
    "cantidad": producto.cantidad,
    "precioOfertaOpcional": producto.precioOfertaOpcional,
    "fechaVigenciaOferta": producto.fechaVigenciaOferta,
    "estado": producto.estado,
    "idEmpresa": producto.idEmpresa
  });
  //print(json.decode(response.body.toString()));
}

Future<List> consultarProducto() async {
  String urls = urlServidor + "/consultarProductoRuta.php";
  final response = await http.post(
    Uri.parse(urls),
  );
  var datauser = jsonDecode(response.body.toString());
  //print(datauser);
  return datauser;
}

Future<List> consultarProductoNombre(
    String nombre, String estado, String idEmpresa) async {
  String urls = urlServidor + "/consultarProductosNombre.php";
  final response = await http.post(Uri.parse(urls),
      body: {"nombre": nombre, "estado": estado, "idEmpresa": idEmpresa});
  var datauser = jsonDecode(response.body.toString());
  //print(datauser);
  return datauser;
}
