// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Dal/ProductoRepository.dart';
import 'package:turismo/Entity/Productos.dart';

import '../roundIconBtn.dart';

class CarritoPage extends StatefulWidget {
  final Productos producto;
  const CarritoPage(this.producto, {Key? key}) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

int conteo = 0;

class _CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: ListView(
        children: [card()],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.attach_money_sharp),
        onPressed: () {},
      ),
    );
  }

  Widget listaProducto() {
    return FutureBuilder(
      future: consultarProductoPorId(widget.producto.idProducto.toString()),
      initialData: const [],
      builder: (context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        return ListView(
          children: [
            _listaCards(snapshot.data!, context),
          ],
        );
      },
    );
  }

  Widget card() {
    final card = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre del producto',
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.8),
            ),
            //Padding(padding: EdgeInsets.only(left: 50.0, top: 30.0)),
            Container(
              child: Row(
                children: [
                  const FadeInImage(
                    placeholder: AssetImage('assets/imagenes/loading-81.gif'),
                    image: NetworkImage(
                        'https://lamoto.com.ar/wp-content/uploads/2021/06/Las-mejores-marcas-de-cascos-para-motos.jpg'),
                    fadeInDuration: Duration(milliseconds: 200),
                    height: 120.0,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cantidad: $conteo',
                        textAlign: TextAlign.start,
                      ),
                      const Text('Precio unitario'),
                      const Text('489.000'),
                      const Text('479.000')
                    ],
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundIconBtn(
                      iconData: Icons.remove,
                      color: Colors.black38,
                      press: sustraer,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20 / 4),
                      child: Text(
                        "$conteo",
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ),
                    RoundIconBtn(
                      iconData: Icons.add,
                      press: agregar,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2, 10)),
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  void agregar() {
    setState(() => conteo++);
  }

  void sustraer() {
    if (conteo == 0) {
      return;
    }
    setState(() => conteo--);
  }

  _listaCards(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var opt in data) {
      final widgetTemp = ListTile(
          title: Text(opt['nombre']),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
          ));
      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    }
    return opciones;
  }
}
