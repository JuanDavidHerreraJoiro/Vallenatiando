import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/PersonasService.dart';
import 'package:turismo/Entity/Personas.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioCuenta.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
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
  final String FG;
  RegistrarUsuario({Key? key, required this.persona, required this.FG});

  @override
  _RegistrarUsuarioState createState() {
    return _RegistrarUsuarioState();
  }
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var width = size.width;
    // ignore: unused_local_variable
    var moreSize = 50;
    return _RegistrarUsuarioHomeState(
      persona: widget.persona,
      FG: widget.FG,
    );
  }
}

// ignore: must_be_immutable
class _RegistrarUsuarioHomeState extends StatefulWidget {
  final String FG;
  Personas persona = new Personas();
  // ignore: unused_element
  _RegistrarUsuarioHomeState(
      {Key? key, required this.persona, required this.FG});

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
    // ignore: unused_local_variable
    var width = size.width;
    // ignore: unused_local_variable
    var moreSize = 50;
    // ignore: unused_local_variable
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
                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: DeliveryColorsRedOrange.red1,
                            fontWeight: FontWeight.w400),
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
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: DeliveryColorsRedOrange.red1,
                              fontWeight: FontWeight.w400),
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
                              style: GoogleFonts.montserrat(
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
                                style: GoogleFonts.montserrat(
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
                      TextFieldForm(
                        controlador: controladorIdentificacion,
                        icono: Icons.badge,
                        labelText: 'Identificacion',
                      ),
                      TextFieldForm(
                        controlador: controladorNombre,
                        icono: Icons.person_pin,
                        labelText: 'Nombre',
                      ),
                      TextFieldForm(
                        controlador: controladorApellido,
                        icono: Icons.person_pin,
                        labelText: 'Apellido',
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

                        print(personasnueva.toMap());

                        RegistrarPersonas1(personasnueva);
                        logueado = true;
                        idPersona = controladorTipoIdentificacion.text;

                        //print("--> " + widget.FG);
                        if (widget.FG == "G") {
                          String texto1 =
                              'EL USUARIO ES SU CORREO Y LA PASSWORD SON SU USUARIO DE GMAIL TEMPORALMENTE';
                          String texto2 = 'ADVERTENCIA';
                          await MensajeServiceFG(
                              context, texto1, Colors.grey, texto2, true);
                        } else if (widget.FG == "F") {
                          String texto1 =
                              'EL USUARIO ES SU CORREO Y LA PASSWORD SON SU USUARIO DE FACEBOOK TEMPORALMENTE';
                          String texto2 = 'ADVERTENCIA';
                          await MensajeServiceFG(
                              context, texto1, Colors.grey, texto2, true);
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => InicioSesion(),
                            ),
                          );
                        }
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
                          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
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
