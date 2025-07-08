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
import '../data/building_details_specific/building_cyt_details_data.dart';
import '../data/building_details_specific/building_411_details_data.dart';
import '../data/building_details_specific/building_406_details_data.dart';
import '../data/building_details_specific/building_404_details_data.dart';
import '../data/building_details_specific/building_407_details_data.dart';
import '../data/building_details_specific/building_310_details_data.dart';
import '../data/building_details_specific/building_412_details_data.dart';
// --- Definición de Edificios ---

final Building building401 = Building(
  id: '401',
  name: '401 - EL VIEJO - JULIO GARAVITO',
  shortName: '401 - El Viejo',
  category: 'Facultad',
  coords: LatLng(4.637288, -74.082766),
  icon: Icons.school, // Usas un IconData directo, lo mantenemos.
  imageUrls: ['assets/images/401.jpg',
  ],
  info: info401,
  history: history401,
  contactInfo: contactInfo401,
  hours: hours401,
  rooms: rooms401,
  markerColor: Colors.blue.shade700,
  isAccessible: true, // Campo opcional, lo mantenemos si lo usas
);
final Building building404 = Building(
  id: '404',
  name: '404 - YU TAKEUCHI',
  shortName: '404 - Yu Takeuchi',
  category: 'Facultad', // O 'Ciencias' si creas esa categoría
  coords: LatLng(4.637783, -74.082551), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 404!
  icon: Icons.science_outlined, // Un icono que represente ciencia/matemáticas/física
  imageUrls: ['assets/images/404.jpg',
  ],// ¡Asegúrate de tener esta imagen en tus assets!
  info: info404,
  history: history404,
  contactInfo: contactInfo404,
  hours: hours404,
  rooms: rooms404,
  markerColor: Colors.amber.shade700, // Un color distintivo para el 404
  isAccessible: true, // Asumiendo que es accesible
);

