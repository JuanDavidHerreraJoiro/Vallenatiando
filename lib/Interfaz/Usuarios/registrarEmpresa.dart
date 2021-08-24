import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Inicio/tipoRegistro.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/componentes/TextFieldFormDescription.dart';
import 'package:turismo/Interfaz/constante.dart';

TextEditingController controladorNIT = new TextEditingController();
TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladoremail = new TextEditingController();
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
    controladoremail = new TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Registro Empresa",
                        style: TextStyle(
                            fontSize: 25,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldForm(
                        controlador: controladorNIT, 
                        icono: Icons.badge,
                        labelText: 'NIT',
                      ),
                      TextFieldForm(
                        controlador: controladorNombre, 
                        icono: Icons.person_pin,
                        labelText: 'Nombre de la Empresa',
                      ),
                      TextFieldForm(
                        controlador: controladoremail, 
                        icono: Icons.alternate_email,
                        labelText: 'Correo',
                      ),
                      TextFieldForm(
                        controlador: controladorDireccion, 
                        icono: Icons.directions,
                        labelText: 'Direccion',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono1, 
                        icono: Icons.phone,
                        labelText: 'Telefono 1',
                      ),
                      TextFieldForm(
                        controlador: controladorTelefono2, 
                        icono: Icons.phone,
                        labelText: 'Telefono 2',
                      ),
                      TextFieldFormDescription(
                        controlador: controladorNombre, 
                        icono: Icons.description,
                        labelText: "Descripcion",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () async { },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.orangeAccent,
                            Colors.redAccent,
                          ],
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
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => TipoRegistro(),
                        ),
                      );
                    },
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


