// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Bll/CarritoService.dart';
import 'package:turismo/Entity/Carrito.dart';
import 'package:turismo/Entity/Productos.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/cardCounter.dart';
import 'package:turismo/Interfaz/Usuarios/pages/carrito.dart';

import 'cartCounter.dart';

class Detalles extends StatefulWidget {
  final Productos producto;
  final String route;
  const Detalles({Key? key, required this.producto, required this.route})
      : super(key: key);
  @override
  _DetallesState createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  @override
  Widget build(BuildContext context) {
    //print(widget.producto.toMap());
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: tipoBoton(),
          ),
        ),
      ),
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: InteractiveViewer(
                    child: Hero(
                      tag: "",
                      child: Image.network(
                        widget.route,
                        //width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: CardCounter(int.parse(widget.producto.cantidad)),
                )
              ],
            ),
          ),
          SizedBox(height: 20 * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.producto.nombre,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Text.rich(
                  TextSpan(
                      text: "\$ ",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.red),
                      children: [
                        TextSpan(
                            text: widget.producto.precio,
                            style: GoogleFonts.montserrat(color: Colors.black)),
                        TextSpan(
                          text: " pesos",
                          style: GoogleFonts.montserrat(
                              color: Colors.black26,
                              fontWeight: FontWeight.normal),
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.producto.descripcion,
              style: GoogleFonts.montserrat(
                color: Color(0xFFBDBDBD),
                fontSize: 20,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => Inicio(),
            ),
          );
        },
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Ferreteria",
        style: GoogleFonts.montserrat(color: Colors.black),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        SizedBox(width: 20),
      ],
    );
  }

  Widget tipoBoton() {
    if (logueado == true) {
      return ElevatedButton(
        onPressed: () {
          registrarCarrito(widget.producto.idProducto);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => CarritoPage(widget.producto)));
        },
        child: Text(
          "Agregar al carrito",
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => InicioCuenta(),
            ),
          );
        },
        child: Text(
          "Iniciar sesion",
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void registrarCarrito(var id) {
    Carrito carrito = Carrito();

    carrito.id_cliente = "1";
    carrito.id_producto = id;

    RegistrarCarrito1(carrito);
  }
}
