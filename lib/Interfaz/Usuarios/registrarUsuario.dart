import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/Inicio2.dart';
import 'package:turismo/Interfaz/constante.dart';

TextEditingController controladorTipoIdentificacion =
    new TextEditingController();
TextEditingController controladorIdentificacion = new TextEditingController();
TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladorApellido = new TextEditingController();
TextEditingController controladorDireccion = new TextEditingController();
TextEditingController controladorTelefono1 = new TextEditingController();
TextEditingController controladorTelefono2 = new TextEditingController();

class RegistrarUsuario extends StatefulWidget {
  @override
  _RegistrarUsuarioState createState() {
    return _RegistrarUsuarioState();
  }
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return _RegistrarUsuarioHomeState();
  }
}

class _RegistrarUsuarioHomeState extends StatefulWidget {
  @override
  _RegistrarUsuarioHomeStateState createState() {
    return _RegistrarUsuarioHomeStateState();
  }
}

class _RegistrarUsuarioHomeStateState
    extends State<_RegistrarUsuarioHomeState> {
  String _chosenValue1 = "Seleccionar";

  @override
  void initState() {
    controladorTipoIdentificacion = new TextEditingController();
    controladorIdentificacion = new TextEditingController();
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
                      MaterialPageRoute(builder: (_) => Inicio2()),
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
                        "Registro Persona",
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
                        "Tipo de identificacion",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: DeliveryColorsRedOrange.orange10,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 20, right: 10, top: 0),
                          child: SizedBox(
                            width: size.width / 1.5,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              //elevation: 5,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                              ),
                              underline: Container(
                                height: 4,
                                //color: DeliveryColors.green4,
                              ),
                              iconSize: 30,
                              items: <String>[
                                'Cedula ciudadania',
                                'Nro identificacion tributaria',
                                'Targeta de identidad',
                                'Registro civil',
                                'Cedula de extranjeria',
                                'Pasaporte',
                                'Numero unico de identificacion'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                _chosenValue1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              onChanged: (dynamic value) {
                                setState(() {
                                  _chosenValue1 = value;
                                  controladorTipoIdentificacion.text = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nº ID",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorIdentificacion,
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
                        "Apellidos",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: controladorApellido,
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
                          hintText: "Apellido",
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
