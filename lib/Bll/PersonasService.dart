import 'package:turismo/Dal/PersonasRepository.dart';
import 'package:turismo/Entity/Personas.dart';

void RegistrarPersonas1(Personas personas) async {
  RegistrarPersonas(personas);
}

Future<List> ConsultarPersonasIdentificacion1(String identificacion) async {
  return ConsultarPersonasIdentificacion(identificacion);
}