final Building building453 = Building(
  id: '453',
  name: '453 - GUILLERMINA URIBE BONE',
  shortName: '453 - Guillermina Uribe BC',
  category: 'Aulas y Oficinas',
  coords: LatLng(4.638467, -74.083820),
  icon: Icons.business, // Usas un IconData directo, lo mantenemos.
  imageUrls:[ 'assets/images/453.jpg',
  ],
  info: info453,
  history: history453,
  contactInfo: contactInfo453,
  hours: hours453,
  rooms: rooms453,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
);
final Building buildingCYT = Building(
  id: 'cyt',
  name: 'CYT - Ciencia y Tecnología',
  shortName: 'CYT',
  category: 'Aulas y Oficinas', // O puedes crear una categoría 'Ciencia y Tecnología' si es muy específica
  coords: LatLng(4.638037, -74.084622), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL CYT!
  icon: Icons.science, // O Icons.laptop_mac si es más de computación
  imageUrls: ['assets/images/cyt.jpg',
  ],
  info: infoCYT,
  history: historyCYT,
  contactInfo: contactInfoCYT,
  hours: hoursCYT,
  rooms: roomsCYT,
  markerColor: Colors.deepOrange.shade700, // Un color vibrante para CYT
  isAccessible: true, // Asumiendo que es accesible
);
final Building building411 = Building(
  id: '411',
  name: '411 - Laboratorios DE INGENIERÍA',
  shortName: '411 - lab de Ing.',
  category: 'Facultad', // O 'Laboratorio' si creas esa categoría
  coords: LatLng(4.639266, -74.082567), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 411!
  icon: Icons.engineering, // O un icono más específico de laboratorio si lo prefieres
  imageUrls:[ 'assets/images/411.jpg',
  ],// ¡Asegúrate de tener esta imagen en tus assets!
  info: info411,
  history: history411,
  contactInfo: contactInfo411,
  hours: hours411,
  rooms: rooms411,
  markerColor: Colors.green.shade700, // Un color vibrante para el 411
  isAccessible: true, // Asumiendo que es accesible
);
final Building building412 = Building(
  id: '412',
  name: '412 - LABORATORIOS INGENIERÍA QUÍMICA',
  shortName: '412 - Ing. Química',
  category: 'Laboratorios', // O puedes crear 'Facultad' si lo prefieres así
  coords: LatLng(4.638906, -74.083144), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 412!
  icon: Icons.science_outlined, // Un icono que represente laboratorios/química
  imageUrls: ['assets/images/412.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info412,
  history: history412,
  contactInfo: contactInfo412,
  hours: hours412,
  rooms: rooms412,
  markerColor: Colors.lightGreen.shade700, // Un color distintivo para el 412
  isAccessible: true, // Asumiendo que es accesible
);

final Building auditorioLeonDeGreiff = Building(
  id: 'leon',
  name: 'Auditorio León De Greiff',
  shortName: 'Auditorio León de Greiff',
  category: 'Auditorio',
  coords: LatLng(4.635708, -74.082302),
  icon: Icons.music_note, // Usas un IconData directo, lo mantenemos.
  imageUrls:[ 'assets/images/auditorio_leon.jpg',
  ],
  info: infoAuditorioLeon,
  history: historyAuditorioLeon,
  contactInfo: contactInfoAuditorioLeon,
  hours: hoursAuditorioLeon,
  rooms: roomsAuditorioLeon,
  markerColor: Colors.red.shade700,
  isAccessible: true,
);
final Building building406 = Building(
  id: '406',
  name: '406 - FACULTAD DE INGENIERÍA (IEI)',
  shortName: '406 - IEI',
  category: 'Facultad',
  coords: LatLng(4.638438, -74.082522), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 406!
  icon: Icons.architecture, // O Icons.construction, Icons.factory
  imageUrls:[ 'assets/images/406.jpg',
  ],// ¡Asegúrate de tener esta imagen en tus assets!
  info: info406,
  history: history406,
  contactInfo: contactInfo406,
  hours: hours406,
  rooms: rooms406,
  markerColor: Colors.cyan.shade700, // Un color distintivo para el 406
  isAccessible: true, // Asumiendo que es accesible
);
final Building building407 = Building(
  id: '407',
  name: '407 - Postgrado en materiales',
  shortName: '407 - Posgrado',
  category: 'Facultad', // O 'Posgrado' si creas esa categoría
  coords: LatLng(4.639192, -74.082074), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 407!
  icon: Icons.school_outlined, // Un icono que represente posgrado o educación
  imageUrls: ['assets/images/407.jpg',
  ],// ¡Asegúrate de tener esta imagen en tus assets!
  info: info407,
  history: history407,
  contactInfo: contactInfo407,
  hours: hours407,
  rooms: rooms407,
  markerColor: Colors.purple.shade700, // Un color distintivo para el 407
  isAccessible: true, // Asumiendo que es accesible
);
final Building bibliotecaCentral = Building(
  id: 'bibcentral',
  name: 'Biblioteca Central Gabriel García Márquez',
  shortName: 'Biblioteca Central Gabriel G.',
  category: 'Biblioteca',
  coords: LatLng(4.635299, -74.083259),
  icon: Icons.local_library, // Usas un IconData directo, lo mantenemos.
  imageUrls: ['assets/images/biblioteca_central.jpg',
  ],
  info: infoBibCentral,
  history: historyBibCentral,
  contactInfo: contactInfoBibCentral,
  hours: hoursBibCentral,
  rooms: roomsBibCentral,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
);
final Building building310 = Building(
  id: '310',
  name: '310 - FACULTAD DE ECONOMÍA',
  shortName: '310 - Economía',
  category: 'Facultad',
  coords: LatLng(4.637245, -74.080835), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 310!
  icon: Icons.business_center_outlined, // Un icono que represente economía/negocios
  imageUrls: ['assets/images/310.jpg',
  ],// ¡Asegúrate de tener esta imagen en tus assets!
  info: info310,
  history: history310,
  contactInfo: contactInfo310,
  hours: hours310,
  rooms: rooms310,
  markerColor: Colors.teal.shade700, // Un color distintivo para el 310
  isAccessible: true, // Asumiendo que es accesible
);
// Lista total de todos los edificios para usar en el mapa
final List<Building> allBuildings = [
  building401,
  building453,
  auditorioLeonDeGreiff,
  bibliotecaCentral,
  buildingCYT,
  building411,
  building406,
  building404,
  building407,
  building310,
  building412,// Añade aquí cualquier otro edificio que tengas (ej. buildingComedor, etc.)
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