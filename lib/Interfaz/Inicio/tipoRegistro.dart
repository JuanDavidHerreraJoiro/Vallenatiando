import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
import 'package:turismo/Interfaz/Usuarios/registroProducto.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/constante.dart';

class TipoRegistro extends StatefulWidget {
  @override
  _TipoRegistroState createState() => _TipoRegistroState();
}

var atras = 'assets/icons/flechAtras.png';

class _TipoRegistroState extends State<TipoRegistro> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 80.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
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
                        colors: [Colors.orangeAccent, Colors.redAccent],
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
                      backgroundColor:
                          DeliveryColorsRedOrange.red1, //Colors.green,
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(logo1),
                          ),
                        ),
                      )),
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
                      height: 40,
                    ),
                    Text(
                      "TIPO DE REGISTRO",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: DeliveryColorsRedOrange.red1,
                          ),
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
                          "Empresa",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) => RegistrarEmpresa()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                          "Producto",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) => RegistrarProducto()),
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
