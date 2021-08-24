import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/buscar.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';

class PaddingNoUsuarios extends StatefulWidget {
  @override
  _PaddingNoUsuariosState createState() => _PaddingNoUsuariosState();
}

class _PaddingNoUsuariosState extends State<PaddingNoUsuarios> {
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
                  color: Colors.redAccent,
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
