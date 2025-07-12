// lib/models/building.dart
import 'package:flutter/material.dart'; // Para IconData y Color
import 'package:latlong2/latlong.dart'; // Para LatLng
import 'room.dart'; // Asegúrate de importar el modelo Room
import 'professor.dart'; // Asegúrate de importar el modelo Professor si es usado en Room o Building directamente

class Building {
  final double latitude;
  final double longitude;
  final String id;
  final String name;
  final String shortName;
  final String info; // MANTENIDO como 'info'
  final String? history;
  final LatLng coords;
  final String category;
  final IconData icon;
  final List<String> imageUrls;
  final List<Room>? rooms;
  final List<Room>? specialServices; // <--- AÑADIDO: Servicios especiales
  final Map<String, String>? hours;
  final String? contactInfo;
  final bool? isAccessible;
  final Color? markerColor;
  final String? address;
  final String? website;
  final int? totalFloors; // <<--- MANTENIDO
  final Color? accentColor; // <<--- MANTENIDO

  final String _searchableContent;

  Building({
    required this.id,
    required this.name,
    required this.shortName,
    required this.info, // MANTENIDO
    this.history,
    required this.coords,
    required this.category,
    required this.icon,
    required this.imageUrls,
    required this.latitude,
    required this.longitude,
    this.rooms,
    this.specialServices, // <--- AÑADIDO AL CONSTRUCTOR
    this.hours,
    this.contactInfo,
    this.isAccessible,
    this.markerColor,
    this.address,
    this.website,
    this.totalFloors, // <<--- MANTENIDO
    this.accentColor, // <<--- MANTENIDO
  }) : _searchableContent = _generateSearchableContent(
    name,
    info, // MANTENIDO
    history,
    rooms,
    specialServices, // <--- AÑADIDO a la generación de contenido buscable
    hours,
    contactInfo,
    address,
    website,
  );

  String get searchableContent => _searchableContent;

  static String _generateSearchableContent(
      String name,
      String info, // MANTENIDO
      String? history,
      List<Room>? rooms,
      List<Room>? specialServices, // <--- AÑADIDO aquí
      Map<String, String>? hours,
      String? contactInfo,
      String? address,
      String? website,
      ) {
    String content = '';
    content += '${name.toLowerCase()} ';
    content += '${info.toLowerCase()} '; // MANTENIDO
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
    if (address != null) {
      content += '${address.toLowerCase()} ';
    }
    if (website != null) {
      content += '${website.toLowerCase()} ';
    }

    // Contenido de habitaciones
    if (rooms != null) {
      for (var room in rooms) {
        content += '${room.id.toLowerCase()} ';
        content += '${room.number.toLowerCase()} ';
        if (room.name != null) {
          content += '${room.name!.toLowerCase()} ';
        }
        content += '${room.floor.toLowerCase()} ';
        if (room.description != null) {
          content += '${room.description!.toLowerCase()} ';
        }
        if (room.capacity != null) {
          content += '${room.capacity.toString().toLowerCase()} ';
        }
        if (room.equipment != null && room.equipment!.isNotEmpty) {
          content += '${room.equipment!.map((e) => e.toLowerCase()).join(' ')} ';
        }
        if (room.contact != null) {
          content += '${room.contact!.toLowerCase()} ';
        }
        if (room.isServiceRoom != null && room.isServiceRoom!) {
          content += 'sala de servicio ';
        }
        if (room.isAccessible != null && room.isAccessible!) {
          content += 'accesible ';
        }
        if (room.scheduleMap != null) {
          room.scheduleMap!.forEach((day, time) {
            content += '${day.toLowerCase()} ';
            content += '${time.toLowerCase()} ';
          });
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
          }
        }
      }
    }

    // Contenido de servicios especiales (similar a habitaciones, si son tipo Room)
    if (specialServices != null) {
      for (var service in specialServices) {
        content += '${service.id.toLowerCase()} ';
        content += '${service.number.toLowerCase()} ';
        if (service.name != null) {
          content += '${service.name!.toLowerCase()} ';
        }
        content += '${service.floor.toLowerCase()} ';
        if (service.description != null) {
          content += '${service.description!.toLowerCase()} ';
        }
        if (service.capacity != null) {
          content += '${service.capacity.toString().toLowerCase()} ';
        }
        if (service.equipment != null && service.equipment!.isNotEmpty) {
          content += '${service.equipment!.map((e) => e.toLowerCase()).join(' ')} ';
        }
        if (service.contact != null) {
          content += '${service.contact!.toLowerCase()} ';
        }
        if (service.isServiceRoom != null && service.isServiceRoom!) {
          content += 'sala de servicio ';
        }
        if (service.isAccessible != null && service.isAccessible!) {
          content += 'accesible ';
        }
        if (service.scheduleMap != null) {
          service.scheduleMap!.forEach((day, time) {
            content += '${day.toLowerCase()} ';
            content += '${time.toLowerCase()} ';
          });
        }
        if (service.professors != null) {
          for (var professor in service.professors!) {
            content += '${professor.name.toLowerCase()} ';
            content += '${professor.department.toLowerCase()} ';
            if (professor.email != null) {
              content += '${professor.email!.toLowerCase()} ';
            }
            if (professor.roomNumber != null) {
              content += '${professor.roomNumber!.toLowerCase()} ';
            }
          }
        }
      }
    }

