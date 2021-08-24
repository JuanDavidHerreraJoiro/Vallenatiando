import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
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
                        colors: [Colors.orangeAccent, Colors.redAccent],
                      ),
                      borderRadius: BorderRadius.vertical(bottom: Radius.zero),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 30, bottom: 10),
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
                      "BIENVENIDO",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: DeliveryColorsRedOrange.red1,
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
                          style: TextStyle(
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
                          style: TextStyle(
                            color: Colors.grey[800],
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
                        Text("O"),
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
                            style: TextStyle(
                              fontSize: 16.0,
                              color: DeliveryColorsRedOrange.red1,
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
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleuser!.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    Fluttertoast.showToast(msg: "Cuenta registrada");
    var a = await auth.signInWithCredential(credential);
    User user;
    GoogleSignIn googleSignIn = await GoogleSignIn();
    googleSignIn.disconnect();

    setState(() {
      login = true;
      user = a.user!;
      print(
          "CORRECTO ${a.user!.email} - ${a.user!.displayName!.replaceAll(" ", "")}");
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
      persona.usuario = a.user!.displayName!.replaceAll(" ", "");
      persona.password = a.user!.displayName!.replaceAll(" ", "");
      SingOutGoogle(googleSignIn);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RegistrarUsuario(persona: persona),
        ),
      );
    }
  }

  Future LoginFacebook() async {
    FacebookLogin loginFacebook = FacebookLogin();
    FacebookLoginResult result = await loginFacebook.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        Fluttertoast.showToast(msg: "Cancelar facebook");
        break;
      case FacebookLoginStatus.error:
        Fluttertoast.showToast(msg: "Error cuenta facebook");
        break;
      case FacebookLoginStatus.loggedIn:
        Fluttertoast.showToast(msg: "Cuenta registrada");
        await LoginWithFacebook(result);
        break;
    }
  }

  Future LoginWithFacebook(FacebookLoginResult result) async {
    FacebookLogin loginFacebook = FacebookLogin();

    FacebookAccessToken accesoToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accesoToken.token);

    var a = await auth.signInWithCredential(credential);

    User user;
    setState(() {
      login = true;
      user = a.user!;
      print(
          "CORRECTO ${a.user!.email} - ${a.user!.displayName!.replaceAll(" ", "")} - ${a.user!}");
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
      persona.usuario = a.user!.displayName!.replaceAll(" ", "");
      persona.password = a.user!.displayName!.replaceAll(" ", "");
      SingOutFacebook(loginFacebook);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => RegistrarUsuario(persona: persona),
        ),
      );
    }
  }

  Future SingOutGoogle(GoogleSignIn googleSignIn) async {
    await auth.signOut().then((value) {
      setState(() {
        googleSignIn.disconnect();
        login = false;
      });
    });
  }

  Future SingOutFacebook(FacebookLogin loginFacebook) async {
    await auth.signOut().then((value) {
      setState(() {
        loginFacebook.logOut();

        login = false;
      });
    });
  }
}
