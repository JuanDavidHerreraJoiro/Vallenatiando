import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';

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
/*
void MensajeVacioRepository(
    context, texto1, Color colors, texto2, bool acceso, String vista) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(texto2, style: TextStyle(color: Colors.white)),
      backgroundColor: colors,
      content: Text('' + texto1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )),
      actions: [
        TextButton(
          onPressed: () {
            if (acceso == true) {
              if (vista == "ADM") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VistaIzquierdaAdministrador()));
              } else if (vista == "EMP") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VistaIzquierdaEmpleado()));
              } else if (vista == "CLI") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => FRMLogin()));
              }
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

void MensajeModificarRepository(
    context, texto1, Color colors, texto2, bool acceso, String vista) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(texto2, style: TextStyle(color: Colors.white)),
      backgroundColor: colors,
      content: Text('' + texto1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )),
      actions: [
        TextButton(
          onPressed: () {
            if (acceso == true) {
              if (vista == "ADM") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BuscarAdministrador()));
              } else if (vista == "EMP") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BuscarEmpleado()));
              } else if (vista == "CLI") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeCliente()));
              }
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
}*/
