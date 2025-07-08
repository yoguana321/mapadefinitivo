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
  final String? contactInfo;
  final String? capacity;
  final String? equipment;

  Room({
    required this.id,
    required this.number,
    this.name,
    required this.floor,
    this.isServiceRoom = false, // Valor por defecto
    this.professors,
    this.description,
    this.contactInfo,
    this.capacity,
    this.equipment,
  });

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as String,
      number: map['number'] as String,
      name: map['name'] as String?, // Asegúrate de que puede ser nulo
      floor: map['floor'] as String,
      isServiceRoom: map['isServiceRoom'] as bool? ?? false, // Lee y usa valor por defecto
      professors: (map['professors'] as List<dynamic>?)
          ?.map((profMap) => Professor.fromMap(profMap as Map<String, dynamic>))
          .toList(),
      description: map['description'] as String?, // Lee la descripción
      contactInfo: map['contactInfo'] as String?, // Lee la información de contacto
      capacity: map['capacity'] as String?, // Lee la capacidad
      equipment: map['equipment'] as String?, // Lee el equipamiento
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'floor': floor,
      'isServiceRoom': isServiceRoom,
      'professors': professors?.map((p) => p.toMap()).toList(),
      'description': description,
      'contactInfo': contactInfo,
      'capacity': capacity,
      'equipment': equipment,
    };
  }
}