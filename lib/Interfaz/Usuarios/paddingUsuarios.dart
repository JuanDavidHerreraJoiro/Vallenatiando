import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/InicioEmpresas.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';

class PaddingUsuarios extends StatefulWidget {
  final Color1;
  final Color2;

  const PaddingUsuarios({Key? key, required this.Color1, required this.Color2})
      : super(key: key);
  @override
  _PaddingUsuariosState createState() => _PaddingUsuariosState();
}

class _PaddingUsuariosState extends State<PaddingUsuarios> {
  @override
  Widget build(BuildContext context) {
    const logoSize = 80.0;
    return Padding(
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
                  color: widget.Color1, //Colors.redAccent,
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
                      color: widget.Color1, //,Colors.redAccent,
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
                  icon: Icon(Icons.business_outlined),
                  color: widget.Color2, //Colors.black54,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => InicioEmpresas(),
                      ),
                    );
                  },
                ),
                Text(
                  "Empresas",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.Color2, //Colors.black45,
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
    );
  }
}
