import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
import 'package:turismo/Interfaz/Usuarios/registroProducto.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/constante.dart';

class TipoRegistro extends StatefulWidget {
  @override
  _TipoRegistroState createState() => _TipoRegistroState();
}

var atras = 'assets/icons/flechAtras.png';

class _TipoRegistroState extends State<TipoRegistro> {
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
                        builder: (_) => VistaIzquierdaUsuarios(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: (moreSize * 2),
                ),
                Text(
                  'Buscar',
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
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
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
                      backgroundColor:
                          DeliveryColorsRedOrange.red1, //Colors.green,
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(logo1),
                          ),
                        ),
                      )),
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
                      "Tipo de Registro",
                      style: TextStyle(
                          fontSize: 30,
                          color: DeliveryColorsRedOrange.red1,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        color: DeliveryColorsRedOrange.red3,
                        textColor: Colors.white,
                        child: Text(
                          "Empresa",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => RegistrarEmpresa(),
                            ),
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
                        color: DeliveryColorsRedOrange.red3,
                        textColor: Colors.white,
                        child: Text(
                          "Producto",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => RegistrarProducto(),
                            ),
                          );
                        },
                      ),
                    ),
                    /*const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 60,
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        elevation: 0,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.asset(atras),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Inicio2(),
                            ),
                          );
                        },
                      ),
                    )*/
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
