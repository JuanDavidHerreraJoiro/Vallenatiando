import 'package:turismo/Dal/EmpresaRepository.dart';
import 'package:turismo/Entity/Empresa.dart';

Future<List> ConsultarIdentificacionPersonasEmpresa1(
    String identificacion) async {
  return ConsultarIdentificacionPersonasEmpresa(identificacion);
}

Future<List> ConsultarNitEmpresa1(String idEmpresa) async {
  return ConsultarNitEmpresa(idEmpresa);
}

Future<List> ConsultarNitEmpresaValledupar1(String NIT) async {
  return ConsultarNitEmpresaValledupar(NIT);
}

void RegistrarEmpresa1(Empresa empresa) async {
  RegistrarEmpresa(empresa);
}

Future<List> consultarEmpresaRuta1(String tipo) async {
  return consultarEmpresaRuta(tipo);
}
//consultarMiEmpresa
Future<List> consultarMiEmpresa1(String tipo,String idPersona) async {
  return consultarMiEmpresa(tipo, idPersona);
}