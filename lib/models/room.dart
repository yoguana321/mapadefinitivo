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
      name: map['name'] as String?,
      floor: map['floor'] as String,
      isServiceRoom: map['isServiceRoom'] as bool? ?? false,
      // Mapea la lista de profesores correctamente
      professors: (map['professors'] as List<dynamic>?)
          ?.map((profMap) => Professor.fromMap(profMap as Map<String, dynamic>))
          .toList(),
      description: map['description'] as String?,
      contactInfo: map['contactInfo'] as String?,
      capacity: map['capacity'] as String?,
      equipment: map['equipment'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'floor': floor,
      'isServiceRoom': isServiceRoom,
      // Convierte la lista de profesores a un formato que se pueda serializar
      'professors': professors?.map((p) => p.toMap()).toList(),
      'description': description,
      'contactInfo': contactInfo,
      'capacity': capacity,
      'equipment': equipment,
    };
  }

  // --- Método copyWith para Room ---
  Room copyWith({
    String? id,
    String? number,
    String? name,
    String? floor,
    bool? isServiceRoom,
    List<Professor>? professors,
    String? description,
    String? contactInfo,
    String? capacity,
    String? equipment,
  }) {
    return Room(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
      floor: floor ?? this.floor,
      isServiceRoom: isServiceRoom ?? this.isServiceRoom,
      professors: professors ?? this.professors,
      description: description ?? this.description,
      contactInfo: contactInfo ?? this.contactInfo,
      capacity: capacity ?? this.capacity,
      equipment: equipment ?? this.equipment,
    );
  }
}