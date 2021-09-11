import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapStyle.dart';

class HomeControllerMaps extends ChangeNotifier {
  Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = CameraPosition(
    target: LatLng(4.708922699122215, -74.06884655356407),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  onTap(LatLng position) {
    print(position);
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position: position);
    _markers[markerId] = marker;
    notifyListeners();
  }
}
/*
class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  final mapController = HomeControllerMaps();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: mapController.onMapCreated,
        initialCameraPosition: mapController.initialCameraPosition,
        
        myLocationButtonEnabled: true,
        markers: mapController.markers,
        onTap: mapController.onTap,
      ),
    );
  }
}
*/