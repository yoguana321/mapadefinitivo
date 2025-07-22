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
  final String info;
  final String? history;
  final LatLng coords;
  final String category; // MANTENIDO como String simple para la categoría principal
  final IconData icon;
  final List<String> imageUrls;
  final List<Room>? rooms;
  final List<Room>? specialServices;
  final Map<String, String>? hours;
  final String? contactInfo;
  final bool? isAccessible;
  final Color? markerColor;
  final String? address;
  final String? website;
  final int? totalFloors;
  final Color? accentColor;
  final List<String> tags; // ¡CLAVE! Propiedad para etiquetas múltiples

  final String _searchableContent;

  Building({
    required this.id,
    required this.name,
    required this.shortName,
    required this.info,
    this.history,
    required this.coords,
    required this.category, // MANTENIDO como String
    required this.icon,
    required this.imageUrls,
    required this.latitude,
    required this.longitude,
    this.rooms,
    this.specialServices,
    this.hours,
    this.contactInfo,
    this.isAccessible,
    this.markerColor,
    this.address,
    this.website,
    this.totalFloors,
    this.accentColor,
    this.tags = const [], // Con valor por defecto
  }) : _searchableContent = _generateSearchableContent(
    name,
    info,
    history,
    category, // Pasamos la categoría también para que sea parte del contenido buscable
    rooms,
    specialServices,
    hours,
    contactInfo,
    address,
    website,
    tags,
  );

  String get searchableContent => _searchableContent;

  static String _generateSearchableContent(
      String name,
      String info,
      String? history,
      String category, // La categoría principal del edificio
      List<Room>? rooms,
      List<Room>? specialServices,
      Map<String, String>? hours,
      String? contactInfo,
      String? address,
      String? website,
      List<String> tags,
      ) {
    String content = '';
    content += '${name.toLowerCase()} ';
    content += '${info.toLowerCase()} ';
    if (history != null) {
      content += '${history.toLowerCase()} ';
    }
    // Añadimos la categoría principal al contenido buscable
    content += '${category.toLowerCase()} ';

    // Contenido de las tags
    if (tags.isNotEmpty) {
      content += '${tags.map((tag) => tag.toLowerCase()).join(' ')} ';
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
        if (room.category != null) {
          content += '${room.category!.toLowerCase()} ';
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

    // Contenido de servicios especiales
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
        if (service.category != null) {
          content += '${service.category!.toLowerCase()} ';
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
    List<Room>? parseRoomList(List<dynamic>? jsonList) {
      return jsonList?.map((item) => Room.fromMap(item as Map<String, dynamic>)).toList();
    }

    return Building(
      id: map['id'] as String,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      info: map['info'] as String,
      history: map['history'] as String?,
      coords: LatLng(map['coords']['latitude'] as double, map['coords']['longitude'] as double),
      category: map['category'] as String, // Lee la categoría como String
      icon: IconData(map['iconCodePoint'] as int, fontFamily: map['iconFontFamily'] as String),
      imageUrls: (map['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      latitude: map['coords']['latitude'] as double,
      longitude: map['coords']['longitude'] as double,
      rooms: parseRoomList(map['rooms'] as List<dynamic>?),
      specialServices: parseRoomList(map['specialServices'] as List<dynamic>?),
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
      totalFloors: map['totalFloors'] as int?,
      accentColor: map['accentColor'] != null ? Color(map['accentColor'] as int) : null,
      tags: (map['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [], // Lee las tags
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'shortName': shortName,
      'info': info,
      'history': history,
      'coords': {'latitude': coords.latitude, 'longitude': coords.longitude},
      'category': category, // Escribe la categoría como String
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'imageUrls': imageUrls,
      'latitude': latitude,
      'longitude': longitude,
      'rooms': rooms?.map((r) => r.toMap()).toList(),
      'specialServices': specialServices?.map((s) => s.toMap()).toList(),
      'hours': hours,
      'contactInfo': contactInfo,
      'isAccessible': isAccessible,
      'markerColor': markerColor?.value,
      'address': address,
      'website': website,
      'totalFloors': totalFloors,
      'accentColor': accentColor?.value,
      'tags': tags, // Escribe las tags
    };
  }

  Building copyWith({
    String? id,
    String? name,
    String? shortName,
    String? info,
    String? history,
    LatLng? coords,
    String? category, // MANTENIDO como String
    IconData? icon,
    List<String>? imageUrls,
    double? latitude,
    double? longitude,
    List<Room>? rooms,
    List<Room>? specialServices,
    Map<String, String>? hours,
    String? contactInfo,
    bool? isAccessible,
    Color? markerColor,
    String? address,
    String? website,
    int? totalFloors,
    Color? accentColor,
    List<String>? tags, // Las tags para copyWith
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      info: info ?? this.info,
      history: history ?? this.history,
      coords: coords ?? this.coords,
      category: category ?? this.category, // MANTENIDO
      icon: icon ?? this.icon,
      imageUrls: imageUrls ?? this.imageUrls,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rooms: rooms ?? this.rooms,
      specialServices: specialServices ?? this.specialServices,
      hours: hours ?? this.hours,
      contactInfo: contactInfo ?? this.contactInfo,
      isAccessible: isAccessible ?? this.isAccessible,
      markerColor: markerColor ?? this.markerColor,
      address: address ?? this.address,
      website: website ?? this.website,
      totalFloors: totalFloors ?? this.totalFloors,
      accentColor: accentColor ?? this.accentColor,
      tags: tags ?? this.tags, // Las tags para copyWith
    );
  }
}