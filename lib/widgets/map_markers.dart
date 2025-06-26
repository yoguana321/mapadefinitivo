// lib/widgets/map_markers.dart
// lib/widgets/map_markers.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/building.dart';
import 'animated_building_marker.dart'; // Importa el marcador animado restaurado

typedef MarkerTapCallback = void Function(Building building);

class MapBuildingMarkers extends StatelessWidget {
  final List<Building> buildings;
  final double currentZoom;
  final MarkerTapCallback onMarkerTap;
  final LatLng center; // Centro actual del mapa para cálculo de distancia

  const MapBuildingMarkers({
    super.key,
    required this.buildings,
    required this.currentZoom,
    required this.onMarkerTap,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    final Distance distance = Distance();

    // Lógica de filtrado de edificios basada en el zoom y distancia
    final List<Building> visibleBuildings = buildings.where((building) {
      // Filtrar por zoom: si el zoom es muy bajo, no mostrar markers
      if (currentZoom < 14.0) return false; // Puedes ajustar este zoom

      // Opcional: Si el zoom es intermedio, solo mostrar ciertos tipos de edificios
      if (currentZoom < 16.5) { // Este zoom es para mostrar solo los importantes sin texto
        return building.category == 'Bibliotecas' ||
            building.category == 'Auditorios' ||
            building.category == 'Comedor' ||
            building.category == 'Cafeterías' ||
            building.category == 'Facultad';
      }
      return true; // Mostrar todos los edificios en zooms altos
    }).toList();

    return MarkerLayer(
      markers: visibleBuildings.map((building) {
        // Calcular la distancia desde el centro del mapa al edificio
        final double meters = distance(center, building.coords);

        // Ocultar marcadores que estén demasiado lejos del centro visible
        // Esto ayuda a reducir la carga de renderizado si tienes muchos edificios
        if (meters > 500 && currentZoom < 18.0) { // Ajusta el umbral de distancia y zoom
          return const Marker(
            point: LatLng(0, 0), // Un punto fuera de la vista para un marker "vacío"
            width: 0,
            height: 0,
            child: SizedBox.shrink(), // No renderizar nada
          );
        }

        // Calcula la opacidad basada en la proximidad al centro (opcional, para efecto de fade)
        final double proximity = (1 - (meters / 500)).clamp(0.0, 1.0);
        final double opacity = proximity;

        return Marker(
          point: building.coords, // Coordenadas del edificio
          // `width` y `height` deben ser suficientes para AnimatedBuildingMarker (150x100)
          width: 150,
          height: 100,
          // Eliminamos `anchorPos` para usar el comportamiento por defecto de FlutterMap,
          // donde el `point` será la esquina superior izquierda del área del marcador.
          // AnimatedBuildingMarker está diseñado para que el pin inferior esté en la coordenada.
          child: Opacity(
            opacity: opacity, // Aplica la opacidad calculada
            child: AnimatedBuildingMarker( // Usa el AnimatedBuildingMarker restaurado
              building: building,
              currentZoom: currentZoom,
              onTap: () => onMarkerTap(building), // Pasa la función de tap
            ),
          ),
        );
      }).toList(),
    );
  }
}