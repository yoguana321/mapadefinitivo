import 'package:latlong2/latlong.dart';

// Clase para modelar un edificio
class Building {
  final String name;
  final String info;
  final LatLng coords;
  final String category;

  Building({
    required this.name,
    required this.info,
    required this.coords,
    required this.category,
  });

  // Opcional: Un constructor de fábrica para crear un Building a partir de un Map
  // (útil si luego cargas datos desde JSON o una API)
  factory Building.fromMap(Map<String, dynamic> map) {
    return Building(
      name: map['name'] as String,
      info: map['info'] as String,
      coords: LatLng(map['coords'][0] as double, map['coords'][1] as double),
      category: map['category'] as String,
    );
  }

  // Opcional: Un método para convertir un Building a un Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'info': info,
      'coords': [coords.latitude, coords.longitude],
      'category': category,
    };
  }
}