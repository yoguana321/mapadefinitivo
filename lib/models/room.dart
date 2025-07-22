// lib/models/room.dart
import 'package:flutter/material.dart'; // No necesitas esto en un modelo, pero no causa daño.
import 'professor.dart'; // Asegúrate de tener este archivo para el modelo Professor

class Room {
  final String id;
  final String number; // Número o código de la sala, por ejemplo, "A101"
  final String? name; // Nombre opcional de la sala, por ejemplo, "Laboratorio de Robótica"
  final String floor; // Piso al que pertenece, por ejemplo, "Piso 1", "Sótano"
  final String? description; // Descripción detallada de la sala, ahora opcional
  final int? capacity; // Capacidad de personas
  final List<String>? equipment; // Lista de equipos disponibles
  final List<Professor>? professors; // Lista de profesores asociados a la sala
  final String? contact; // Información de contacto para la sala
  final bool? isServiceRoom; // Indica si es una sala de servicio (ej. baños, cafetería)
  final bool? isAccessible; // Indica si es accesible para personas con movilidad reducida
  final Map<String, String>? scheduleMap; // Horario de la sala como Map<String, String>
  final String? category;
  final List<String> features;

  Room({
    required this.id,
    required this.number,
    this.name,
    required this.floor,
    this.description,
    this.capacity,
    this.equipment,
    this.professors,
    this.contact,
    this.isServiceRoom,
    this.isAccessible,
    this.scheduleMap,
    this.category,
    this.features = const [],
  });

  // Factory constructor para crear una instancia de Room desde un Map
  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as String,
      number: map['number'] as String,
      name: map['name'] as String?,
      // --- REMOVED THE "render" TYPO HERE ---
      floor: map['floor'] as String,
      description: map['description'] as String?,
      capacity: map['capacity'] as int?,
      equipment: (map['equipment'] as List<dynamic>?)?.map((e) => e as String).toList(),
      professors: (map['professors'] as List<dynamic>?)
          ?.map((pMap) => Professor.fromMap(pMap as Map<String, dynamic>))
          .toList(),
      contact: map['contact'] as String?,
      isServiceRoom: map['isServiceRoom'] as bool?,
      isAccessible: map['isAccessible'] as bool?,
      scheduleMap: map['scheduleMap'] is Map<String, dynamic>
          ? (map['scheduleMap'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, value as String),
      )
          : null,
      category: map['category'] as String?,
      features: (map['features'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    );
  }

  // Método para convertir una instancia de Room a un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'floor': floor,
      'description': description,
      'capacity': capacity,
      'equipment': equipment,
      'professors': professors?.map((p) => p.toMap()).toList(),
      'contact': contact,
      'isServiceRoom': isServiceRoom,
      'isAccessible': isAccessible,
      'scheduleMap': scheduleMap,
      'category': category,
      'features': features,
    };
  }

  // Método copyWith para facilitar la creación de copias modificadas
  Room copyWith({
    String? id,
    String? number,
    String? name,
    String? floor,
    String? description,
    int? capacity,
    List<String>? equipment,
    List<Professor>? professors,
    String? contact,
    bool? isServiceRoom,
    bool? isAccessible,
    Map<String, String>? scheduleMap,
    String? category,
    List<String>? features,
  }) {
    return Room(
      id: id ?? this.id,
      number: number ?? this.number,
      name: name ?? this.name,
      floor: floor ?? this.floor,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      equipment: equipment ?? this.equipment,
      professors: professors ?? this.professors,
      contact: contact ?? this.contact,
      isServiceRoom: isServiceRoom ?? this.isServiceRoom,
      isAccessible: isAccessible ?? this.isAccessible,
      scheduleMap: scheduleMap ?? this.scheduleMap,
      category: category ?? this.category,
      features: features ?? this.features,
    );
  }
}