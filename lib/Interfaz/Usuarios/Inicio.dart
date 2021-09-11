import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Bll/ProductoService.dart';
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/InicioEmpresas.dart';
import 'package:turismo/Interfaz/Usuarios/paddingNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/paddingUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'dart:math';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var width = size.width;
    //var moreSize = 50;
    return PageView(
      controller: controller,
      children: [_CentroInicioState()],
    );
  }
}

class _CentroInicioState extends StatefulWidget {
  @override
  __CentroInicioStateState createState() => __CentroInicioStateState();
}

int index2 = 0;
bool logueado = false;

class __CentroInicioStateState extends State<_CentroInicioState> {
  String consultatipo = "Productos";
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
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 1,
                              left: -moreSize / 2,
                              right: -moreSize / 2,
                              height: width, // + moreSize,
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
                                      "INICIO",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
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
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          children: <Widget>[
                            _crearInput(),
                            Divider(),
                            Text(
                              'Que desea hacer hoy?',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0),
                            ),
                            _crearListaCategoriaNombres(),
                            Divider(),
                            Text(
                              'Lista de ofertas',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0),
                            ),
                            _crearListaFotos2(),
                            Divider(),
                            Text(
                              'Lista de productos',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0),
                            ),
                            _crearListaFotos(),
                            Divider(),
                            Text(
                              'Top Empresas',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25.0),
                            ),
                            SizedBox(height: 10),
                            _crearCategorias(),
                          ],
                        ),
                      ),
                      tipoPadding(),
                    ],
                  ),
                ),
              ));
            },
          ),
          /* GestureDetector(
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
          )*/
        ],
      ),
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
        Color1: Colors.redAccent,
        Color2: Colors.black54,
      );
    } else {
      return PaddingUsuarios(
        Color1: Colors.redAccent,
        Color2: Colors.black54,
      );
    }
  }

  Widget _crearInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Producto o servicio',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  Widget _crearCategorias() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 60,
      child: Container(
        child: FutureBuilder(
          future: consultarEmpresaRuta1("EMPRESA"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return tipoFuture(snapshot);
          },
        ),
      ),
    );
  }

  dynamic tipoFuture(snapshot) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        return _estructuraTopEmpresas(snapshot, index);
      },
    );
  }

  Widget _estructuraTopEmpresas(snapshot, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red[200],
            radius: 27 + 3,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  urlServidor + "/" + snapshot.data[index]['ruta'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearListaFotos() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 210,
      child: Container(
        child: FutureBuilder(
          future: consultarProducto1(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return tipoFuture1(snapshot);
          },
        ),
      ),
    );
  }

  dynamic tipoFuture1(snapshot) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        return _estructuraListaProductos(snapshot, index);
      },
    );
  }

  Widget _estructuraListaProductos(snapshot, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: Card(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    height: 150,
                    child: Image.network(
                      urlServidor +
                          "/" +
                          snapshot.data[index]['ruta'].toString(),
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data[index]['nombre'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$ " + snapshot.data[index]['precio'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearListaCategoriaNombres() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 120,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              listaCategoriaDia.length == 0 ? 0 : listaCategoriaDia.length,
          itemBuilder: (context, index) {
            return _estructuraListaCategoriaNombres(listaCategoriaDia, index);
          },
        ),
      ),
    );
  }

  Widget _estructuraListaCategoriaNombres(listaCategoriaDia, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: Card(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    //alignment: Al,
                    height: 100,
                    child: Center(
                      child: Text(
                        listaCategoriaDia[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearListaFotos2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Card(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          child: Image.network(
                            "https://www.mundialdetornillos.com/images/NOTICIAS_2020/martillo-herramientas-para-tener-en-casa.jpg",
                            width: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          //alignment: Al,
                          height: 50,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "HOLA",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "HOLA",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: Card(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          color: Colors.blueAccent,
                          height: 150,
                          child: Image.network(
                            "https://www.mundialdetornillos.com/images/NOTICIAS_2020/martillo-herramientas-para-tener-en-casa.jpg",
                            width: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          //alignment: Al,
                          height: 50,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "HOLA",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "HOLA",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
