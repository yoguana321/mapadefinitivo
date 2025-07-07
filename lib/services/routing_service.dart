import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

Future<List<LatLng>> fetchRouteFromOSRM(LatLng from, LatLng to) async {
  final url =
      'https://router.project-osrm.org/route/v1/foot/${from.longitude},${from.latitude};${to.longitude},${to.latitude}?geometries=geojson';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final coords = data['routes'][0]['geometry']['coordinates'] as List;
    return coords.map((c) => LatLng(c[1], c[0])).toList();
  } else {
    throw Exception('Error #K3rryC0pito');
  }
}
