// lib/data/building_data.dart
import 'package:flutter/material.dart'; // Importa para IconData
import 'package:latlong2/latlong.dart';
import '../models/building.dart'; // Ruta correcta relativa a lib/data

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
import '../data/building_details_specific/building_103_details_data.dart';
import '../data/building_details_specific/building_214_details_data.dart';
import '../data/building_details_specific/building_228_details_data.dart';
import '../data/building_details_specific/building_409_details_data.dart';
import '../data/building_details_specific/building_564_details_data.dart';
import '../data/building_details_specific/building_451_details_data.dart';
import '../data/building_details_specific/building_205_details_data.dart';

// --- Definición de Edificios ---
final Building building205 = Building(
  id: '205',
  name: 'Edificio Fals Borda',
  latitude: 4.634449,
  longitude: -74.083858,
  shortName: '205-Fals Borda',
  category: 'Facultad',
  coords: LatLng(4.634449, -74.083858),
  icon: Icons.school_outlined, // Un icono que represente la facultad
  imageUrls: [
    'assets/buildings/205/205.jpg',
    'assets/buildings/205/2052.jpg', // Placeholder para una segunda imagen
  ],
  info: info205, // Usando 'info' como en tu modelo
  history: history205,
  contactInfo: contactInfo205, // Usando 'contactInfo' como en tu modelo
  hours: hours205,
  rooms: rooms205,
  specialServices: specialServices205,
  markerColor: Colors.blueGrey.shade700,
  isAccessible: true,
  tags: ['Sociología', 'Fals Borda', 'Ciencias Humanas', 'Aula', 'Oficina'],
);

final Building building103 = Building(
  id: '103',
  name: 'Edificio Central - Polideportivo',
  latitude: 4.634535,
  longitude: -74.082750,
  shortName: '103-Polideportivo',
  category: 'Bienestar y Deportes',
  coords: LatLng(4.634535, -74.082750),
  icon: Icons.sports_gymnastics_outlined, // Un icono que represente el polideportivo
  imageUrls: [
    'assets/buildings/103/polideportivo.jpg',
  ],
  info: info103, // Usando 'info' como en tu modelo
  history: history103,
  contactInfo: contactInfo103, // Usando 'contactInfo' como en tu modelo
  hours: hours103,
  rooms: rooms103,
  specialServices: specialServices103,
  markerColor: Colors.blue.shade700,
  isAccessible: true,
  tags: ['Deportes', 'Gimnasio', 'Cancha', 'Piscina', 'Bienestar'],
);

final Building building451 = Building(
  id: '451',
  name: 'Facultad de Química',
  latitude: 4.637513,
  longitude: -74.083951,
  shortName: '451-Química',
  category: 'Facultad',
  coords: LatLng(4.637513, -74.083951),
  icon: Icons.school_outlined, // Un icono que represente la facultad
  imageUrls: [
    'assets/images/451.jpg',
    'assets/images/451_3.jpg',
    'assets/images/451_2.jpg', // Placeholder para una segunda imagen
  ],
  info: info451, // Usando 'info' como en tu modelo
  history: history451,
  contactInfo: contactInfo451, // Usando 'contactInfo' como en tu modelo
  hours: hours451,
  rooms: rooms451,
  specialServices: specialServices451,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
  tags: ['Química', 'Laboratorios', 'Facultad de Ciencias', 'Aula', 'Investigación'],
);

final Building building228 = Building(
  id: '228',
  name: 'Facultad de Enfermería',
  latitude: 4.635318,
  longitude: -74.084828,
  shortName: '228-Enfermería',
  category: 'Facultad', // Cambiado a 'Facultad' para ser más general
  coords: LatLng(4.635318, -74.084828),
  icon: Icons.local_hospital_outlined,
  imageUrls: [
    'assets/buildings/228/228.jpg',
    'assets/buildings/228/228_2.jpg',
    'assets/buildings/228/228_3.jpg',
  ],
  info: info228,
  history: history228,
  contactInfo: contactInfo228,
  hours: hours228,
  rooms: rooms228,
  specialServices: specialServices228, // Propiedad agregada
  markerColor: Colors.red.shade700,
  isAccessible: true,
  totalFloors: 5,
  tags: ['Enfermería', 'Salud', 'Decanatura', 'Laboratorios Clínicos', 'Aula', 'Oficina'],
);

