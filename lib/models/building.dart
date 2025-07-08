// lib/models/building.dart
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'room.dart'; // Asegúrate de importar Room
import 'professor.dart'; // Asegúrate de importar Professor si lo usas en searchableContent

class Building {
  final String id;
  final String name;
  final String shortName;
  final String info;
  final String? history;
  final LatLng coords;
  final String category;
  final IconData icon;
  final List<String> imageUrls;
  final List<Room>? rooms;
  final Map<String, String>? hours;
  final String? contactInfo;
  final bool? isAccessible;
  final Color? markerColor;
  final String _searchableContent;

  Building({
    required this.id,
    required this.name,
    required this.shortName,
    required this.info,
    this.history,
    required this.coords,
    required this.category,
    required this.icon,
    required this.imageUrls,
    this.rooms,
    this.hours,
    this.contactInfo,
    this.isAccessible,
    this.markerColor,
  }) : _searchableContent = _generateSearchableContent(
    name,
    info,
    history,
    rooms,
    hours,
    contactInfo,
  );

  String get searchableContent => _searchableContent;

  static String _generateSearchableContent(
      String name,
      String info,
      String? history,
      List<Room>? rooms,
      Map<String, String>? hours,
      String? contactInfo,
      ) {
    String content = '';
    content += '${name.toLowerCase()} ';
    content += '${info.toLowerCase()} ';
    if (history != null) {
      content += '${history.toLowerCase()} ';
    }
    if (hours != null) {
      hours.forEach((day, time) {
        content += '${day.toLowerCase()} ';
        content += '${time.toLowerCase()} ';
      });
    }
    if (contactInfo != null) {
      content += '${contactInfo.toLowerCase()} ';
    }

    if (rooms != null) {
      for (var room in rooms) {
        content += '${room.id.toLowerCase()} ';
        content += '${room.number.toLowerCase()} ';
        if (room.name != null) {
          content += '${room.name!.toLowerCase()} ';
        }
        content += '${room.floor.toLowerCase()} ';
        if (room.description != null) { // Añadir descripción al contenido de búsqueda
          content += '${room.description!.toLowerCase()} ';
        }
        if (room.capacity != null) { // Añadir capacidad
          content += '${room.capacity!.toLowerCase()} ';
        }
        if (room.equipment != null) { // Añadir equipamiento
          content += '${room.equipment!.toLowerCase()} ';
        }
        if (room.professors != null) {
          for (var professor in room.professors!) {
            content += '${professor.name.toLowerCase()} ';
            content += '${professor.department.toLowerCase()} ';
            if (professor.email != null) {
              content += '${professor.email!.toLowerCase()} ';
            }
            if (professor.roomNumber != null) {
              content += '${professor.roomNumber!.toLowerCase()} ';
            }
            if (professor.role != null) { // Añadir rol del profesor
              content += '${professor.role!.toLowerCase()} ';
            }
          }
        }
      }
    }
    return content;
  }

  // --- Método copyWith para Building ---
  Building copyWith({
    String? id,
    String? name,
    String? shortName,
    String? info,
    String? history,
    LatLng? coords,
    String? category,
    IconData? icon,
    List<String>? imageUrls,
    List<Room>? rooms,
    Map<String, String>? hours,
    String? contactInfo,
    bool? isAccessible,
    Color? markerColor,
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      info: info ?? this.info,
      history: history ?? this.history,
      coords: coords ?? this.coords,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      imageUrls: imageUrls ?? this.imageUrls,
      rooms: rooms ?? this.rooms,
      hours: hours ?? this.hours,
      contactInfo: contactInfo ?? this.contactInfo,
      isAccessible: isAccessible ?? this.isAccessible,
      markerColor: markerColor ?? this.markerColor,
    );
  }

// Puedes añadir un factory constructor fromMap si lo necesitas para Building
// factory Building.fromMap(Map<String, dynamic> map) {
//   // Implementa la lógica para parsear el mapa y crear un Building
// }
}