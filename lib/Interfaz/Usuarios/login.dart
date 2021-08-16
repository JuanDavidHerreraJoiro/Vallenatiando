import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turismo/Interfaz/Inicio/Inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/constante.dart';

bool verpassword = true;
const logoSize = 60.0;
bool deacuerdo = false;
TextEditingController controladorusuario = new TextEditingController();
TextEditingController controladorpassword = new TextEditingController();
TextEditingController controladorrepetirpassword = new TextEditingController();

class CuentaLogin extends StatefulWidget {
  @override
  _CuentaLoginState createState() {
    return _CuentaLoginState();
  }
}

class _CuentaLoginState extends State<CuentaLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return _CuentaLoginHomeState();
  }
}

class _CuentaLoginHomeState extends StatefulWidget {
  @override
  _CuentaLoginHomeStateState createState() {
    return _CuentaLoginHomeStateState();
  }
}

class _CuentaLoginHomeStateState extends State<_CuentaLoginHomeState> {
  void visibility() {
    setState(() {
      verpassword = !verpassword;
    });
  }

  @override
  void initState() {
    controladorusuario = TextEditingController();
    controladorpassword = TextEditingController();
    controladorrepetirpassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5.0, bottom: 5.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 25,
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    /*Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => VistaIzquierdaAdministrador(),
                      ),
                    );*/
                  },
                ),
                Text(
                  'REGISTRAR USUARIO', //'Home'
                  style: new TextStyle(
                      fontSize: 18.0,
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
                colors: deliveryGradients),
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
            flex: 6,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Crear Cuenta",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DeliveryColorsRedOrange.red2,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Usuario",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DeliveryColorsRedOrange.red2,
                            ),
                      ),
                      TextField(
                        controller: controladorusuario,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_sharp,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.red2,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Usuario",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Password",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DeliveryColorsRedOrange.red2,
                            ),
                      ),
                      TextField(
                        controller: controladorpassword,
                        obscureText: verpassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key_sharp,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.red2,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Password",
                          suffix: GestureDetector(
                            onTap: visibility,
                            child: Icon(verpassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Repetir Password",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: DeliveryColorsRedOrange.red2,
                            ),
                      ),
                      TextField(
                        controller: controladorrepetirpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key_sharp,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.red2,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Repetir Password",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => RegistrarUsuario(),
                      ),
                    );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: deliveryGradients,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Registrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
