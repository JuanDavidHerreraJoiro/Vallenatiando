import 'package:turismo/Dal/ProductoRepository.dart';
import 'package:turismo/Entity/Productos.dart';

void RegistrarProductos1(Productos producto) async {
  RegistrarProductos(producto);
}

Future<List> consultarProducto1() async {
  return consultarProducto();
}

Future<List> consultarProductoNombre1(
    String nombre, String estado, String idEmpresa) async {
  return consultarProductoNombre(nombre, estado, idEmpresa);
}

Future<List> consultarProductoPorId1(String idProducto) {
  return consultarProductoPorId(idProducto);
}
