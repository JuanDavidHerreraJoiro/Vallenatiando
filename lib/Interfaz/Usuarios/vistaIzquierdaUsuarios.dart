import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/InicioCuenta.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/tipoRegistro.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/constante.dart';

class VistaIzquierdaUsuarios extends StatefulWidget {
  @override
  _VistaIzquierdaUsuariosState createState() => _VistaIzquierdaUsuariosState();
}

class _VistaIzquierdaUsuariosState extends State<VistaIzquierdaUsuarios> {
  @override
  Widget build(BuildContext context) {
    const logoSize = 80.0;
    return Container(
      width: 300.0,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
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
            flex: 4,
            child: ListView(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Inicio",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Mi perfil",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => TipoRegistro(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.point_of_sale,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Quiero Vender",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
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
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Favoritos",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.notification_add,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Notificicaciones",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Mis Compras",
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
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 4, left: 0, right: 0, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      Text(
                        "Ajustes",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ), //
                ),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(
                        iconSize: 35,
                        icon: Icon(Icons.exit_to_app_sharp),
                        color: Colors.white,
                        onPressed: () {
                          logueado = false;
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Inicio(),
                            ),
                          );
                        },
                      ),
                      Text(
                        "Salir",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                        textAlign: TextAlign.center,
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
