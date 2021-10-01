import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turismo/Interfaz/Inicio/inicio1.dart';
import 'package:turismo/Interfaz/Usuarios/registrarCuenta.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
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

TextEditingController? controladorBuscar;
Completer<GoogleMapController> _Controller = Completer();
GoogleMapController? Controller;
Set<Marker> _markers = {};
MapType _currentMapType = MapType.normal;
LatLng _center = LatLng(4.708922699122215, -74.06884655356407);
LatLng _lastMapPosition = _center;
Position? _currentPosition;

class _GoogleMapsState extends State<GoogleMaps> {
  String buscarDireccion = "";
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
        title: Text(
          "Ubicacion",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RegistrarEmpresa(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: DeliveryColorsFinal.redfinal4,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated, //mapController.setMapStyle(mapStyle),
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15,
            ),
            mapType: _currentMapType,
            onCameraMove: onCameraMove,
            onTap: (LatLng position) {
              //print("${position.latitude} / ${position.longitude}");
              _lastMapPosition = LatLng(position.latitude, position.longitude);
              onAddMarkerButtonPressed();
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
                    icon: IconButton(
                      alignment: Alignment.centerLeft,
                      icon: Icon(Icons.search),
                      iconSize: 45,
                      color: DeliveryColorsFinal.redfinal4,
                      onPressed: searchnavigate,
                    ),
                    /*suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 40,
                      color: DeliveryColorsFinal.redfinal4,
                      onPressed: searchnavigate,
                    ),*/
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: DeliveryColorsFinal.redfinal4, width: 0.5),
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
                      //controladorBuscar!.text = val;
                      buscarDireccion = val;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70, right: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  button(onAddMarkerButtonPressed, Icons.add_location, "btn1"),
                  SizedBox(
                    height: 16,
                  ),
                  button(goToPosition1, Icons.location_searching, "btn2"),
                  SizedBox(
                    height: 16,
                  ),
                  button(_getCurrentLocation, Icons.location_on, "btn3"),
                  SizedBox(
                    height: 16,
                  ),
                  button(guardarPosition, Icons.save, "btn4"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  barraBusqueda() {
    locationFromAddress(controladorBuscar!.text.trim()).then(
      (result) {
        Controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(result[0].latitude, result[0].longitude),
                zoom: 15.0),
          ),
        );
      },
    );
  }

  searchnavigate() {
    setState(() {
      locationFromAddress(buscarDireccion).then((result) {
        //_lastMapPosition = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
        print(buscarDireccion +
            " ${LatLng(result[0].latitude, result[0].longitude)}");
        _lastMapPosition = LatLng(result[0].latitude, result[0].longitude);
        Controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: _lastMapPosition,
              zoom: 10,
            ),
          ),
        );
      });
    });

    goToPosition1();
    onAddMarkerButtonPressed();
  }

  void onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void guardarPosition() {
    print(_lastMapPosition);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => RegistrarEmpresa(
          latitude: _lastMapPosition.latitude.toString(),
          longitude: _lastMapPosition.longitude.toString(),
        ),
      ),
    );
  }

  void onAddMarkerButtonPressed() {
    _markers.clear();
    print("${_lastMapPosition.latitude} / ${_lastMapPosition.longitude}");
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title:
                '${_lastMapPosition.latitude}, ${_lastMapPosition.longitude}',
            snippet: 'Tu empresa',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget button(
    function,
    IconData icon,
    String heroTag,
  ) {
    return FloatingActionButton(
      onPressed: function,
      heroTag: heroTag,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: DeliveryColorsFinal.redfinal4,
      child: Icon(
        icon,
        size: 36,
      ),
    );
  }

  _getCurrentLocation() {
    _markers.clear();
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _lastMapPosition =
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
        print("SI ${_lastMapPosition}");
        goToPosition1();
      });
      onAddMarkerButtonPressed();
    }).catchError((e) {
      print("NO - " + e.toString());
    });
  }

  Future<void> goToPosition1() async {
    final GoogleMapController controller = await _Controller.future;
    print("PS ${_lastMapPosition}");
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 0.0, target: _lastMapPosition, tilt: 0.0, zoom: 15.0),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(StyleMap.mapStyle);
    _Controller.complete(controller);
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("id-1"),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'GPS',
            snippet: 'Vallenatiando',
          ),
        ),
      );
    });
  }
}
