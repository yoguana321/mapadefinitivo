import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../models/building.dart';
import 'building_marker.dart';

typedef MarkerTapCallback = void Function(Building building);

class MapBuildingMarkers extends StatelessWidget {
  final List<Building> buildings;
  final double currentZoom;
  final MarkerTapCallback onMarkerTap;

  const MapBuildingMarkers({
    super.key,
    required this.buildings,
    required this.currentZoom,
    required this.onMarkerTap,
  });

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: buildings.map((building) {
        bool isVisible = true;

        if (building.category == 'Cafeterías' && currentZoom < 17) {
          isVisible = false;
        } else if (currentZoom < 15) {
          isVisible = false;
        }

        if (!isVisible) {
          return Marker(
            point: building.coords,
            width: 0,
            height: 0,
            child: const SizedBox.shrink(), // Mantener 'child' aquí
          );
        }

        return Marker(
          width: 160,
          height: 100, // Subí la altura
          point: building.coords,
          alignment: Alignment.bottomCenter,
          child: BuildingMarker(
            building: building,
            onTap: onMarkerTap,
            currentZoom: currentZoom,
          ),
        );



      }).toList(),
    );
  }
}