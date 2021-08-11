import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';

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
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  iconSize: 25,
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: (moreSize * 2),
                ),
                Text(
                  'Buscar',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: deliveryGradients,
              ),
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
          const SizedBox(
            height: 10,
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
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
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: FutureBuilder(
                future: null, //_listaCliente,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                        style: Theme.of(context).textTheme.headline6!.copyWith(
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
                        color: Colors.black54,
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                      Text(
                        "Buscar",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
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
                        style: Theme.of(context).textTheme.headline6!.copyWith(
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
              top: 5,
              bottom: 5,
            ),
            child: ListView(
              children: [
                ClipRRect(
                  //borderRadius: BorderRadius.circular(0), //or 15.0
                  child: Container(
                    height: 200.0,
                    width: 400.0,
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
                  //borderRadius: BorderRadius.circular(0), //or 15.0
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
