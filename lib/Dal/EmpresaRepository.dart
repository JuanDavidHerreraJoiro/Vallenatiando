//consultarIdentificacionPersonaEmpresa.php
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Entity/Empresa.dart';

Future<List> ConsultarIdentificacionPersonasEmpresa(
    String identificacion) async {
  String urls = urlServidor + "/consultarIdentificacionPersonaEmpresa.php";
  final response = await http.post(Uri.parse(urls), body: {
    "idPersona": identificacion,
  });
  var datauser = json.decode(response.body.toString());
  return datauser;
}

Future<List> ConsultarNitEmpresa(String idEmpresa) async {
  String urls = urlServidor + "/consultarEmpresa.php";
  final response = await http.post(Uri.parse(urls), body: {
    "idEmpresa": idEmpresa,
  });
  var datauser = json.decode(response.body.toString());
  return datauser;
}

Future<List> ConsultarNitEmpresaValledupar(String NIT) async {
  String urls = urlServidor + "/consultarEmpresaValledupar.php";
  final response = await http.post(Uri.parse(urls), body: {
    "NIT": NIT,
  });
  var datauser = json.decode(response.body.toString());
  return datauser;
}

//consultarMiEmpresa.php
Future<List> consultarMiEmpresa(String tipo, String idPersona) async {
  String urls = urlServidor + "/consultarMiEmpresa.php";
  final response = await http
      .post(Uri.parse(urls), body: {"tipo": tipo, "idPersona": idPersona});
  var datauser = json.decode(response.body.toString());
  //print(datauser);

  return datauser;
}

Future<List> consultarEmpresaRuta(String tipo) async {
  String urls = urlServidor + "/consultarEmpresaRuta.php";
  final response = await http.post(Uri.parse(urls), body: {
    "tipo": tipo,
  });
  var datauser = json.decode(response.body.toString());
  //print(datauser);

  return datauser;
}

void RegistrarEmpresa(Empresa empresa) async {
  String urls = urlServidor + "/registrarEmpresa.php";
  print(empresa.toMap());
  final response = await http.post(Uri.parse(urls), body: {
    "idEmpresa": empresa.idEmpresa,
    "correo": empresa.correo,
    "tipoID": empresa.tipoID,
    "nombre": empresa.nombre,
    "direccion": empresa.direccion,
    "telefono": empresa.telefono,
    "celular": empresa.celular,
    "estado": empresa.estado,
    "descripcion": empresa.descripcion,
    "longitud": empresa.longitud,
    "latitud": empresa.latitud,
    "idPersona": empresa.idPersona
  });
}
