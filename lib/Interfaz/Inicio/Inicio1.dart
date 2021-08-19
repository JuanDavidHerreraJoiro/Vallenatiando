import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/constante.dart';

class Inicio1 extends StatefulWidget {
  @override
  _Inicio1State createState() => _Inicio1State();
}

var logo1 = 'assets/imagenes/Vallenatiando1.png';
var logo2 = 'assets/imagenes/Vallenatiando2.png';

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
    const logoSize = 80.0;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: (logoSize * 2) + 3,
              child: CircleAvatar(
                radius: (logoSize * 2),
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
    );
  }
}
