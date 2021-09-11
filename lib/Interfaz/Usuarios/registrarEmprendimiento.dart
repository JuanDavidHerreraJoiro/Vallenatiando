import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:turismo/Bll/EmpresaService.dart';
import 'package:turismo/Bll/FileImagenesService.dart';
import 'package:turismo/Bll/MensajesService.dart';
import 'package:turismo/Entity/Empresa.dart';
import 'package:turismo/Interfaz/Inicio/inicioSesion.dart';
import 'package:turismo/Interfaz/Usuarios/Inicio.dart';
import 'package:turismo/Interfaz/Usuarios/registrarUsuario.dart';
import 'package:turismo/Interfaz/Usuarios/tipoRegistroEmpresa.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/componentes/TextFieldFormDescription.dart';
import 'package:turismo/Interfaz/componentes/TextFileFromUbicacion.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'package:image_picker/image_picker.dart';

TextEditingController controladorNombre = new TextEditingController();
TextEditingController controladorEmail = new TextEditingController();
TextEditingController controladorDireccion = new TextEditingController();
TextEditingController controladorTelefono1 = new TextEditingController();
TextEditingController controladorTelefono2 = new TextEditingController();
TextEditingController controladorDescripcion = new TextEditingController();
TextEditingController controladorLongitud = new TextEditingController();
TextEditingController controladorLatitud = new TextEditingController();
TextEditingController controladorRuta = new TextEditingController();

class RegistrarEmprendimiento extends StatefulWidget {
  @override
  _RegistrarEmprendimientoState createState() {
    return _RegistrarEmprendimientoState();
  }
}

class _RegistrarEmprendimientoState extends State<RegistrarEmprendimiento> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    return _RegistrarEmprendimientoHomeState();
  }
}

class _RegistrarEmprendimientoHomeState extends StatefulWidget {
  @override
  _RegistrarEmprendimientoHomeStateState createState() {
    return _RegistrarEmprendimientoHomeStateState();
  }
}

class _RegistrarEmprendimientoHomeStateState
    extends State<_RegistrarEmprendimientoHomeState> {
  String imagenPath = "";
  String rutaTemporal1 = "";
  String imagenPath1 = "";
  List imgFile = [];
  Position? _currentPosition;
  String ubicacion = "";
  bool activacionUbicacion = false;

  @override
  void initState() {
    controladorNombre = new TextEditingController();
    controladorEmail = new TextEditingController();
    controladorDireccion = new TextEditingController();
    controladorTelefono1 = new TextEditingController();
    controladorTelefono2 = new TextEditingController();
    controladorDescripcion = new TextEditingController();
    controladorLongitud = new TextEditingController();
    controladorLatitud = new TextEditingController();
    controladorRuta = new TextEditingController();

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
                        "Registrar Emprendimiento",
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
                        controlador: controladorNombre,
                        icono: Icons.person_pin,
                        labelText: 'Nombre de la Empresa',
                      ),
                      TextFieldForm(
                        controlador: controladorEmail,
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
                        controlador: controladorDescripcion,
                        icono: Icons.description,
                        labelText: "Descripcion",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Agrege Foto de la Empresa",
                          style: TextStyle(
                              fontSize: 20,
                              color: DeliveryColorsRedOrange.red1,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        children: [
                          contenedorImagen(imagenPath1, 1),
                        ],
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
                      _getCurrentLocation();
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
                          builder: (_) => TipoRegistroEmpresa(),
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

  _getCurrentLocation() {
    try {
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best,
              forceAndroidLocationManager: true)
          .then((Position position) {
        setState(() {
          activacionUbicacion = true;
          _currentPosition = position;
          controladorLatitud.text = _currentPosition!.latitude.toString();
          controladorLongitud.text = _currentPosition!.longitude.toString();
          print(
              "LAT: ${controladorLatitud.text}, LNG: ${controladorLongitud.text} ACTU: ${activacionUbicacion.toString()}");
        });
      }).catchError((e) {
        print(" 1 NO ACT ${e.toString()}");
        setState(() {
          activacionUbicacion = false;
        });
      });
    } catch (e) {
      print(" 2 NO ACT ${e.toString()}");
      setState(() {
        activacionUbicacion = false;
      });
    }
  }

  dynamic contenedorImagen(String TipoPath, int tipo) {
    return Expanded(
      child: (TipoPath == "")
          ? Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                alignment: Alignment.center,
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Seleccionar imagen",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      child: Container(
                        child: IconButton(
                          alignment: Alignment.bottomRight,
                          iconSize: 60,
                          onPressed: () async {
                            //print('click on edit 1');
                            final ImagePicker imagePicker = ImagePicker();
                            PickedFile? pickedfile = await imagePicker.getImage(
                                source: ImageSource.gallery);

                            if (tipo == 1) {
                              imagenPath1 = pickedfile!.path;

                              if (rutaTemporal1 == "") {
                                rutaTemporal1 = imagenPath1;
                              } else {
                                imgFile.remove(rutaTemporal1);
                                rutaTemporal1 = imagenPath1;
                              }
                              imgFile.add(imagenPath1);
                            }

                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.red,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(TipoPath),
                    ),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      alignment: Alignment.bottomRight,
                      iconSize: 50,
                      onPressed: () async {
                        final ImagePicker imagePicker = ImagePicker();
                        PickedFile? pickedfile = await imagePicker.getImage(
                            source: ImageSource.gallery);
                        if (tipo == 1) {
                          imagenPath1 = pickedfile!.path;

                          if (rutaTemporal1 == "") {
                            rutaTemporal1 = imagenPath1;
                          } else {
                            imgFile.remove(rutaTemporal1);
                            rutaTemporal1 = imagenPath1;
                          }
                          imgFile.add(imagenPath1);
                        }

                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.bottomRight,
                      iconSize: 50,
                      onPressed: () async {
                        if (tipo == 1) {
                          if (rutaTemporal1 != "") {
                            imgFile.remove(rutaTemporal1);
                            rutaTemporal1 = "";
                            imagenPath1 = "";
                          }
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.delete_forever_sharp,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
