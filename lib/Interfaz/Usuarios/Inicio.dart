// ignore_for_file: unused_local_variable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Bll/ProductoService.dart';
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Entity/Productos.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/InicioEmpresas.dart';
import 'package:turismo/Interfaz/Usuarios/googleMaps.dart';
import 'package:turismo/Interfaz/Usuarios/paddingNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/paddingUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/detalles.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaNoUsuarios.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'dart:math';
import 'package:sizer/sizer.dart';

TextEditingController controladorBuscar = new TextEditingController();

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

//https://spng.pngfind.com/pngs/s/187-1878783_etiqueta-de-oferta-png-transparent-png.png
List listaCategoriaDia = [
  {"nombre": "Oferta", "urlImg": "assets/svg/etiqueta.svg"},
  {"nombre": "Mercado", "urlImg": "assets/svg/Mercado.svg"},
  {"nombre": "Hotel", "urlImg": "assets/svg/Hotel.svg"},
  {"nombre": "Ferreteria", "urlImg": "assets/svg/Ferreteria.svg"},
  {"nombre": "Domicilio", "urlImg": "assets/svg/Domicilio.svg"},
  {"nombre": "Salud", "urlImg": "assets/svg/salud.svg"},
  {"nombre": "Tecnologia", "urlImg": "assets/svg/Tecnologia.svg"},
  {"nombre": "Agro", "urlImg": "assets/svg/Agro.svg"},
  {"nombre": "Funeraria", "urlImg": "assets/svg/ataud.svg"},
  {"nombre": "Arte", "urlImg": "assets/svg/arte.svg"},
  {"nombre": "Licor", "urlImg": "assets/svg/licor.svg"},
  {"nombre": "Restaurante", "urlImg": "assets/svg/restaurante.svg"},
];

List listaPromo = [
  {"id": "4", "urlImg": "assets/imagenes/Promo4.jpeg"},
  {"id": "3", "urlImg": "assets/imagenes/Promo3.jpeg"},
  {"id": "9", "urlImg": "assets/imagenes/Promo9.jpeg"},
];

int index2 = 0;
bool logueado = false;

