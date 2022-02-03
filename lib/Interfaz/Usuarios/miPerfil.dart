import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:turismo/Bll/PersonasService.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
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
    const logoSize = 73.0;
    var logo1 = 'assets/imagenes/no-image.png';

    //ConsultarPersonasIdentificacion1
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
      body: Container(
        child: FutureBuilder(
          future: ConsultarPersonasIdentificacion1(idPersona),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: DeliveryColorsFinal.redfinal3,
                          radius: (logoSize + 10) + 5,
                          child: CircleAvatar(
                            radius: (logoSize + 10),
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Image.asset(logo1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        "Mi perfil",
                        textAlign: TextAlign.center,
                        style: FontTexto.styleNombreProducto,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Identificacion: ",
                            textAlign: TextAlign.left,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            snapshot.data[0]['idPersona'],
                            style: FontTexto.styleNombreProducto,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nombre: ",
                            textAlign: TextAlign.left,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            snapshot.data[0]['nombre'],
                            style: FontTexto.styleNombreProducto,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Apellido: ",
                            textAlign: TextAlign.left,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            snapshot.data[0]['apellido'],
                            style: FontTexto.styleNombreProducto,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Telefono: ",
                            textAlign: TextAlign.left,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            snapshot.data[0]['celular'],
                            style: FontTexto.styleNombreProducto,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Direccion: ",
                            textAlign: TextAlign.left,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            snapshot.data[0]['direccion'],
                            style: FontTexto.styleNombreProducto,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 30),
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
          onPressed: () {
            logueado = false;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => Inicio(),
              ),
            );
          },
          child: Icon(Icons.power_settings_new_outlined),
        ),
      ),
    );
  }
}
