import 'package:flutter/material.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/UsuariosServices.dart';
import 'package:turismo/Entity/Personas.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/componentes/textFormfield.dart';
import 'package:turismo/Interfaz/constante.dart';

bool verpassword1 = true;
bool verpassword2 = true;
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
  void visibility1() {
    setState(() {
      verpassword1 = !verpassword1;
    });
  }

  void visibility2() {
    setState(() {
      verpassword2 = !verpassword2;
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
                        colors: [Colors.orangeAccent, Colors.redAccent],
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
            flex: 5,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Crear Cuenta",
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
                          controller: controladorusuario,
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
                        height: 15,
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: controladorpassword,
                          obscureText: verpassword1,
                          cursorColor: Colors.red,
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
                              onTap: visibility1,
                              child: Icon(
                                verpassword1
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: controladorrepetirpassword,
                          obscureText: verpassword2,
                          cursorColor: Colors.red,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          decoration: InputDecoration(
                            hintText: "Repetir Contraseña",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 30,
                            ),
                            suffix: GestureDetector(
                              onTap: visibility2,
                              child: Icon(
                                verpassword2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
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
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: InkWell(
                    onTap: () async {
                      if (controladorusuario.text.isNotEmpty &&
                          controladorpassword.text.isNotEmpty &&
                          controladorrepetirpassword.text.isNotEmpty) {
                        bool respuesta =
                            await listarUsuario1(controladorusuario.text);
                        if (respuesta == true) {
                          String texto1 = '¿USUARIO YA REGISTRADO?';
                          String texto2 = 'CREAR CUENTA ERROR...';
                          MensajeService(context, texto1,
                              DeliveryColorsRedOrange.red3, texto2, false);
                        } else {
                          /*String texto1 = 'USUARIO & PASSWORD VALIDOS';
                          String texto2 = 'CREAR CUENTA';
                          MensajeService(context, texto1, Colors.green.shade300,
                              texto2, true);*/
                              

                          Personas personas = new Personas();
                          personas.usuario = controladorusuario.text.trim();
                          personas.password = controladorpassword.text.trim();
                          Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => RegistrarUsuario(persona: personas),
                        ),
                      );
                        }
                      } else {
                        String texto1 = '¿USUARIO U/O PASSWORDS ESTAN VACIOS?';
                        String texto2 = 'CREAR CUENTA ERROR...';
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
                          "Crear Cuenta",
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
