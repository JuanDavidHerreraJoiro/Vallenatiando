import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Inicio/Inicio2.dart';
import 'package:turismo/Interfaz/Inicio/login.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/constante.dart';

class VistaIzquierda2 extends StatefulWidget {
  @override
  _VistaIzquierda2State createState() => _VistaIzquierda2State();
}

class _VistaIzquierda2State extends State<VistaIzquierda2> {
  @override
  Widget build(BuildContext context) {
    const logoSize = 80.0;
    return Container(
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
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio2(),
                      ),
                    );
                  },
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
    );
  }
}
