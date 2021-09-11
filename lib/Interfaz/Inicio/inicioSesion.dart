import 'package:flutter/material.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/UsuariosServices.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/componentes/textFormfield.dart';
import 'package:turismo/Interfaz/constante.dart';

bool verpassword = true;

TextEditingController controladorUsuario = new TextEditingController();
TextEditingController controladorPassword = new TextEditingController();
String idPersona = "";

class InicioSesion extends StatefulWidget {
  @override
  _InicioSesionState createState() => _InicioSesionState();
}

class _InicioSesionState extends State<InicioSesion> {
  @override
  void initState() {
    controladorUsuario;
    controladorPassword;
    controladorUsuario.text = "";
    controladorPassword.text = "";
    super.initState();
  }

  void visibility() {
    setState(() {
      verpassword = !verpassword;
    });
  }

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
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Inicio de sesión",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: DeliveryColorsRedOrange.red7,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controladorUsuario,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                          hintText: "Usuario",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: controladorPassword,
                        obscureText: verpassword,
                        cursorColor: Colors.redAccent,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: "Contraseña",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                          suffix: GestureDetector(
                            onTap: visibility,
                            child: Icon(
                              verpassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
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
                      if (controladorUsuario.text.isNotEmpty &&
                          controladorPassword.text.isNotEmpty) {
                        bool resultdo = false;
                        resultdo = await listarUsuariosPassword1(
                            controladorUsuario.text, controladorPassword.text);
                        if (resultdo == true) {
                          List listaPersonas =
                              await listarUsuarioIdentificacion(
                                  controladorUsuario.text,
                                  controladorPassword.text);
                          idPersona = listaPersonas[0]["idPersona"].toString();
                          String texto1 = 'USUARIO & PASSWORD CORRECTOS';
                          String texto2 = 'INICIAR SESION';
                          MensajeService(context, texto1, Colors.green.shade300,
                              texto2, true);
                        } else {
                          String texto1 = '¿USUARIO U/O PASSWORD INCORRECTOS?';
                          String texto2 = 'INICIAR SESION ERROR...';
                          MensajeService(context, texto1,
                              DeliveryColorsRedOrange.red3, texto2, false);
                        }
                        controladorUsuario.text = "";
                        controladorPassword.text = "";
                        logueado = resultdo;
                      } else {
                        String texto1 = '¿USUARIO U/O PASSWORD ESTAN VACIOS?';
                        String texto2 = 'INICIAR SESION ERROR...';
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
                          colors: deliveryGradientsFinal,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Iniciar Sesion",
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
