import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/buscar.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierda.dart';
import 'package:turismo/Interfaz/constante.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
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
        VistaIzquierda(),
        _CentroInicioState(),
        Buscar(),
      ],
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var heigh = size.height;
    var moreSize = 50;
    const logoSize = 70.0;
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
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => VistaIzquierda(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: (moreSize * 2),
                ),
                Text(
                  'Inicio', //'Home'
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
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: FutureBuilder(
                future: null, //_listaCliente,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                        color: Colors.black54,
                        onPressed: () {
                          setState(() {});
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
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Buscar(),
                            ),
                          );
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
