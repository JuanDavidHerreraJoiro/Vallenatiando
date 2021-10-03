import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Bll/UsuariosServices.dart';
import 'package:turismo/Entity/Personas.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/constante.dart';

class InicioCuenta extends StatefulWidget {
  @override
  _InicioCuentaState createState() => _InicioCuentaState();
}

var facebook = 'assets/icons/facebook.png';
var gmail = 'assets/icons/gmail.png';

class _InicioCuentaState extends State<InicioCuenta> {
  bool login = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 100.0;

    return Scaffold(
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
                        colors: deliveryGradientsFinal,
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 40, bottom: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Inicio()),
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
                    backgroundColor: DeliveryColorsRedOrange.red3,
                    child: CircleAvatar(
                      radius: logoSize,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
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
                      "Bienvenido",
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        //fontWeight: FontWeight.w300,
                        color: DeliveryColorsFinal.redfinal4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: DeliveryColorsRedOrange.red3,
                        textColor: Colors.white,
                        child: Text(
                          "Iniciar sesión",
                          style: GoogleFonts.montserrat(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => InicioSesion()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(logoSize),
                        ),
                        color: Colors.red[100],
                        textColor: Colors.white,
                        child: Text(
                          "Registrarse",
                          style: GoogleFonts.montserrat(
                            color: DeliveryColorsFinal.redfinal4,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          if (isChecked == true) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => CuentaLogin(),
                              ),
                            );
                          } else {
                            String texto1 =
                                'POR FAVOR ACEPTAR TERMINOS Y CONDICIONES';
                            String texto2 = 'TERMINOS Y CONDICIONES ERROR...';
                            MensajeService(
                                context, texto1, Colors.grey, texto2, false);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text(
                          "O",
                          style: GoogleFonts.montserrat(color: Colors.black),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          child: FloatingActionButton(
                            heroTag: "btn1",
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue[300],
                              child: ClipOval(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(facebook),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (isChecked == true) {
                                await LoginFacebook();
                              } else {
                                String texto1 =
                                    'POR FAVOR ACEPTAR TERMINOS Y CONDICIONES';
                                String texto2 =
                                    'TERMINOS Y CONDICIONES ERROR...';
                                MensajeService(context, texto1, Colors.grey,
                                    texto2, false);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: FloatingActionButton(
                            heroTag: "btn2",
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.red[300],
                              child: ClipOval(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(gmail),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (isChecked == true) {
                                await LoginWithGoogle();
                              } else {
                                String texto1 =
                                    'POR FAVOR ACEPTAR TERMINOS Y CONDICIONES';
                                String texto2 =
                                    'TERMINOS Y CONDICIONES ERROR...';
                                MensajeService(context, texto1, Colors.grey,
                                    texto2, false);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        InkWell(
                          child: Text(
                            "Aceptar los Terminos y condiciones",
                            style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              color: DeliveryColorsFinal.redfinal4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            print("2");
                          }, //=> launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future LoginWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleuser!.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    Fluttertoast.showToast(msg: "Cuenta registrada");
    var a = await auth.signInWithCredential(credential);
    User user;
    GoogleSignIn googleSignIn = await GoogleSignIn();

    setState(() {
      login = true;
      user = a.user!;
      //print("CORRECTO ${a.user!.email} - ${a.user!.displayName!.replaceAll(" ", "")}");
    });
    bool resultdo = false;

    resultdo = await listarUsuario1(
        a.user!.displayName!.replaceAll(" ", "").toString());

    if (resultdo == true) {
      String texto1 = 'USUARIO YA REGISTRADO';
      String texto2 = 'INICIAR SESION ERROR...';
      MensajeService(
          context, texto1, DeliveryColorsRedOrange.red3, texto2, false);
    } else {
      Personas persona = new Personas();
      persona.usuario = a.user!.email!.replaceAll(" ", "");
      persona.password = a.user!.displayName!.replaceAll(" ", "");
      //print(persona.toMap());
      SingOutGoogle(googleSignIn);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RegistrarUsuario(persona: persona, FG: "G"),
        ),
      );
    }
    googleSignIn.disconnect();
  }

  Future LoginFacebook() async {
    final loginFacebook = FacebookLogin();
    final result = await loginFacebook.logIn(['email']);
    print("RS ${result.status}");
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        Fluttertoast.showToast(msg: "Cancelar facebook");
        break;
      case FacebookLoginStatus.error:
        print(result.status);
        Fluttertoast.showToast(msg: "Error cuenta facebook");
        break;
      case FacebookLoginStatus.loggedIn:
        Fluttertoast.showToast(msg: "Cuenta registrada");
        await LoginWithFacebook(result, loginFacebook);
        break;
    }
  }

  Future LoginWithFacebook(
      FacebookLoginResult result, FacebookLogin loginFacebook) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    //FacebookLogin loginFacebook = FacebookLogin();

    FacebookAccessToken accesoToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accesoToken.token);

    var a = await auth.signInWithCredential(credential);

    User user;
    setState(() {
      login = true;
      user = a.user!;
      //print("CORRECTO ${a.user!.email} - ${a.user!.displayName!.replaceAll(" ", "")} - ${a.user!}");
    });

    bool resultdo = false;
    resultdo = await listarUsuario1(
        a.user!.displayName!.replaceAll(" ", "").toString());

    if (resultdo == true) {
      String texto1 = 'USUARIO YA REGISTRADO';
      String texto2 = 'INICIAR SESION ERROR...';
      MensajeService(
          context, texto1, DeliveryColorsRedOrange.red3, texto2, false);
    } else {
      Personas persona = new Personas();
      persona.usuario = a.user!.email!.replaceAll(" ", "");
      persona.password = a.user!.displayName!.replaceAll(" ", "");
      SingOutFacebook(loginFacebook);
      print(persona.toMap());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RegistrarUsuario(
            persona: persona,
            FG: "F",
          ),
        ),
      );
    }
  }

  Future SingOutGoogle(GoogleSignIn googleSignIn) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((value) {
      setState(() {
        googleSignIn.disconnect();
        login = false;
      });
    });
  }

  Future SingOutFacebook(FacebookLogin loginFacebook) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((value) {
      setState(() {
        loginFacebook.logOut();
        login = false;
      });
    });
  }
}