final Building building214 = Building(
  id: '214',
  name: 'Ingeniería Agrícola / Lingüística',
  latitude: 4.633583, // Coordenadas de ejemplo
  longitude: -74.084016, // Coordenadas de ejemplo
  shortName: 'Edificio 214',
  category: 'Facultad', // Cambiado a 'Facultad' para ser más general
  coords: LatLng(4.633583, -74.084016),
  icon: Icons.agriculture_outlined, // Un icono que represente el edificio
  imageUrls: [
    'assets/buildings/214/214.JPG',
  ],
  info: info214, // Usando 'info' como en tu modelo
  history: history214,
  contactInfo: contactInfo214, // Usando 'contactInfo' como en tu modelo
  hours: hours214,
  rooms: rooms214,
  specialServices: [], // No se especificaron, así que la lista está vacía
  markerColor: Colors.green.shade700,
  isAccessible: true,
  tags: ['Ingeniería Agrícola', 'Lingüística', 'Facultad de Ingeniería', 'Aula', 'Laboratorio'],
);

final Building building401 = Building(
  id: '401',
  name: '401 - EL VIEJO - JULIO GARAVITO',
  latitude: 4.637285408330863,
  longitude: -74.0828508734894,
  shortName: '401 - El Viejo',
  category: 'Facultad',
  coords: LatLng(4.637288, -74.082766),
  icon: Icons.school, // Usas un IconData directo, lo mantenemos.
  imageUrls: [
    'assets/images/401.jpg',
    'assets/images/4001.jpg',
    'assets/images/sal401.jpg'
  ],
  info: info401,
  history: history401,
  contactInfo: contactInfo401,
  hours: hours401,
  rooms: rooms401,
  markerColor: Colors.blue.shade700,
  isAccessible: true, // Campo opcional, lo mantenemos si lo usas
  tags: ['Ingeniería', 'Facultad de Ingeniería', 'Julio Garavito', 'Aula', 'Oficina'],
);

