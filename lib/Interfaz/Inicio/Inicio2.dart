import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Inicio/login.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierda.dart';
import 'package:turismo/Interfaz/constante.dart';

class Inicio2 extends StatefulWidget {
  @override
  _Inicio2State createState() => _Inicio2State();
}

var facebook = 'assets/icons/facebook.png';
var gmail = 'assets/icons/gmail.png';

class _Inicio2State extends State<Inicio2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 80.0;
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  
                  iconSize: 25,
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => Inicio(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: (moreSize * 2),
                ),
                Text(
                  'Inicio',
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: deliveryGradients,
            ),
            
            /*boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]*/
          ),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
      ),
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
                        colors: deliveryGradients,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
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
                      "Bienvenido",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.bold,
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
                          "Login",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => Login()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => RegistrarUsuario(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                      Text("OR"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: Divider(
                              color: Colors.black,
                              height: 36,
                            )),
                      ),
                    ]),
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
                              color: Colors.blueAccent,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        print("2");
                      }, //=> launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
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
