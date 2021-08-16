import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'dart:math';

class Buscar extends StatefulWidget {
  @override
  _BuscarState createState() => _BuscarState();
}

double itemHeight = 0;
double itemWidth = 0;
int cantidad = 0;

class _BuscarState extends State<Buscar> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var width = size.width;
    //var moreSize = 50;

    return PageView(
      controller: controller,
      children: [
        Inicio(),
        _CentroBuscarState(),
      ],
    );
  }
}

class _CentroBuscarState extends StatefulWidget {
  @override
  __CentroBuscarStateState createState() => __CentroBuscarStateState();
}

int index2 = 0;

class __CentroBuscarStateState extends State<_CentroBuscarState> {
  String consultatipo = "Productos";
  double value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var heigh = size.height;
    var moreSize = 50;
    const logoSize = 70.0;
    itemHeight = (size.height - kToolbarHeight - 100 * 5) / 2;
    itemWidth = size.width / 2;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: deliveryGradients,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
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
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            //flex: 1,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: TextField(
                                        //controller: ,//controladorBuscar,
                                        textAlign: TextAlign.left,
                                        onChanged: (letra) {
                                          setState(() {});
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search_sharp,
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                              color:
                                                  DeliveryColorsRedOrange.grey,
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          hintText: "Buscador",
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: FutureBuilder(
                            future: null, //_listaCliente,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              try {
                                cantidad = 5;
                                //cantidad = snapshot.data.length;
                                return tipoFuture(snapshot);
                              } catch (e) {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: FutureBuilder(
                            future: null, //_listaCliente,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              try {
                                cantidad = 5;
                                //cantidad = snapshot.data.length;
                                return tipoFuture3(snapshot);
                              } catch (e) {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: FutureBuilder(
                            future: null, //_listaCliente,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              try {
                                cantidad = 5;
                                //cantidad = snapshot.data.length;
                                return tipoFuture1(snapshot);
                              } catch (e) {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  IconButton(
                                    iconSize: 35,
                                    icon: Icon(Icons.home_outlined),
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
                                    "Inicio",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ), //
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  IconButton(
                                    iconSize: 35,
                                    icon: Icon(Icons.search_sharp),
                                    color: Colors.redAccent,
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                  Text(
                                    "Buscar",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent,
                                            fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ), //
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  IconButton(
                                    iconSize: 35,
                                    icon: Icon(Icons.shopping_cart_outlined),
                                    color: Colors.black54,
                                    onPressed: () {
                                      /* Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => CarritoCliente(),
                            ),
                          );*/
                                    },
                                  ),
                                  Text(
                                    "Carrito",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ), //
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
/*
Future<dynamic> tipoLista(token) {
  if (index2 == 0) {
    return listaProductos(http.Client(), token);
  } else if (index2 == 1) {
    return listaClientes(http.Client(), token);
  }
}*/

dynamic tipoFuture(snapshot) {
  if (index2 == 0) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 1,
      children: List.generate(cantidad, (index) {
        try {
          return Container(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
              top: 2,
              bottom: 2,
            ),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), //or 15.0
                  child: Container(
                    height: 160.0,
                    color: DeliveryColorsRedOrange.red3,
                    //child: backgrounI Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                  ),
                ),
                Text(
                  "Producto ${index + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          return CircularProgressIndicator();
        }
      }),
    );
  } else if (index2 == 1 || index2 == 2) {
    return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        if (snapshot.data != null) {
          try {
            return ListTile(
              title: Text(
                "CARGANDO",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } catch (e) {
            return CircularProgressIndicator();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

dynamic tipoFuture3(snapshot) {
  if (index2 == 0) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 1,
      children: List.generate(cantidad, (index) {
        try {
          return Container(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
              top: 2,
              bottom: 2,
            ),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), //or 15.0
                  child: Container(
                    height: 150.0,
                    //width: 200.0,
                    color: DeliveryColorsRedOrange.red3,
                    //child: backgrounI Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                  ),
                ),
                Text(
                  "Producto ${index + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          return CircularProgressIndicator();
        }
      }),
    );
  } else if (index2 == 1 || index2 == 2) {
    return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        if (snapshot.data != null) {
          try {
            return ListTile(
              title: Text(
                "CARGANDO",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } catch (e) {
            return CircularProgressIndicator();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

dynamic tipoFuture1(snapshot) {
  if (index2 == 0) {
    return GridView.count(
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 2,
      children: List.generate(cantidad, (index) {
        try {
          return Container(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
              top: 5,
              bottom: 5,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15), //or 15.0
                  child: Container(
                    height: 90.0,
                    width: 200.0,
                    color: DeliveryColorsRedOrange.red3,
                    //child: backgrounI Icon(Icons.volume_up, color: Colors.white, size: 50.0),
                  ),
                ),
                Text(
                  "Producto ${index + 1}",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        } catch (e) {
          return CircularProgressIndicator();
        }
      }),
    );
  } else if (index2 == 1 || index2 == 2) {
    return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        if (snapshot.data != null) {
          try {
            return ListTile(
              title: Text(
                "CARGANDO",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } catch (e) {
            return CircularProgressIndicator();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
