// lib/data/building_data.dart
import 'package:flutter/material.dart'; // Importa para IconData
import 'package:latlong2/latlong.dart';
import '../models/building.dart'; // Ruta correcta relativa a lib/data
// Ruta correcta relativa a lib/data
// Ruta correcta relativa a lib/data

// Importa los archivos de datos específicos de cada edificio
// ¡IMPORTANTE! Asegúrate que estas rutas sean correctas para tu proyecto
import '../data/building_details_specific/building_401_details_data.dart';
import '../data/building_details_specific/building_453_details_data.dart';
import '../data/building_details_specific/auditorio_leon_details_data.dart';
import '../data/building_details_specific/building_bibcentral_details_data.dart';

// --- Definición de Edificios ---

final Building building401 = Building(
  id: '401',
  name: '401 - EL VIEJO - JULIO GARAVITO',
  shortName: '401 - El Viejo',
  category: 'Facultad',
  coords: LatLng(4.637227, -74.082860),
  icon: Icons.school, // Usas un IconData directo, lo mantenemos.
  imageUrl: 'assets/images/401.jpg',
  info: info401,
  history: history401,
  contactInfo: contactInfo401,
  hours: hours401,
  rooms: rooms401,
  markerColor: Colors.blue.shade700,
  isAccessible: true, // Campo opcional, lo mantenemos si lo usas
);

final Building building453 = Building(
  id: '453',
  name: '453 - GUILLERMINA URIBE BONE',
  shortName: '453 - Guillermina Uribe BC',
  category: 'Aulas y Oficinas',
  coords: LatLng(4.638510, -74.084964),
  icon: Icons.business, // Usas un IconData directo, lo mantenemos.
  imageUrl: 'assets/images/453.jpg',
  info: info453,
  history: history453,
  contactInfo: contactInfo453,
  hours: hours453,
  rooms: rooms453,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
);

final Building auditorioLeonDeGreiff = Building(
  id: 'leon',
  name: 'Auditorio León De Greiff',
  shortName: 'Auditorio León de Greiff',
  category: 'Auditorio',
  coords: LatLng(4.635708, -74.082302),
  icon: Icons.music_note, // Usas un IconData directo, lo mantenemos.
  imageUrl: 'assets/images/auditorio_leon.jpg',
  info: infoAuditorioLeon,
  history: historyAuditorioLeon,
  contactInfo: contactInfoAuditorioLeon,
  hours: hoursAuditorioLeon,
  rooms: roomsAuditorioLeon,
  markerColor: Colors.red.shade700,
  isAccessible: true,
);

final Building bibliotecaCentral = Building(
  id: 'bibcentral',
  name: 'Biblioteca Central Gabriel García Márquez',
  shortName: 'Biblioteca Central Gabriel G.',
  category: 'Biblioteca',
  coords: LatLng(4.635299, -74.083259),
  icon: Icons.local_library, // Usas un IconData directo, lo mantenemos.
  imageUrl: 'assets/images/biblioteca_central.jpg',
  info: infoBibCentral,
  history: historyBibCentral,
  contactInfo: contactInfoBibCentral,
  hours: hoursBibCentral,
  rooms: roomsBibCentral,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
);

// Lista total de todos los edificios para usar en el mapa
final List<Building> allBuildings = [
  building401,
  building453,
  auditorioLeonDeGreiff,
  bibliotecaCentral,
  // Añade aquí cualquier otro edificio que tengas (ej. buildingComedor, etc.)
];

// Listado de categorías (esto es independiente de los edificios individuales, es global)
final List<String> buildingCategories = [
  'Todos',
  'Facultad',
  'Aulas y Oficinas',
  'Auditorio',
  'Biblioteca',
  'Comedor', // Si tienes un comedor
  'Oficinas', // Para Registro, etc.
  'Servicios', // Para Enfermería, etc.
  // Asegúrate de que estas categorías coincidan con las 'category' de tus Building
];