final Building building404 = Building(
  id: '404',
  name: '404 - YU TAKEUCHI',
  latitude: 4.637727019949239,
  longitude: -74.08244855272129,
  shortName: '404 - Yu Takeuchi',
  category: 'Facultad', // Se mantiene 'Facultad' como categoría principal
  coords: LatLng(4.637783, -74.082551), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 404!
  icon: Icons.science_outlined, // Un icono que represente ciencia/matemáticas/física
  imageUrls: [
    'assets/images/404.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info404,
  history: history404,
  contactInfo: contactInfo404,
  hours: hours404,
  rooms: rooms404,
  markerColor: Colors.amber.shade700, // Un color distintivo para el 404
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Yu Takeuchi', 'Matemáticas', 'Física', 'Estadística', 'Facultad de Ciencias', 'Aula', 'Laboratorio'],
);

final Building building409 = Building(
  id: '409',
  name: 'Laboratorio de Hidráulica',
  latitude: 4.638593,
  longitude: -74.081800,
  shortName: 'Edificio 409',
  category: 'Laboratorio',
  coords: LatLng(4.638593, -74.081800),
  icon: Icons.science_outlined,
  imageUrls: [
    'assets/buildings/409/409.jpg',
    'assets/buildings/409/409_2.jpg', // Placeholder para una segunda imagen
  ],
  info: info409,
  history: history409,
  contactInfo: contactInfo409,
  hours: hours409,
  rooms: rooms409,
  specialServices: specialServices409,
  markerColor: Colors.cyan.shade700,
  isAccessible: true,
  tags: ['Hidráulica', 'Laboratorio de Ingeniería', 'Investigación', 'Ingeniería Civil'],
);

final Building building453 = Building(
  id: '453',
  name: '453 - GUILLERMINA URIBE BONE',
  latitude: 4.638534102540316,
  longitude: -74.08369625638383,
  shortName: '453 - Guillermina Uribe BC',
  category: 'Aulas y Oficinas',
  coords: LatLng(4.638467, -74.083820),
  icon: Icons.business, // Usas un IconData directo, lo mantenemos.
  imageUrls: [
    'assets/images/453.jpg',
  ],
  info: info453,
  history: history453,
  contactInfo: contactInfo453,
  hours: hours453,
  rooms: rooms453,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
  tags: ['Guillermina Uribe', 'Aulas', 'Oficinas', 'Docencia'],
);

final Building buildingCYT = Building(
  id: 'cyt',
  name: 'CYT - Ciencia y Tecnología',
  latitude: 4.638033035156299,
  longitude: -74.08468415090802,
  shortName: 'CYT',
  category: 'Ciencia y Tecnología', // Nueva categoría más específica
  coords: LatLng(4.638037, -74.084622), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL CYT!
  icon: Icons.science, // O Icons.laptop_mac si es más de computación
  imageUrls: [
    'assets/images/cyt.jpg',
    'assets/images/cyt2.jpg',
  ],
  info: infoCYT,
  history: historyCYT,
  contactInfo: contactInfoCYT,
  hours: hoursCYT,
  rooms: roomsCYT,
  markerColor: Colors.deepOrange.shade700, // Un color vibrante para CYT
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Ciencias', 'Ingeniería', 'Matemáticas', 'Física', 'Estadística', 'Biología', 'Química', 'Aulas', 'Laboratorios', 'Sostenibilidad', 'Auditorio', 'Cafetería', 'Comedor'],
);

final Building building411 = Building(
  id: '411',
  name: '411 - Laboratorios DE INGENIERÍA',
  latitude: 4.639241422613168,
  longitude: -74.08261348560043,
  shortName: '411 - lab de Ing.',
  category: 'Laboratorio', // Se usa 'Laboratorio' como categoría principal
  coords: LatLng(4.639266, -74.082567), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 411!
  icon: Icons.engineering, // O un icono más específico de laboratorio si lo prefieres
  imageUrls: [
    'assets/images/411.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info411,
  history: history411,
  contactInfo: contactInfo411,
  hours: hours411,
  rooms: rooms411,
  markerColor: Colors.green.shade700, // Un color vibrante para el 411
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Laboratorio de Ingeniería', 'Ingeniería', 'Materiales', 'Investigación'],
);

final Building building412 = Building(
  id: '412',
  name: '412 - LABORATORIOS INGENIERÍA QUÍMICA',
  latitude: 4.638824368769169,
  longitude: -74.08313919853724,
  shortName: '412 - Ing. Química',
  category: 'Laboratorio', // Se usa 'Laboratorio' como categoría principal
  coords: LatLng(4.638906, -74.083144), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 412!
  icon: Icons.science_outlined, // Un icono que represente laboratorios/química
  imageUrls: [
    'assets/images/412.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info412,
  history: history412,
  contactInfo: contactInfo412,
  hours: hours412,
  rooms: rooms412,
  markerColor: Colors.lightGreen.shade700, // Un color distintivo para el 412
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Ingeniería Química', 'Laboratorio', 'Investigación', 'Química'],
);

final Building auditorioLeonDeGreiff = Building(
  id: 'leon',
  name: 'Auditorio León De Greiff',
  latitude: 4.635742883986345,
  longitude: -74.08230380511843,
  shortName: 'Auditorio León de Greiff',
  category: 'Auditorio',
  coords: LatLng(4.635708, -74.082302),
  icon: Icons.music_note, // Usas un IconData directo, lo mantenemos.
  imageUrls: [
    'assets/images/auditorio_leon.jpg',
  ],
  info: infoAuditorioLeon,
  history: historyAuditorioLeon,
  contactInfo: contactInfoAuditorioLeon,
  hours: {
    'Lunes': '06:00 - 22:00',
    'Martes': '06:00 - 22:00',
    'Miércoles': '06:00 - 22:00',
    'Jueves': '06:00 - 22:00',
    'Viernes': '06:00 - 22:00',
    'Sábado': '07:00 - 18:00',
    'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
    'Feriado': 'Cerrado', // Considera un manejo para días feriados
  },
  rooms: roomsAuditorioLeon,
  markerColor: Colors.red.shade700,
  isAccessible: true,
  tags: ['Conciertos', 'Eventos', 'Presentaciones', 'Música', 'Cultura'],
);

final Building building406 = Building(
  id: '406',
  name: '406 - FACULTAD DE INGENIERÍA (IEI)',
  latitude: 4.638300377692954,
  longitude: -74.0824579174865,
  shortName: '406 - IEI',
  category: 'Facultad',
  coords: LatLng(4.638438, -74.082522), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 406!
  icon: Icons.architecture, // O Icons.construction, Icons.factory
  imageUrls: [
    'assets/images/406.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info406,
  history: history406,
  contactInfo: contactInfo406,
  hours: hours406,
  rooms: rooms406,
  markerColor: Colors.cyan.shade700, // Un color distintivo para el 406
  isAccessible: true, // Asumiendo que es accesible
  tags: ['IEI', 'Ingeniería', 'Facultad de Ingeniería', 'Investigación'],
);

final Building building407 = Building(
  id: '407',
  name: '407 - Postgrado en materiales',
  latitude: 4.639034412612558,
  longitude: -74.08212749221583,
  shortName: '407 - Posgrado',
  category: 'Oficinas', // Cambiado a 'Oficinas' o puedes crear 'Posgrado'
  coords: LatLng(4.639192, -74.082074), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 407!
  icon: Icons.school_outlined, // Un icono que represente posgrado o educación
  imageUrls: [
    'assets/images/407.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info407,
  history: history407,
  contactInfo: contactInfo407,
  hours: hours407,
  rooms: rooms407,
  markerColor: Colors.purple.shade700, // Un color distintivo para el 407
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Posgrado', 'Materiales', 'Investigación', 'Docencia', 'Oficina'],
);

final Building bibliotecaCentral = Building(
  id: 'bibcentral',
  name: 'Biblioteca Central Gabriel García Márquez',
  latitude: 4.635341559247392,
  longitude: -74.0832473319507,
  shortName: 'Biblioteca Central Gabriel G.',
  category: 'Biblioteca',
  coords: LatLng(4.635299, -74.083259),
  icon: Icons.local_library, // Usas un IconData directo, lo mantenemos.
  imageUrls: [
    'assets/images/biblioteca_central.jpg',
  ],
  info: infoBibCentral,
  history: historyBibCentral,
  contactInfo: contactInfoBibCentral,
  hours: hoursBibCentral,
  rooms: roomsBibCentral,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
  tags: ['Libros', 'Estudio', 'Invidentes', 'Investigación', 'Historia', 'Archivos', 'Literatura', 'Arte', 'Arquitectura', 'Videoteca', 'Fonoteca', 'Computadores', 'Salas de Grupo'],
);

final Building building310 = Building(
  id: '310',
  name: '310 - FACULTAD DE ECONOMÍA',
  latitude: 4.637090964604831,
  longitude: -74.0808573104446,
  shortName: '310 - Economía',
  category: 'Facultad',
  coords: LatLng(4.637245, -74.080835), // <-- ¡AJUSTA ESTAS COORDENADAS A LA UBICACIÓN REAL DEL EDIFICIO 310!
  icon: Icons.business_center_outlined, // Un icono que represente economía/negocios
  imageUrls: [
    'assets/images/310.jpg',
  ], // ¡Asegúrate de tener esta imagen en tus assets!
  info: info310,
  history: history310,
  contactInfo: contactInfo310,
  hours: hours310,
  rooms: rooms310,
  markerColor: Colors.teal.shade700, // Un color distintivo para el 310
  isAccessible: true, // Asumiendo que es accesible
  tags: ['Economía', 'Facultad de Ciencias Económicas', 'Administración', 'Contaduría', 'Aula', 'Oficina'],
);

final Building building564 = Building(
  id: '564',
  name: '564 - EDIFICIO AULAS DE CIENCIAS', // Nombre en mayúsculas y con número
  latitude: 4.636417, // Coordenadas de ejemplo
  longitude: -74.086880, // Coordenadas de ejemplo
  shortName: '564 - Gloria Amparo Galeano Garcés', // Nombre corto siguiendo el nuevo formato
  category: 'Aulas y Oficinas', // Categoría simplificada
  coords: LatLng(4.636417, -74.086880),
  icon: Icons.science_outlined,
  imageUrls: ['assets/images/564.jpg'], // Ruta de imagen y formato ajustados
  info: info564,
  history: history564,
  contactInfo: contactInfo564,
  hours: hours564,
  rooms: rooms564,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
  tags: ['Ciencias', 'Aulas', 'Gloria Amparo Galeano Garcés', 'Matemáticas', 'Física'],
);

// --- Entradas y Salidas del Campus ---
final Building entranceCarrera45 = Building(
  id: 'entrada-carrera-45',
  name: 'Entrada Principal - Carrera 45',
  latitude: 4.639666429461616,
  longitude: -74.08908766697235,
  shortName: 'Entrada Cra. 45',
  category: 'Acceso al Campus',
  coords: LatLng(4.639689811425981, -74.08903677397262),
  icon: Icons.login, // Icono para entrada
  imageUrls: [], // No se necesitan imágenes para una entrada/salida a menos que las tengas
  info: 'Entrada y salida de la Universidad Nacional de Colombia, sede Bogotá, ubicada sobre la Carrera 45. Es un punto clave para el acceso peatonal y vehicular, particularmente conveniente para quienes vienen de Chapinero o el sector oriental de la ciudad.',
  history: 'Uno de los puntos de acceso tradicionales al campus de la Universidad Nacional, conectando con importantes vías de la ciudad.',
  contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]',
  hours: {
    'Todos los días': 'Abierto 24 horas (horarios de acceso vehicular pueden variar)',
  },
  rooms: [],
  specialServices: [],
  markerColor: Colors.orange, // Un color distintivo para los accesos
  isAccessible: true,
  tags: ['Entrada', 'Salida', 'Carrera 45', 'Acceso Peatonal', 'Acceso Vehicular'],
);
final Building entranceCalle26 = Building(
  id: 'entrada-calle26',
  name: 'Entrada - Av. Calle 26',
  latitude: 4.634500, // **AJUSTAR CON COORDENADAS PRECISAS**
  longitude: -74.086000, // **AJUSTAR CON COORDENADAS PRECISAS**
  shortName: 'Entrada Calle 26',
  category: 'Acceso al Campus',
  coords: LatLng(4.634500, -74.086000), // **AJUSTAR CON COORDENADAS PRECISAS**
  icon: Icons.login,
  imageUrls: [],
  info: 'Entrada y salida importante de la Universidad Nacional de Colombia, sede Bogotá, ubicada en la Avenida Calle 26. Se encuentra frente a la estación de Transmilenio "Ciudad Universitaria - Lotería de Bogotá".',
  history: 'Uno de los puntos de acceso vehicular y peatonal más usados desde la Avenida 26.',
  contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]',
  hours: {
    'Todos los días': 'Abierto 24 horas (horarios de acceso vehicular pueden variar)',
  },
  rooms: [],
  specialServices: [],
  markerColor: Colors.orange,
  isAccessible: true,
  tags: ['Entrada', 'Salida', 'Transmilenio', 'Calle 26', 'Ciudad Universitaria', 'Lotería de Bogotá', 'Acceso Peatonal', 'Acceso Vehicular'],
);

final Building entranceCalle53 = Building(
  id: 'entrada-calle53',
  name: 'Entrada - Calle 53',
  latitude: 4.643545960656645, // **AJUSTAR CON COORDENADAS PRECISAS**
  longitude: -74.08315693451407, // **AJUSTAR CON COORDENADAS PRECISAS**
  shortName: 'Entrada Calle 53',
  category: 'Acceso al Campus',
  coords: LatLng(4.643545960656645, -74.08315693451407), // **AJUSTAR CON COORDENADAS PRECISAS**
  icon: Icons.login,
  imageUrls: [],
  info: 'Entrada y salida de la Universidad Nacional de Colombia, sede Bogotá, situada por la Calle 53. Se encuentra cerca de la parada del Icontec y el edificio Cubo de Colsubsidio.',
  history: 'Punto de acceso secundario, útil para quienes vienen desde el sector de la Calle 53.',
  contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]',
  hours: {
    'Todos los días': 'Abierto 24 horas (horarios de acceso pueden variar)',
  },
  rooms: [],
  specialServices: [],
  markerColor: Colors.orange,
  isAccessible: true,
  tags: ['Entrada', 'Salida', 'Calle 53', 'Icontec', 'Cubo Colsubsidio', 'Acceso Peatonal'],
);

// Lista total de todos los edificios para usar en el mapa
final List<Building> allBuildings = [
  building205,
  building103,
  building451,
  building228,
  building214,
  building401,
  building404,
  building409,
  building453,
  buildingCYT,
  building411,
  building412,
  auditorioLeonDeGreiff,
  building406,
  building407,
  bibliotecaCentral,
  building310,
  building564,
  // --- ¡Añadidas las entradas aquí! ---
  entranceCarrera45,
  entranceCalle26,
  entranceCalle53,
];

// Listado de categorías (esto es independiente de los edificios individuales, es global)
final List<String> buildingCategories = [
  'Todos',
  'Facultad',
  'Aulas y Oficinas',
  'Auditorio',
  'Biblioteca',
  'Comedor',
  'Oficinas',
  'Servicios',
  'Bienestar y Deportes', // Agregada si no estaba para el 103
  'Laboratorio', // Agregada si no estaba para los edificios con laboratorios
  'Ciencia y Tecnología', // Nueva categoría para CYT
  'Acceso al Campus', // ¡Nueva categoría para entradas y salidas!
  // Asegúrate de que estas categorías coincidan con las 'category' de tus Building
];