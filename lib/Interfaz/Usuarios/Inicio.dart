import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Inicio/buscar.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierda2.dart';
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
      children: [_CentroInicioState(), Buscar()],
    );
  }
}

class _CentroInicioState extends StatefulWidget {
  @override
  __CentroInicioStateState createState() => __CentroInicioStateState();
}

int index2 = 0;

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
                colors: deliveryGradients,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: VistaIzquierda2(),
          ),
          /*SafeArea(
            child: Container(
              width: 300.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: (logoSize + 10) + 2,
                            child: CircleAvatar(
                              radius: (logoSize + 10),
                              backgroundColor: Colors.white,
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
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.fiber_new,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Crear Cuenta",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.local_offer,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Ofertas",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.live_help,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Ayuda",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.menu_book,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Terminos Legales",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Acerca de ¿?",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),*/
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
                                    colors: [
                                      Colors.orangeAccent,
                                      Colors.redAccent,
                                    ],
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
                                    SizedBox(
                                      height: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 380, top: 35, bottom: 40),
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              value == 0
                                                  ? value = 1
                                                  : value = 0;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                )),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                  radius: logoSize + 3,
                                  backgroundColor: DeliveryColorsRedOrange
                                      .red1, //Colors.green,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: FutureBuilder(
                            future: null, //_listaCliente,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return tipoFuture(snapshot);
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
                                    color: Colors.redAccent,
                                    onPressed: () {
                                      setState(() {});
                                    },
                                  ),
                                  Text(
                                    "Inicio",
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
                                    icon: Icon(Icons.search_sharp),
                                    color: Colors.black54,
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (_) => Buscar(),
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    "Buscar",
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
                                    icon: Icon(Icons.shopping_cart_outlined),
                                    color: Colors.black54,
                                    onPressed: () {},
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
      ),
    );
  }
}

//Future<List<Cliente>> tipoLista(/*token*/) {

//if (index2 == 0) {

// return _listaCliente;
/*} else if (index2 == 1) {
    return listaClientes(http.Client(), token);
  }
  if (index2 == 2) {
    return listaEmpleados(http.Client(), token);
  }*/

//List<dynamic> num = <dynamic>["1"];
//}

dynamic tipoFuture(snapshot) {
  //if (index2 == 0) {
  return ListView.builder(
    itemCount: 5 /*snapshot.data == null ? 0 : snapshot.data.length*/,
    itemBuilder: (context, index) {
      if (snapshot.data == null) {
        try {
          return ListTile(
            title: Text(
              "Producto ${index + 1}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descripcion: "),
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
                        Text("Cuenta",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: DeliveryColorsRedOrange.red3,
                            )),
                        Text("0",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
            leading: ClipRRect(
              //borderRadius: BorderRadius.circular(0), //or 15.0
              child: Container(
                height: 80.0,
                width: 80.0,
                color: DeliveryColorsRedOrange.red3,
                //child: backgrounI Icon(Icons.volume_up, color: Colors.white, size: 50.0),
              ),
            ),
            /*CircleAvatar(
              //color: DeliveryColors.dark,
              backgroundColor: DeliveryColorsRedOrange.red3,
              /* backgroundImage: NetworkImage(snapshot
                                        .data[index]['Foto']
                                        .toString()),*/ //exepcion
            ),*/
            trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[]),
          );
        } catch (e) {
          return CircularProgressIndicator();
        }
      }
      return CircularProgressIndicator();
    },
  );
}
