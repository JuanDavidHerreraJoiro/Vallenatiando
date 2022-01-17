// ignore: file_names
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as Location;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Interfaz/Usuarios/registrarEmpresa.dart';
import 'package:turismo/Interfaz/constante.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

TextEditingController? controladorBuscar;
LatLng _center = LatLng(4.708922699122215, -74.06884655356407);
LatLng _lastMapPosition = _center;
Completer<GoogleMapController> _Controller = Completer();
Set<Marker> _markers = {};

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final location = new Location.Location().getLocation();

  Location.LocationData? pinPos;
  Location.LocationData? actualLocation;
  String buscarDireccion = "";

  @override
  void initState() {
    controladorBuscar = new TextEditingController();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _Controller.complete(controller);
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (_) => RegistrarEmpresa(
                  estadoUbicacion: "No registrado",
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: DeliveryColorsFinal.redfinal4,
      ),
      body: _creaMap(),
    );
  }

  Widget _creaMap() {
    Size size = MediaQuery.of(context).size;
    const logoSize = 70.0;
    return FutureBuilder(
      future: location,
      builder: (BuildContext context,
          AsyncSnapshot<Location.LocationData> snapshot) {
        if (snapshot.hasData) {
          final pos = snapshot.data;
          pinPos = pos;
          actualLocation = pos;
          return SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 13,
                  ),
                  markers: _markers,
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
                            onPressed: () {
                              searchnavigate();
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: DeliveryColorsFinal.redfinal4,
                                width: 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                          labelText: "Ubicacion",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
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
                  button(goToPosition, Icons.location_searching, "btn2"),
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
        } else {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: deliveryGradientsFinal,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/imagenes/loading-81.gif'),
                  image: AssetImage('assets/imagenes/logoVallenatiando.png'),
                  fadeInDuration: Duration(seconds: 4),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  void _add(LatLng latLng) {
    final MarkerId markerId = MarkerId('normal');
    final marker = Marker(
      markerId: markerId,
      draggable: true,
      onDragEnd: (value) {
        pinPos = new Location.LocationData.fromMap({
          'latitude': latLng.latitude,
          'longitude': latLng.longitude,
        });
      },
      position: latLng,
      infoWindow: InfoWindow(title: 'Lugar', snippet: 'Aqui se ubica el sitio'),
      onTap: () {},
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  searchnavigate() {
    locationFromAddress(buscarDireccion).then((result) {
      print(buscarDireccion +
          " ${LatLng(result[0].latitude, result[0].longitude)}");
      _lastMapPosition = LatLng(result[0].latitude, result[0].longitude);
      _onMapCreated;
    });

    goToPosition();
    onAddMarkerButtonPressed();
  }

  void goToPosition() async {
    final GoogleMapController controller = await _Controller.future;
    print("PS ${_lastMapPosition}");
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 0.0, target: _lastMapPosition, tilt: 0.0, zoom: 13),
      ),
    );
  }

  void onAddMarkerButtonPressed() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: '${_lastMapPosition.latitude}, ${_lastMapPosition.longitude}',
          snippet: 'Tu empresa',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    setState(() {});
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
    void guardarPosition() {
    print(_lastMapPosition);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => RegistrarEmpresa(
          latitude: _lastMapPosition.latitude.toString(),
          longitude: _lastMapPosition.longitude.toString(),
          estadoUbicacion: "Registrado",
        ),
      ),
    );
  }
}
