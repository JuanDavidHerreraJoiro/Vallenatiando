import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icon/icon.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Inicio/Inicio2.dart';
import 'package:turismo/Interfaz/Inicio/tipoRegistro.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';

class VistaIzquierda extends StatefulWidget {
  @override
  _VistaIzquierdaState createState() => _VistaIzquierdaState();
}

class _VistaIzquierdaState extends State<VistaIzquierda> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var width = size.width;
    //var moreSize = 50;
    return PageView(
      children: [_VistaIzquierdaHomeState(), Inicio()],
    );
  }
}

class _VistaIzquierdaHomeState extends StatefulWidget {
  @override
  _VistaIzquierdaHomeStateState createState() =>
      _VistaIzquierdaHomeStateState();
}

class _VistaIzquierdaHomeStateState extends State<_VistaIzquierdaHomeState> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 70.0;
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
            child: IconButton(
              iconSize: 25,
              alignment: Alignment.bottomRight,
              icon: IconToo(Icons.close),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => Inicio(),
                  ),
                );
              },
            ),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: deliveryGradients),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
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
                        colors: deliveryGradients,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
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
            flex: 6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "VALLENATIANDO",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Buscador",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.notifications),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Notificaciones",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.shopping_cart),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Mis Compras",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.favorite),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Favoritos",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.local_offer),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Ofertas",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.point_of_sale),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Quiero Vender",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                //validar si tiene empresa 
                                //si tiene empresa muestra Registras Producto
                                //No tiene muestra registrar empresa
                                MaterialPageRoute(
                                  builder: (_) =>
                                      TipoRegistro(), //RegistrarEmpresa(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.live_help),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Ayuda",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.fiber_new),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Crear Cuenta",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => Inicio2(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.person_sharp),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Mi Perfil",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.menu_book),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Terminos Legales",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(logoSize),
                            ),
                            color: DeliveryColorsRedOrange.red3,
                            textColor: Colors.white,
                            child: Row(
                              children: [
                                Icon(Icons.more_horiz),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "A cerca de",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 5, left: 0, right: 0, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.settings),
                        color: Colors.black54,
                        onPressed: () {},
                      ),
                      Text(
                        "Ajustes",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ), //
                ),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.exit_to_app_sharp),
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Inicio(),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Salir",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ), //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
