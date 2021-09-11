import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismo/Dal/Global.dart';

Future<List> listarUsuariosPassword(String usuario, String password) async {
  String urls = urlServidor + "/consultasUsuariosPassword.php";
  final response = await http
      .post(Uri.parse(urls), body: {"usuario": usuario, "password": password});
  var datauser = json.decode(response.body.toString());
  return datauser;
}

Future<List> listarUsuario(String usuario) async {
  String urls = urlServidor + "/consultarPorUsuarios.php";
  final response = await http.post(Uri.parse(urls), body: {"usuario": usuario});
  var datauser = json.decode(response.body.toString());
  return datauser;
}
