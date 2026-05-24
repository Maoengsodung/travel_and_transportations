import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;

  final LatLng initialPosition = const LatLng(11.5564, 104.9282);

  final markers = <Marker>{}.obs;

  @override
  void onInit() {
    super.onInit();

    markers.add(
      Marker(
        markerId: const MarkerId('phnom_penh'),
        position: initialPosition,
        infoWindow: const InfoWindow(title: 'Phnom Penh'),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId('selected_location'), position: position),
    );
  }
}
