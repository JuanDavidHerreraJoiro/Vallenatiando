import 'package:flutter/material.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/PersonasService.dart';
import 'package:turismo/Entity/Personas.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioCuenta.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
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
  Personas persona = new Personas();
  RegistrarUsuario({Key? key, required this.persona});

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
    return _RegistrarUsuarioHomeState(persona: widget.persona);
  }
}

class _RegistrarUsuarioHomeState extends StatefulWidget {
  Personas persona = new Personas();
  _RegistrarUsuarioHomeState({Key? key, required this.persona});

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
                        height: 40,
                      ),
                      Text(
                        "Registro de Datos Personales",
                        style: TextStyle(
                            fontSize: 30,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: Text(
                          "Tipo de identificacion",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18,
                              color: DeliveryColorsRedOrange.red1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.redAccent]),
                          color: DeliveryColorsRedOrange.orange10,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 20, right: 30, top: 0),
                          child: SizedBox(
                            width: size.width * 0.8,
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorIdentificacion,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.badge,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Identificacion',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorNombre,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.person_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Nombre',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorApellido,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.person_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Apellido',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorDireccion,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.directions,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Direccion',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorTelefono1,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Telefono 1',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: controladorTelefono2,
                          style: TextStyle(
                            color: Colors.black,
                          ), // // Probar todos los teclados
                          decoration: new InputDecoration(
                              icon: Icon(
                                Icons.phone_android,
                                color: Colors.red,
                                size: 40,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                              ),
                              labelText: 'Telefono 2',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      ),
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
                    onTap: () async {
                      if (controladorTipoIdentificacion.text.isNotEmpty &&
                          controladorIdentificacion.text.isNotEmpty &&
                          controladorNombre.text.isNotEmpty &&
                          controladorApellido.text.isNotEmpty &&
                          controladorDireccion.text.isNotEmpty &&
                          controladorTelefono1.text.isNotEmpty) {
                        Personas personasnueva = new Personas();
                        personasnueva.tipoIdentificacion =
                            controladorTipoIdentificacion.text;
                        personasnueva.idPersona =
                            controladorIdentificacion.text;
                        personasnueva.nombre = controladorNombre.text;
                        personasnueva.apellido = controladorApellido.text;
                        personasnueva.direccion = controladorDireccion.text;
                        personasnueva.telefono = controladorTelefono1.text;
                        personasnueva.celular = controladorTelefono2.text;
                        personasnueva.estado = "ACTIVO";
                        personasnueva.usuario = widget.persona.usuario;
                        personasnueva.password = widget.persona.password;

                        RegistrarPersonas1(personasnueva);

                        print(personasnueva.toMap());
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => InicioSesion(),
                          ),
                        );
                      } else {
                        String texto1 = '¿HAY CAMPOS VACIOS?';
                        String texto2 = 'REGISTRAR PERSONA ERROR...';
                        MensajeService(context, texto1,
                            DeliveryColorsRedOrange.red3, texto2, false);
                      }
                    },
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
                          builder: (_) => InicioCuenta(),
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

Widget _buildCircleAvatar(BuildContext context) {
  return Center(
      child: Stack(
    children: <Widget>[
      CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage(logo1),
      ),
    ],
  ));
}
