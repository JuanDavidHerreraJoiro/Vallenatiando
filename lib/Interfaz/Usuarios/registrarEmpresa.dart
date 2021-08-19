import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/vistaIzquierdaUsuarios.dart';
import 'package:turismo/Interfaz/constante.dart';

TextEditingController controladorNIT = new TextEditingController();
TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladorApellido = new TextEditingController();
TextEditingController controladorDireccion = new TextEditingController();
TextEditingController controladorTelefono1 = new TextEditingController();
TextEditingController controladorTelefono2 = new TextEditingController();

class RegistrarEmpresa extends StatefulWidget {
  @override
  _RegistrarEmpresaState createState() {
    return _RegistrarEmpresaState();
  }
}

class _RegistrarEmpresaState extends State<RegistrarEmpresa> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return _RegistrarEmpresaHomeState();
  }
}

class _RegistrarEmpresaHomeState extends StatefulWidget {
  @override
  _RegistrarEmpresaHomeStateState createState() {
    return _RegistrarEmpresaHomeStateState();
  }
}

class _RegistrarEmpresaHomeStateState
    extends State<_RegistrarEmpresaHomeState> {
  String _chosenValue1 = "Seleccionar";

  @override
  void initState() {
    controladorNIT = new TextEditingController();
    controladorNombre = new TextEditingController();
    controladorApellido = new TextEditingController();
    controladorDireccion = new TextEditingController();
    controladorTelefono1 = new TextEditingController();
    controladorTelefono2 = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 70.0;
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
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => VistaIzquierdaUsuarios()),
                    );
                  },
                ),
                SizedBox(
                  width: moreSize * 1.1,
                ),
                Text(
                  'VALLENATIANDO', //'Home'
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
                        "Registro Empresa",
                        style: TextStyle(
                            fontSize: 30,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "NIT de empresa",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorNIT,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_pin_outlined,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Nº ID",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nombres",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorNombre,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Nombre",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Direccion",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorDireccion,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.circle,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Direccion",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Telefono",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorTelefono1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Telefono",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Telefono",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorTelefono2,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: DeliveryColorsRedOrange.grey,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          hintText: "Telefono",
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
                    onTap: () async {},
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
