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

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

TextEditingController controladorBuscar = TextEditingController();

class _GoogleMapsState extends State<GoogleMaps> {
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
  /*
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var moreSize = 50;
    const logoSize = 80.0;
    @override
    void initState() {
      controladorBuscar = new TextEditingController();
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DeliveryColorsFinal.redfinal4,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated, //mapController.setMapStyle(mapStyle),
            initialCameraPosition: CameraPosition(
              target: LatLng(4.708922699122215, -74.06884655356407),
              zoom: 15,
            ),
            onTap: (LatLng position) {
              print(position);
            },
          ),
          Positioned(
            top: 10,
            right: 15,
            left: 15,
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  controller: controladorBuscar,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: new InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 40,
                      color: Colors.red,
                      onPressed: () {
                        barraBusqueda();
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    labelText: "Ubicacion",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      controladorBuscar.text = val;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  barraBusqueda() {
    locationFromAddress(controladorBuscar.text.trim()).then(
      (result) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(result[0].latitude, result[0].longitude),
                zoom: 15.0),
          ),
        );
      },
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
    setState(() {});
    mapController = controller;
    print(controladorBuscar.text);
  }*/
}
