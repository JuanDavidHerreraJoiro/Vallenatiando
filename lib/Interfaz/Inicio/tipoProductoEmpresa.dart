import 'package:flutter/material.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Dal/Global.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registroProducto.dart';
import 'package:turismo/Interfaz/Usuarios/tipoRegistroEmpresa.dart';
import 'package:turismo/Interfaz/constante.dart';

class TipoProductoEmpresa extends StatefulWidget {
  @override
  _TipoProductoEmpresaState createState() => _TipoProductoEmpresaState();
}

var atras = 'assets/icons/flechAtras.png';

class _TipoProductoEmpresaState extends State<TipoProductoEmpresa> {
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
            flex: 3,
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
                        colors: deliveryGradientsFinal,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 45, bottom: 40),
                    child: Column(
                      children: [
                        Text(
                          "MIS EMPRESAS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 30, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => TipoRegistroEmpresa()),
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
                      backgroundColor: Colors.red[200],
                      child: CircleAvatar(
                        radius: logoSize,
                        backgroundColor: Colors.red[200],
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(logo1),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: FutureBuilder(
                future: consultarMiEmpresa1("EMPRESA", idPersona),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return tipoFuture(snapshot);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic tipoFuture(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data == null ? 0 : snapshot.data.length,
      itemBuilder: (context, index) {
        if (snapshot.data.length >
            0 /*&&snapshot.data[index]["idPersona"] == idPersona*/) {
          try {
            return ListBody(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${snapshot.data[index]["nombre"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "NIT ${snapshot.data[index]["idEmpresa"]}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      //print("NIT ${snapshot.data[index]["idEmpresa"]}");
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => RegistrarProducto(
                            idEmpresa: snapshot.data[index]["idEmpresa"],
                          ),
                        ),
                      );
                    },
                    child: new Container(
                      height: 120,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(urlServidor +
                              "/" +
                              snapshot.data[index]['ruta'].toString()),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } catch (e) {
            print("1 aqui" + e.toString());
            return CircularProgressIndicator();
          }
        }
        print("2 aqui");
        return CircularProgressIndicator();
      },
    );
  }
}
