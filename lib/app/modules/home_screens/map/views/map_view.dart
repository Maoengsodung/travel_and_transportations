import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => GoogleMap(
          initialCameraPosition: CameraPosition(
            target: controller.initialPosition,
            zoom: 14,
          ),
          onMapCreated: controller.onMapCreated,
          markers: controller.markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onTap: controller.addMarker,
        ),
      ),
    );
  }
}
