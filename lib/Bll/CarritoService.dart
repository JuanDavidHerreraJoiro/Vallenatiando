import 'package:turismo/Dal/CarritoRepository.dart';
import 'package:turismo/Entity/Carrito.dart';

void RegistrarCarrito1(Carrito carrito) async {
  RegistrarCarrito(carrito);
}

Future<List> consultarCarrito() async {
  return listarCarrito();
}
