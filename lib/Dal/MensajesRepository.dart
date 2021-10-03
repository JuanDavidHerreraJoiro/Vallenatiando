import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Inicio/tipoProductoEmpresa.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
import 'package:turismo/Interfaz/Usuarios/registroProducto.dart';
import 'package:turismo/Interfaz/constante.dart';

void MensajeRepository(
  context,
  texto1,
  Color colors,
  texto2,
  bool acceso,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(texto2, style: TextStyle(color: Colors.white)),
      backgroundColor: colors,
      content: Text(
        '' + texto1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (acceso == true) {
              Navigator.canPop(context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => Inicio(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            'CONFIRMAR',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

void MensajeRepositoryFG(
  context,
  texto1,
  Color colors,
  texto2,
  bool acceso,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(texto2, style: TextStyle(color: Colors.white)),
      backgroundColor: colors,
      content: Text(
        '' + texto1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (acceso == true) {
              Navigator.canPop(context);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => Inicio(),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            'CONFIRMAR',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

void MensajeRepositoryEmpresaProducto(
  context,
  texto1,
  Color colors,
  texto2,
  bool acceso,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(texto2, style: TextStyle(color: Colors.white)),
      backgroundColor: colors,
      content: Text(
        '' + texto1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      actions: [
        RaisedButton(
          color: Colors.green.shade300,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RegistrarEmpresa(
                  estadoUbicacion: "No registrado",
                ),
              ),
            );
          },
          child: Text(
            " REGISTRAR EMPRESA  ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        RaisedButton(
          color: DeliveryColorsRedOrange.red3,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => TipoProductoEmpresa()),
            );
          },
          child: Text(
            "REGISTRAR PRODUCTO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}
