import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';

class Inicio1 extends StatefulWidget {
  @override
  _Inicio1State createState() => _Inicio1State();
}

//var logo1 = 'assets/imagenes/Vallenatiando1.png';
var logo1 = 'assets/imagenes/logoVallenatiando.png';

class _Inicio1State extends State<Inicio1> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Inicio(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const logoSize = 70.0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradientsFinal,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red[200],
              radius: (logoSize * 2) + 5,
              child: CircleAvatar(
                radius: (logoSize * 2),
                backgroundColor: Colors.red[200],
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
    );
  }
}
