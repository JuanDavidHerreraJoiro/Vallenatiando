import 'package:flutter/material.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmprendimiento.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'package:google_fonts/google_fonts.dart';

class TipoRegistroEmpresa extends StatefulWidget {
  TipoRegistroEmpresa({Key? key}) : super(key: key);

  @override
  _TipoRegistroEmpresaState createState() => _TipoRegistroEmpresaState();
}

class _TipoRegistroEmpresaState extends State<TipoRegistroEmpresa> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 90.0;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -moreSize / 2,
                  right: -moreSize / 2,
                  height: width + moreSize,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: deliveryGradientsFinal,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 30, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Inicio()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: logoSize + 3,
                    backgroundColor: DeliveryColorsRedOrange.red3,
                    child: CircleAvatar(
                      radius: logoSize,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(logo1),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Vallenatiando",
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: DeliveryColorsFinal.redfinal4,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: DeliveryColorsRedOrange.red3,
                        textColor: Colors.white,
                        child: Text(
                          "Registrar empresa",
                          style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () async {
                          List listaEmpresa =
                              await ConsultarIdentificacionPersonasEmpresa1(
                                  idPersona);

                          if (listaEmpresa.length == 0) {
                            //print("${listaEmpresa.length}");
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => RegistrarEmpresa(
                                  estadoUbicacion: "No registrado",
                                ),
                              ),
                            );
                          } else {
                            String texto1 = '¿REGISTRAR OTRA EMPRESA?';
                            String texto2 = 'ADVERTENCIA';
                            MensajeServiceEmpresaProducto(
                                context, texto1, Colors.grey, texto2, true);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: DeliveryColorsFinal.redfinal4,
                        textColor: Colors.white,
                        child: Text(
                          "Crear emprendimiento",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => RegistrarEmprendimiento(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
