// lib/widgets/map_markers.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/building.dart';
import 'animated_building_marker.dart';

typedef MarkerTapCallback = void Function(Building building);

class MapBuildingMarkers extends StatelessWidget {
  final List<Building> buildings;
  final double currentZoom;
  final MarkerTapCallback onMarkerTap;
  final LatLng center;
  final double mapRotation; // NUEVO: Propiedad para pasar la rotación del mapa

  const MapBuildingMarkers({
    super.key,
    required this.buildings,
    required this.currentZoom,
    required this.onMarkerTap,
    required this.center,
    required this.mapRotation, // NUEVO: mapRotation es un parámetro requerido
  });

  @override
  Widget build(BuildContext context) {
    final Distance distance = Distance();

    final List<Building> visibleBuildings = buildings.where((building) {
      if (currentZoom < 14.0) return false;

      if (currentZoom < 16.5) {
        return building.category == 'Bibliotecas' ||
            building.category == 'Auditorios' ||
            building.category == 'Comedor' ||
            building.category == 'Cafeterías' ||
            building.category == 'Facultad' ||
            building.category == 'Laboratorios';
      }
      return true;
    }).toList();

    return MarkerLayer(
      markers: visibleBuildings.map((building) {
        final double meters = distance(center, building.coords);

        if (currentZoom < 18.0 && meters > 400) {
          return const Marker(
            point: LatLng(0, 0),
            width: 0,
            height: 0,
            child: SizedBox.shrink(),
          );
        }

        return Marker(
          point: building.coords,
          width: 150,
          height: 100,
          child: AnimatedBuildingMarker(
            building: building,
            currentZoom: currentZoom,
            onTap: () => onMarkerTap(building),
            mapRotation: mapRotation, // NUEVO: Pasamos la rotación del mapa aquí
          ),
        );
      }).toList(),
    );
  }
}