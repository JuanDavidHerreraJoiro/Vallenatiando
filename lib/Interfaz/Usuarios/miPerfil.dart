import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';

class miPerfil extends StatefulWidget {
  miPerfil({Key? key}) : super(key: key);

  @override
  _MiPerfilState createState() => _MiPerfilState();
}

class _MiPerfilState extends State<miPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: DeliveryColorsFinal.redfinal3,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Inicio(),
              ),
            );
          },
        ),
        title: Center(
          child: RichText(
            text: TextSpan(style: FontTexto.styleTitulo2, children: [
              TextSpan(
                text: "Vallena",
                style: TextStyle(color: Colors.black54),
              ),
              TextSpan(
                text: "tiando",
                style: TextStyle(color: DeliveryColorsFinal.redfinal3),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
