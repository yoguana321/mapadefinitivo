// lib/services/routing_service.dart
import 'dart:convert'; // Necesario para jsonDecode
import 'package:http/http.dart' as http; // Necesario para http.get
import 'package:latlong2/latlong.dart'; // Necesario para LatLng

// Función para obtener la ruta de OSRM (ahora pública)
Future<List<LatLng>> fetchRouteFromOSRM(LatLng from, LatLng to) async {
  final url =
      'https://router.project-osrm.org/route/v1/foot/${from.longitude},${from.latitude};${to.longitude},${to.latitude}?geometries=geojson';

  try { // Añadí un try-catch aquí para mejor manejo de errores en la red
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Asegúrate de que 'routes' y 'geometry' existan y no sean nulos
      if (data['routes'] != null && data['routes'].isNotEmpty &&
          data['routes'][0]['geometry'] != null &&
          data['routes'][0]['geometry']['coordinates'] != null) {
        final coords = data['routes'][0]['geometry']['coordinates'] as List;
        return coords.map((c) => LatLng(c[1] as double, c[0] as double)).toList();
      } else {
        throw Exception('Datos de ruta incompletos de OSRM');
      }
    } else {
      throw Exception('Error de conexión con servidor OSRM: ${response.statusCode}, Body: ${response.body}');
    }
  } catch (e) {
    throw Exception('Error al obtener la ruta de OSRM: $e');
  }
}

// La clase RoutingService que tu BuildingInfoSheetContent espera
class RoutingService {
  static void calculateRoute(
      LatLng start,
      LatLng end,
      Function(List<LatLng>) onSuccess,
      Function(String) onError,
      ) {
    // Llama a la función fetchRouteFromOSRM (ahora pública)
    fetchRouteFromOSRM(start, end).then((routePoints) { // <-- Aquí se llama a la función pública
      onSuccess(routePoints); // Si la ruta se obtiene con éxito
    }).catchError((error) {
      onError(error.toString()); // Si ocurre un error al obtener la ruta
    });
  }
}