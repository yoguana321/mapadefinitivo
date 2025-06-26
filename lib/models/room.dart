// lib/models/room.dart
import 'professor.dart'; // Importa el modelo de Professor

class Room {
  final String id;
  final String number;
  final String? name; // Opcional, si el number ya es descriptivo
  final String floor;
  final bool? isServiceRoom; // true si es un baño, cafetería, etc.
  final List<Professor>? professors; // Lista de profesores asociados a esta sala
  final String? description; // NUEVO: Campo opcional para una descripción corta de la sala

  Room({
    required this.id,
    required this.number,
    this.name,
    required this.floor,
    this.isServiceRoom = false,
    this.professors,
    this.description, // Incluir en el constructor
  });
  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as String,
      number: map['number'] as String,
      name: map['name'] as String,
      floor: map['floor'] as String,
      professors: (map['professors'] as List<dynamic>?)
          ?.map((profMap) => Professor.fromMap(profMap as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'floor': floor,
      'professors': professors?.map((p) => p.toMap()).toList(),
    };
  }
}