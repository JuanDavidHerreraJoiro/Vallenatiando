import 'package:turismo/Dal/UsuariosRepository.dart';

Future<bool> listarUsuariosPassword1(String usuario, String password) async {
  List usuarios = await listarUsuariosPassword(usuario, password);
  bool resultdo = false;
  if (usuarios.length == 0) {
    resultdo = false;
  } else {
    resultdo = true;
  }
  return resultdo;
}

Future<List> listarUsuarioIdentificacion(
    String usuario, String password) async {
  List usuarios = await listarUsuariosPassword(usuario, password);
  if (usuarios.length == 0) {
    return [];
  } else {
    return usuarios;
  }
}

Future<bool> listarUsuario1(String usuario) async {
  List usuarios = await listarUsuario(usuario);
  bool resultdo = false;
  if (usuarios.length == 0) {
    resultdo = false;
  } else {
    resultdo = true;
  }
  return resultdo;
}
