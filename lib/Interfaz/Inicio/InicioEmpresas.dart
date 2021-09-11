import 'package:flutter/material.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Bll/ProductoService.dart';
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/paddingNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/paddingUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'dart:math';

class InicioEmpresas extends StatefulWidget {
  const InicioEmpresas({Key? key}) : super(key: key);

  @override
  _InicioEmpresasState createState() => _InicioEmpresasState();
}

List listaCategoriaDia = [
  "ESCUCHAR",
  "ESCUCHAR",
  "ESCUCHAR",
  "ESCUCHAR",
  "ESCUCHAR",
  "ESCUCHAR",
];

class _InicioEmpresasState extends State<InicioEmpresas> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var heigh = size.height;
    var moreSize = 50;
    const logoSize = 70.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: deliveryGradientsFinal,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: tipoVistaIzquierda(),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 300 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
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
                                    colors: deliveryGradientsFinal,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.zero),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 50, bottom: 40),
                                child: Column(
                                  children: [
                                    Text(
                                      "EMPRESAS",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 5, top: 30, bottom: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: logoSize + 3,
                                backgroundColor: Colors.red[200],
                                child: CircleAvatar(
                                  radius: logoSize,
                                  backgroundColor:
                                      DeliveryColorsFinal.redfinal4,
                                  child: ClipOval(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Image.asset(
                                        logo1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: FutureBuilder(
                            future: consultarEmpresaRuta1("EMPRESA"),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return tipoFuture(snapshot);
                            },
                          ),
                        ),
                      ),
                      tipoPadding(),
                    ],
                  ),
                ),
              ));
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ), //
    );
  }

  StatefulWidget tipoVistaIzquierda() {
    if (logueado == false) {
      return VistaIzquierdaNoUsuarios();
    } else {
      return VistaIzquierdaUsuarios();
    }
  }

  StatefulWidget tipoPadding() {
    if (logueado == false) {
      return PaddingNoUsuarios(
        Color2: Colors.redAccent,
        Color1: Colors.black54,
      );
    } else {
      return PaddingUsuarios(
        Color2: Colors.redAccent,
        Color1: Colors.black54,
      );
    }
  }

  dynamic tipoFuture(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        if (snapshot.data.length > 0) {
          try {
            //print(snapshot.data[index]["nombre"],);
            return ListTile(
              title: Text(
                snapshot.data[index]["nombre"],
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(snapshot.data[index]["descripcion"]),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Comprados: ${0}"),
                      IconButton(
                        iconSize: 25,
                        icon: Icon(Icons.mail_outline_sharp),
                        color: Colors.black,
                        onPressed: () {
                          /* Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => CarritoCliente(),
                            ),
                          );*/
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cuenta",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: DeliveryColorsRedOrange.red3,
                            ),
                          ),
                          Text(
                            "0",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              leading: new Container(
                height: 300,
                width: 100.0,
                //color: DeliveryColorsRedOrange.red3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(urlServidor +
                        "/" +
                        snapshot.data[index]['ruta'].toString()),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          } catch (e) {
            print("1 aqui");
            return CircularProgressIndicator();
          }
        }
        print("2 aqui");
        return CircularProgressIndicator();
      },
    );
  }
}