class __CentroInicioStateState extends State<_CentroInicioState> {
  String consultatipo = "Productos";
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    controladorBuscar = new TextEditingController();
    super.initState();
  }

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
                            AppBar(
                              backgroundColor: Colors.grey[50],
                              elevation: 0,
                              leading: IconButton(
                                icon: SvgPicture.asset(
                                  "assets/svg/menu.svg",
                                  color: DeliveryColorsFinal.redfinal3,
                                ),
                                onPressed: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                              ),
                              title: Center(
                                child: RichText(
                                  text: TextSpan(
                                      style: FontTexto.styleTitulo2,
                                      children: [
                                        TextSpan(
                                          text: "Vallena",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        TextSpan(
                                          text: "tiando",
                                          style: TextStyle(
                                              color: DeliveryColorsFinal
                                                  .redfinal3),
                                        )
                                      ]),
                                ),
                              ),
                              actions: <Widget>[
                                TipoNotificaciones(),
                              ],
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
                              '¿Que desea hacer hoy?',
                              style: FontTexto.styleTexto,
                            ),
                            _crearListaCategoriaNombres(),
                            Divider(),
                            _crearListaCategoriaDescuento(),
                            Divider(),
                            /*Row(
                              children: [
                                Text(
                                  'Lista de ofertas',
                                  style: FontTexto.styleTexto,
                                ),
                                Spacer(),
                                FlatButton(
                                  height: 2.h,
                                  minWidth: 3.w,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: DeliveryColorsFinal.redfinal3,
                                  onPressed: () {},
                                  child: Text(
                                    "Ver mas",
                                    style: FontTexto.styleVermas,
                                  ),
                                ),
                              ],
                            ),
                            _crearListaFotos2(),
                            Divider(),*/
                            Row(
                              children: [
                                Text(
                                  'Lista de productos',
                                  style: FontTexto.styleTexto,
                                ),
                                Spacer(),
                                FlatButton(
                                  height: 2.h,
                                  minWidth: 3.w,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: DeliveryColorsFinal.redfinal3,
                                  onPressed: () {},
                                  child: Text(
                                    "Ver mas",
                                    style: FontTexto.styleVermas,
                                  ),
                                ),
                              ],
                            ),
                            _crearListaFotos(),
                            Divider(),
                            Text(
                              'Top Empresas',
                              style: FontTexto.styleTexto,
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
        ],
      ),
    );
  }

  Widget TipoNotificaciones() {
    if (logueado == false) {
      return Container(
        color: Colors.white,
      );
    } else {
      return IconButton(
        icon: SvgPicture.asset(
          "assets/svg/notification.svg",
          //color: DeliveryColorsFinal.redfinal3,
        ),
        onPressed: () {},
      );
    }
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
        Color1: DeliveryColorsFinal.redfinal3,
        Color2: Colors.black54,
      );
    } else {
      return PaddingUsuarios(
        Color1: DeliveryColorsFinal.redfinal3,
        Color2: Colors.black54,
      );
    }
  }

  Widget _crearInput() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black54,
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: SvgPicture.asset("assets/svg/search.svg"),
              hintText: "Productos o Servicios",
              hintStyle: FontTexto.styleSearch,
            ),
          ),
        )
      ],
    );
  }

  Widget _crearCategorias() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 70,
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
            backgroundColor: Colors.grey[200],
            radius: 30 + 3,
            child: CircleAvatar(
              radius: 30,
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
      height: 230,
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
    return GestureDetector(
      onTap: () {
        Productos producto = new Productos();
        producto.idProducto = snapshot.data[index]['idProducto'].toString();
        producto.nombre = snapshot.data[index]['nombre'].toString();
        producto.descripcion = snapshot.data[index]['descripcion'].toString();
        producto.precio = snapshot.data[index]['precio'].toString();
        producto.fechaVigencia =
            snapshot.data[index]['fechaVigencia'].toString();
        producto.cantidad = snapshot.data[index]['cantidad'].toString();
        producto.precioOfertaOpcional =
            snapshot.data[index]['precioOfertaOpcional'].toString();
        producto.fechaVigenciaOferta =
            snapshot.data[index]['fechaVigenciaOferta'].toString();
        producto.estado = snapshot.data[index]['estado'].toString();
        producto.idEmpresa = snapshot.data[index]['idEmpresa'].toString();
        String ruta =
            urlServidor + "/" + snapshot.data[index]['ruta'].toString();

        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            reverseTransitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (context, animation, secondaryAnimation) =>
                FadeTransition(
              opacity: animation,
              child: Detalles(
                producto: producto,
                route: ruta,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20 * 1.25),
                ),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Image.network(
                      urlServidor +
                          "/" +
                          snapshot.data[index]['ruta'].toString(),
                      //width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data[index]['nombre'].toString(),
                            textAlign: TextAlign.center,
                            style: FontTexto.styleNombreProducto,
                          ),
                          Text(
                            "Ferreteria", //categoria
                            style: FontTexto.styleSubtexto,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "\$ ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                children: [
                                  TextSpan(
                                      text: snapshot.data[index]['precio']
                                          .toString(),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black)),
                                  TextSpan(
                                    text: " pesos",
                                    style: FontTexto.styleSubtexto,
                                  )
                                ]),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
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
          ],
        ),
      ),
    );
  }

  Widget _crearListaCategoriaDescuento() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 200,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listaPromo.length == 0 ? 0 : listaPromo.length,
          itemBuilder: (context, index) {
            return _estructuraListaDescuento(listaPromo, index);
          },
        ),
      ),
    );
  }

  Widget _estructuraListaDescuento(listaPromo, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: 400,
            //height: 00,
            // child: Card(
            //color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Container(
                  width: 400.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.redAccent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      listaPromo[index]["urlImg"],
                      height: 200.0,
                      width: 400.0,
                      fit: BoxFit.fill,
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

  Widget _crearListaCategoriaNombres() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 100,
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
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: 100,
            // child: Card(
            //color: Colors.transparent,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 100.0,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 27 + 4,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: SvgPicture.asset(
                                listaCategoriaDia[index]["urlImg"],
                                //color: DeliveryColorsFinal.redfinal3,
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          listaCategoriaDia[index]["nombre"],
                          textAlign: TextAlign.center,
                          style: FontTexto.styleTexto3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //),
          ),
        ],
      ),
    );
  }

  Widget _crearListaFotos2() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0),
      height: 230,
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20 * 1.25),
                    ),
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      /*Container(
                    height: 150,
                    child: Image.network(
                      urlServidor +
                          "/" +
                          snapshot.data[index]['ruta'].toString(),
                      //width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),*/
                      Container(
                        height: 150,
                        child: Image.network(
                            "https://www.mundialdetornillos.com/images/NOTICIAS_2020/martillo-herramientas-para-tener-en-casa.jpg",
                            //width: 300,
                            fit: BoxFit.contain),
                      ),
                      Container(
                        //alignment: Al,
                        height: 60,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HOLA",
                                textAlign: TextAlign.center,
                                style: FontTexto.styleTexto,
                              ),
                              Text(
                                "HOLA",
                                textAlign: TextAlign.center,
                                style: FontTexto.styleTexto,
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
          ), /*
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
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "HOLA",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
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
        */
        ],
      ),
    );
  }
}
