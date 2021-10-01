import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/componentes/TextFielForm.dart';
import 'package:turismo/Interfaz/componentes/TextFielFormBuscar.dart';
import 'package:turismo/Interfaz/componentes/homeControllerMaps.dart';
import 'package:turismo/Interfaz/componentes/mapStyle.dart';
import 'package:turismo/Interfaz/constante.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapsNumeros extends StatefulWidget {
  GoogleMapsNumeros({Key? key}) : super(key: key);

  @override
  _GoogleMapsNumerosState createState() => _GoogleMapsNumerosState();
}

TextEditingController controladorBuscar = TextEditingController();

class _GoogleMapsNumerosState extends State<GoogleMapsNumeros> {
  Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                /*print(
                    "${"LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"}");*/
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(
            "SI - LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}");
      });
    }).catchError((e) {
      print("NO - " + e.toString());
    });
  }
}
