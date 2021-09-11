import 'package:flutter/material.dart';
import 'package:turismo/Dal/MensajesRepository.dart';

Future MensajeService(context, texto1, Color colors, texto2, bool acceso) async {
  MensajeRepository(context, texto1, colors, texto2, acceso);
}

Future MensajeServiceFG(context, texto1, Color colors, texto2, bool acceso) async {
  MensajeRepositoryFG(context, texto1, colors, texto2, acceso);
}

Future MensajeServiceEmpresaProducto(context, texto1, Color colors, texto2, bool acceso) async {
  MensajeRepositoryEmpresaProducto(context, texto1, colors, texto2, acceso);
}