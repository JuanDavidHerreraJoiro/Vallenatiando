import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/constante.dart';

class InicioCuenta extends StatefulWidget {
  @override
  _InicioCuentaState createState() => _InicioCuentaState();
}

var facebook = 'assets/icons/facebook.png';
var gmail = 'assets/icons/gmail.png';

class _InicioCuentaState extends State<InicioCuenta> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 80.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -moreSize / 2,
                  right: -moreSize / 2,
                  height: width + moreSize,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.orangeAccent, Colors.redAccent],
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 30, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Inicio()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: logoSize + 3,
                    backgroundColor: DeliveryColorsRedOrange.red3,
                    child: CircleAvatar(
                      radius: logoSize,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(logo1),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "BIENVENIDO",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: DeliveryColorsRedOrange.red1,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: DeliveryColorsRedOrange.red3,
                        textColor: Colors.white,
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => InicioSesion()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: Colors.red[100],
                        textColor: Colors.white,
                        child: Text(
                          "Registrarse",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => CuentaLogin(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("O"),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          child: FloatingActionButton(
                            heroTag: "btn1",
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue[300],
                              child: ClipOval(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(facebook),
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: FloatingActionButton(
                            heroTag: "btn2",
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.red[300],
                              child: ClipOval(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(gmail),
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: new Text(
                        "Terminos y condiciones",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        print("2");
                      }, //=> launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
