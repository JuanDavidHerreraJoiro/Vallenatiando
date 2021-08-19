import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Entity/Personas.dart';

void RegistrarPersonas(Personas personas) async {
  String urls = url + "/registrarPersonas.php";
  final response = await http.post(Uri.parse(urls), body: {
    "idPersona": personas.idPersona,
    "nombre": personas.nombre,
    "apellido": personas.apellido,
    "tipoIdentificacion": personas.tipoIdentificacion,
    "direccion": personas.direccion,
    "celular": personas.celular,
    "telefono": personas.telefono,
    "estado": personas.estado,
    "usuario": personas.usuario,
    "password": personas.password
  });
  /*var datauser = json.decode(response.body);
  return datauser;*/
}
