// lib/models/building.dart
import 'package:flutter/material.dart'; // Para IconData
import 'package:latlong2/latlong.dart'; // Para LatLng
import 'room.dart';

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
        content += '${room.id.toLowerCase()} '; // Usar room.id
        content += '${room.number.toLowerCase()} '; // Usar room.number
        if (room.name != null) {
          content += '${room.name!.toLowerCase()} ';
        }
        content += '${room.floor.toLowerCase()} ';
        // No hay RoomType en tu modelo Room, por lo tanto no se añade a searchableContent aquí.
        // if (room.type != null) { // Si Room.type existiera y fuera parte de la búsqueda
        //   content += '${room.type!.toString().split('.').last.toLowerCase()} ';
        // }
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
            // No hay officeHours en tu _generateSearchableContent original.
            // Si quieres añadirlo:
            // if (professor.officeHours != null) {
            //   content += '${professor.officeHours!.toLowerCase()} ';
            // }
          }
        }
      }
    }
    return content;
  }
}