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
  {"nombre": "Oferta", "urlImg": "assets/svg/Descuento.svg"},
  {"nombre": "Mercado", "urlImg": "assets/svg/Mercado.svg"},
  {"nombre": "Hoteleria", "urlImg": "assets/svg/Hotel.svg"},
  {"nombre": "Moteleria", "urlImg": "assets/svg/Motel.svg"},
  {"nombre": "Ferreteria", "urlImg": "assets/svg/Ferreteria.svg"},
  {"nombre": "Domicilios", "urlImg": "assets/svg/Domicilio.svg"},
  {"nombre": "Farmacia", "urlImg": "assets/svg/Farmacia.svg"},
  {"nombre": "IPS", "urlImg": "assets/svg/IPS.svg"},
  {"nombre": "EPS", "urlImg": "assets/svg/EPS.svg"},
  {"nombre": "Tecnologia", "urlImg": "assets/svg/Tecnologia.svg"},
  {"nombre": "Agro", "urlImg": "assets/svg/Agro.svg"},
  {"nombre": "Funeraria", "urlImg": "assets/svg/Funeral.svg"},
  {"nombre": "Arte", "urlImg": "assets/svg/Pintar.svg"},
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
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 60, bottom: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      "INICIO",
                                      style: FontTexto.styleAppbar,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16, right: 4, top: 50, bottom: 5),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    value == 0 ? value = 1 : value = 0;
                                  });
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 30,
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
                              '¿Que desea hacer hoy?',
                              style: FontTexto.styleTexto,
                            ),
                            _crearListaCategoriaNombres(),
                            Divider(),
                            _crearListaCategoriaDescuento(),
                            Divider(),
                            Text(
                              'Lista de ofertas',
                              style: FontTexto.styleTexto,
                            ),
                            _crearListaFotos2(),
                            Divider(),
                            Text(
                              'Lista de productos',
                              style: FontTexto.styleTexto,
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
    return TextFormField(
      controller: controladorBuscar,
      style: FontTexto.styleCajaTexto, // // Probar todos los teclados
      decoration: new InputDecoration(
        icon: Icon(
          Icons.search,
          color: DeliveryColorsFinal.redfinal3,
          size: 50,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DeliveryColorsFinal.redfinal3, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.5),
        ),
        labelText: "Productos y servicios",
        labelStyle: FontTexto.styleCajaTexto, // // Probar todos los teclados
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
            backgroundColor: DeliveryColorsFinal.redfinal3,
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
      height: 120,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              2, //listaCategoriaDia.length == 0 ? 0 : listaCategoriaDia.length,
          itemBuilder: (context, index) {
            return _estructuraListaDescuento(/*listaCategoriaDia,*/ index);
          },
        ),
      ),
    );
  }

  Widget _estructuraListaDescuento(/*listaCategoriaDia,*/ int index) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: 300,
            // child: Card(
            //color: Colors.transparent,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/svg/Rectangle1.svg",

                  //color: DeliveryColorsFinal.redfinal3,
                  width: 300.0,
                  height: 120,
                ),
              ],
            ),
            //),
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
                          radius: 27 + 3,
                          backgroundColor: DeliveryColorsFinal.redfinal3,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: SvgPicture.asset(
                                listaCategoriaDia[index]["urlImg"],
                                color: DeliveryColorsFinal.redfinal3,
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