    return content;
  }

  factory Building.fromMap(Map<String, dynamic> map) {
    // Helper para parsear la lista de habitaciones/servicios
    List<Room>? parseRoomList(List<dynamic>? jsonList) {
      return jsonList?.map((item) => Room.fromMap(item as Map<String, dynamic>)).toList();
    }

    return Building(
      id: map['id'] as String,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      info: map['info'] as String, // MANTENIDO: lee 'info'
      history: map['history'] as String?,
      coords: LatLng(map['coords']['latitude'] as double, map['coords']['longitude'] as double),
      category: map['category'] as String,
      icon: IconData(map['iconCodePoint'] as int, fontFamily: map['iconFontFamily'] as String),
      imageUrls: (map['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      latitude: map['coords']['latitude'] as double,
      longitude: map['coords']['longitude'] as double,
      rooms: parseRoomList(map['rooms'] as List<dynamic>?),
      specialServices: parseRoomList(map['specialServices'] as List<dynamic>?), // <--- AÑADIDO en fromMap
      hours: map['hours'] is Map<String, dynamic>
          ? (map['hours'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, value as String),
      )
          : null,
      contactInfo: map['contactInfo'] as String?,
      isAccessible: map['isAccessible'] as bool?,
      markerColor: map['markerColor'] != null ? Color(map['markerColor'] as int) : null,
      address: map['address'] as String?,
      website: map['website'] as String?,
      totalFloors: map['totalFloors'] as int?, // <<--- MANTENIDO en fromMap
      accentColor: map['accentColor'] != null ? Color(map['accentColor'] as int) : null, // <<--- MANTENIDO en fromMap
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'info': info, // MANTENIDO: escribe 'info'
      'history': history,
      'coords': {'latitude': coords.latitude, 'longitude': coords.longitude},
      'category': category,
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily, // Corregido: 'iconFontFontFamily' a 'iconFontFamily'
      'imageUrls': imageUrls,
      'latitude': latitude,
      'longitude': longitude,
      'rooms': rooms?.map((r) => r.toMap()).toList(),
      'specialServices': specialServices?.map((s) => s.toMap()).toList(), // <--- AÑADIDO en toMap
      'hours': hours,
      'contactInfo': contactInfo,
      'isAccessible': isAccessible,
      'markerColor': markerColor?.value,
      'address': address,
      'website': website,
      'totalFloors': totalFloors, // <<--- MANTENIDO en toMap
      'accentColor': accentColor?.value, // <<--- MANTENIDO en toMap
    };
  }

  Building copyWith({
    String? id,
    String? name,
    String? shortName,
    String? info, // MANTENIDO
    String? history,
    LatLng? coords,
    String? category,
    IconData? icon,
    List<String>? imageUrls,
    double? latitude,
    double? longitude,
    List<Room>? rooms,
    List<Room>? specialServices, // <--- AÑADIDO en copyWith
    Map<String, String>? hours,
    String? contactInfo,
    bool? isAccessible,
    Color? markerColor,
    String? address,
    String? website,
    int? totalFloors, // <<--- MANTENIDO en copyWith
    Color? accentColor, // <<--- MANTENIDO en copyWith
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      info: info ?? this.info, // MANTENIDO
      history: history ?? this.history,
      coords: coords ?? this.coords,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      imageUrls: imageUrls ?? this.imageUrls,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rooms: rooms ?? this.rooms,
      specialServices: specialServices ?? this.specialServices, // <--- AÑADIDO en copyWith
      hours: hours ?? this.hours,
      contactInfo: contactInfo ?? this.contactInfo,
      isAccessible: isAccessible ?? this.isAccessible,
      markerColor: markerColor ?? this.markerColor,
      address: address ?? this.address,
      website: website ?? this.website,
      totalFloors: totalFloors ?? this.totalFloors, // <<--- MANTENIDO en copyWith
      accentColor: accentColor ?? this.accentColor, // <<--- MANTENIDO en copyWith
    );
  }
}