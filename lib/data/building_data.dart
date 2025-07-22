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

// =========================================================================
// DEFINICIÓN DE CATEGORÍAS PARA EL FILTRADO (¡ESTO ES LO NUEVO!)
// =========================================================================

// Categorías principales para el filtro inicial de la barra lateral
final List<String> mainBuildingCategories = [
  'Todos',
  'Facultades', // Esta será la opción que despliega las facultades
  'Aulas y Oficinas',
  'Auditorios',
  'Bibliotecas',
  'Comedores', // Si tienes comedores, si no, considera quitarlo
  'Oficinas', // Mantengo tu nombre original 'Oficinas'
  'Servicios', // Mantengo tu nombre original 'Servicios'
  'Bienestar y Deportes',
  'Laboratorios',
  'Ciencia y Tecnología',
  'Acceso al Campus',
  // Asegúrate de que estas categorías coincidan con las 'category' de tus Building,
  // O con un grupo de 'tags' que representen una categoría.
];

// Subcategorías para las Facultades (usadas para el dropdown anidado)
// Aquí usamos los nombres de las facultades directamente sin el prefijo "Facultad de "
final Map<String, List<String>> facultySubcategories = {
  'Facultades': [
    'Todos', // Opción para ver todas las facultades cuando se selecciona "Facultades"
    'Ingeniería',
    'Química', // Ahora 'Química' es una subcategoría de Facultad
    'Enfermería', // Ahora 'Enfermería' es una subcategoría de Facultad
    'Ciencias Humanas', // Para Fals Borda
    'Ciencias Económicas', // Para Edificio 310
    'Ciencias', // Para Edificio 404 y 564
    // Agrega aquí todas las facultades específicas que tengas en tus 'tags'
    // EJEMPLO: 'Medicina', 'Odontología', 'Derecho', 'Artes', 'Agronomía', 'Arquitectura'
  ],
};


// --- Definición de Edificios ---
final Building building205 = Building(
  id: '205',
  name: 'Edificio Fals Borda',
  latitude: 4.634449,
  longitude: -74.083858,
  shortName: '205-Fals Borda',
  category: 'Facultad',
  coords: LatLng(4.634449, -74.083858),
  icon: Icons.school_outlined,
  imageUrls: [
    'assets/buildings/205/205.jpg',
    'assets/buildings/205/2052.jpg',
  ],
  info: info205,
  history: history205,
  contactInfo: contactInfo205,
  hours: hours205,
  rooms: rooms205,
  specialServices: specialServices205,
  markerColor: Colors.blueGrey.shade700,
  isAccessible: true,
  tags: ['Sociología', 'Fals Borda', 'Ciencias Humanas', 'Aula', 'Oficina', 'Facultad de Ciencias Humanas'], // Añadido 'Facultad de Ciencias Humanas' como tag
);

final Building building103 = Building(
  id: '103',
  name: 'Edificio Central - Polideportivo',
  latitude: 4.634535,
  longitude: -74.082750,
  shortName: '103-Polideportivo',
  category: 'Bienestar y Deportes',
  coords: LatLng(4.634535, -74.082750),
  icon: Icons.sports_gymnastics_outlined,
  imageUrls: [
    'assets/buildings/103/polideportivo.jpg',
  ],
  info: info103,
  history: history103,
  contactInfo: contactInfo103,
  hours: hours103,
  rooms: rooms103,
  specialServices: specialServices103,
  markerColor: Colors.blue.shade700,
  isAccessible: true,
  tags: ['Deportes', 'Gimnasio', 'Cancha', 'Piscina', 'Bienestar Universitario'], // Añadido 'Bienestar Universitario'
);

final Building building451 = Building(
  id: '451',
  name: 'Facultad de Química',
  latitude: 4.637513,
  longitude: -74.083951,
  shortName: '451-Química',
  category: 'Facultad',
  coords: LatLng(4.637513, -74.083951),
  icon: Icons.school_outlined,
  imageUrls: [
    'assets/images/451.jpg',
    'assets/images/451_3.jpg',
    'assets/images/451_2.jpg',
  ],
  info: info451,
  history: history451,
  contactInfo: contactInfo451,
  hours: hours451,
  rooms: rooms451,
  specialServices: specialServices451,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
  tags: ['Química', 'Laboratorios', 'Facultad de Ciencias', 'Aula', 'Investigación', 'Decanatura Química'], // Tags para Química
);

final Building building228 = Building(
  id: '228',
  name: 'Facultad de Enfermería',
  latitude: 4.635318,
  longitude: -74.084828,
  shortName: '228-Enfermería',
  category: 'Facultad',
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
  specialServices: specialServices228,
  markerColor: Colors.red.shade700,
  isAccessible: true,
  totalFloors: 5,
  tags: ['Enfermería', 'Salud', 'Decanatura', 'Laboratorios Clínicos', 'Aula', 'Oficina', 'Facultad de Enfermería'], // Tags para Enfermería
);

final Building building214 = Building(
  id: '214',
  name: 'Ingeniería Agrícola / Lingüística',
  latitude: 4.633583,
  longitude: -74.084016,
  shortName: 'Edificio 214',
  category: 'Facultad',
  coords: LatLng(4.633583, -74.084016),
  icon: Icons.agriculture_outlined,
  imageUrls: [
    'assets/buildings/214/214.JPG',
  ],
  info: info214,
  history: history214,
  contactInfo: contactInfo214,
  hours: hours214,
  rooms: rooms214,
  specialServices: [],
  markerColor: Colors.green.shade700,
  isAccessible: true,
  tags: ['Ingeniería Agrícola', 'Lingüística', 'Facultad de Ingeniería', 'Aula', 'Laboratorio', 'Decanatura Ingeniería Agrícola'], // Tags para 214
);

final Building building401 = Building(
  id: '401',
  name: '401 - EL VIEJO - JULIO GARAVITO',
  latitude: 4.637285408330863,
  longitude: -74.0828508734894,
  shortName: '401 - El Viejo',
  category: 'Facultad',
  coords: LatLng(4.637288, -74.082766),
  icon: Icons.school,
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
  isAccessible: true,
  tags: ['Ingeniería', 'Facultad de Ingeniería', 'Julio Garavito', 'Aula', 'Oficina', 'Decanatura Ingeniería'], // Tags para 401
);

final Building building404 = Building(
  id: '404',
  name: '404 - YU TAKEUCHI',
  latitude: 4.637727019949239,
  longitude: -74.08244855272129,
  shortName: '404 - Yu Takeuchi',
  category: 'Facultad',
  coords: LatLng(4.637783, -74.082551),
  icon: Icons.science_outlined,
  imageUrls: [
    'assets/images/404.jpg',
  ],
  info: info404,
  history: history404,
  contactInfo: contactInfo404,
  hours: hours404,
  rooms: rooms404,
  markerColor: Colors.amber.shade700,
  isAccessible: true,
  tags: ['Yu Takeuchi', 'Matemáticas', 'Física', 'Estadística', 'Facultad de Ciencias', 'Aula', 'Laboratorio', 'Decanatura Ciencias'], // Tags para 404
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
    'assets/buildings/409/409_2.jpg',
  ],
  info: info409,
  history: history409,
  contactInfo: contactInfo409,
  hours: hours409,
  rooms: rooms409,
  specialServices: specialServices409,
  markerColor: Colors.cyan.shade700,
  isAccessible: true,
  tags: ['Hidráulica', 'Laboratorio de Ingeniería', 'Investigación', 'Ingeniería Civil', 'Facultad de Ingeniería'], // Tags para 409
);

final Building building453 = Building(
  id: '453',
  name: '453 - GUILLERMINA URIBE BONE',
  latitude: 4.638534102540316,
  longitude: -74.08369625638383,
  shortName: '453 - Guillermina Uribe BC',
  category: 'Aulas y Oficinas',
  coords: LatLng(4.638467, -74.083820),
  icon: Icons.business,
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
  tags: ['Guillermina Uribe', 'Aulas', 'Oficinas', 'Docencia', 'Facultad de Ingeniería'], // Tags para 453
);

final Building buildingCYT = Building(
  id: 'cyt',
  name: 'CYT - Ciencia y Tecnología',
  latitude: 4.638033035156299,
  longitude: -74.08468415090802,
  shortName: 'CYT',
  category: 'Ciencia y Tecnología',
  coords: LatLng(4.638037, -74.084622),
  icon: Icons.science,
  imageUrls: [
    'assets/images/cyt.jpg',
    'assets/images/cyt2.jpg',
  ],
  info: infoCYT,
  history: historyCYT,
  contactInfo: contactInfoCYT,
  hours: hoursCYT,
  rooms: roomsCYT,
  markerColor: Colors.deepOrange.shade700,
  isAccessible: true,
  tags: ['Ciencias', 'Ingeniería', 'Matemáticas', 'Física', 'Estadística', 'Biología', 'Química', 'Aulas', 'Laboratorios', 'Sostenibilidad', 'Auditorio', 'Cafetería', 'Comedor'], // Tags para CYT
);

final Building building411 = Building(
  id: '411',
  name: '411 - Laboratorios DE INGENIERÍA',
  latitude: 4.639241422613168,
  longitude: -74.08261348560043,
  shortName: '411 - lab de Ing.',
  category: 'Laboratorio',
  coords: LatLng(4.639266, -74.082567),
  icon: Icons.engineering,
  imageUrls: [
    'assets/images/411.jpg',
  ],
  info: info411,
  history: history411,
  contactInfo: contactInfo411,
  hours: hours411,
  rooms: rooms411,
  markerColor: Colors.green.shade700,
  isAccessible: true,
  tags: ['Laboratorio de Ingeniería', 'Ingeniería', 'Materiales', 'Investigación', 'Facultad de Ingeniería'], // Tags para 411
);

final Building building412 = Building(
  id: '412',
  name: '412 - LABORATORIOS INGENIERÍA QUÍMICA',
  latitude: 4.638824368769169,
  longitude: -74.08313919853724,
  shortName: '412 - Ing. Química',
  category: 'Laboratorio',
  coords: LatLng(4.638906, -74.083144),
  icon: Icons.science_outlined,
  imageUrls: [
    'assets/images/412.jpg',
  ],
  info: info412,
  history: history412,
  contactInfo: contactInfo412,
  hours: hours412,
  rooms: rooms412,
  markerColor: Colors.lightGreen.shade700,
  isAccessible: true,
  tags: ['Ingeniería Química', 'Laboratorio', 'Investigación', 'Química', 'Facultad de Ciencias'], // Tags para 412
);

final Building auditorioLeonDeGreiff = Building(
  id: 'leon',
  name: 'Auditorio León De Greiff',
  latitude: 4.635742883986345,
  longitude: -74.08230380511843,
  shortName: 'Auditorio León de Greiff',
  category: 'Auditorio',
  coords: LatLng(4.635708, -74.082302),
  icon: Icons.music_note,
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
    'Domingo': 'Cerrado',
    'Feriado': 'Cerrado',
  },
  rooms: roomsAuditorioLeon,
  markerColor: Colors.red.shade700,
  isAccessible: true,
  tags: ['Conciertos', 'Eventos', 'Presentaciones', 'Música', 'Cultura', 'Espacio Cultural'], // Tags para León de Greiff
);

final Building building406 = Building(
  id: '406',
  name: '406 - FACULTAD DE INGENIERÍA (IEI)',
  latitude: 4.638300377692954,
  longitude: -74.0824579174865,
  shortName: '406 - IEI',
  category: 'Facultad',
  coords: LatLng(4.638438, -74.082522),
  icon: Icons.architecture,
  imageUrls: [
    'assets/images/406.jpg',
  ],
  info: info406,
  history: history406,
  contactInfo: contactInfo406,
  hours: hours406,
  rooms: rooms406,
  markerColor: Colors.cyan.shade700,
  isAccessible: true,
  tags: ['IEI', 'Ingeniería', 'Facultad de Ingeniería', 'Investigación', 'Electrónica'], // Tags para 406
);

final Building building407 = Building(
  id: '407',
  name: '407 - Postgrado en materiales',
  latitude: 4.639034412612558,
  longitude: -74.08212749221583,
  shortName: '407 - Posgrado',
  category: 'Oficinas',
  coords: LatLng(4.639192, -74.082074),
  icon: Icons.school_outlined,
  imageUrls: [
    'assets/images/407.jpg',
  ],
  info: info407,
  history: history407,
  contactInfo: contactInfo407,
  hours: hours407,
  rooms: rooms407,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
  tags: ['Posgrado', 'Materiales', 'Investigación', 'Docencia', 'Oficina', 'Facultad de Ingeniería'], // Tags para 407
);

final Building bibliotecaCentral = Building(
  id: 'bibcentral',
  name: 'Biblioteca Central Gabriel García Márquez',
  latitude: 4.635341559247392,
  longitude: -74.0832473319507,
  shortName: 'Biblioteca Central Gabriel G.',
  category: 'Biblioteca',
  coords: LatLng(4.635299, -74.083259),
  icon: Icons.local_library,
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
  tags: ['Libros', 'Estudio', 'Invidentes', 'Investigación', 'Historia', 'Archivos', 'Literatura', 'Arte', 'Arquitectura', 'Videoteca', 'Fonoteca', 'Computadores', 'Salas de Grupo', 'Servicios Estudiantiles'], // Tags para Biblioteca Central
);

final Building building310 = Building(
  id: '310',
  name: '310 - FACULTAD DE ECONOMÍA',
  latitude: 4.637090964604831,
  longitude: -74.0808573104446,
  shortName: '310 - Economía',
  category: 'Facultad',
  coords: LatLng(4.637245, -74.080835),
  icon: Icons.business_center_outlined,
  imageUrls: [
    'assets/images/310.jpg',
  ],
  info: info310,
  history: history310,
  contactInfo: contactInfo310,
  hours: hours310,
  rooms: rooms310,
  markerColor: Colors.teal.shade700,
  isAccessible: true,
  tags: ['Economía', 'Facultad de Ciencias Económicas', 'Administración', 'Contaduría', 'Aula', 'Oficina', 'Decanatura Ciencias Económicas'], // Tags para 310
);

final Building building564 = Building(
  id: '564',
  name: '564 - EDIFICIO AULAS DE CIENCIAS',
  latitude: 4.636417,
  longitude: -74.086880,
  shortName: '564 - Gloria Amparo Galeano Garcés',
  category: 'Aulas y Oficinas',
  coords: LatLng(4.636417, -74.086880),
  icon: Icons.science_outlined,
  imageUrls: ['assets/images/564.jpg'],
  info: info564,
  history: history564,
  contactInfo: contactInfo564,
  hours: hours564,
  rooms: rooms564,
  markerColor: Colors.purple.shade700,
  isAccessible: true,
  tags: ['Ciencias', 'Aulas', 'Gloria Amparo Galeano Garcés', 'Matemáticas', 'Física', 'Biología', 'Química', 'Laboratorios', 'Facultad de Ciencias'], // Tags para 564
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
  icon: Icons.login,
  imageUrls: ['assets/images/45.jpg'],
  info: 'Entrada y salida de la Universidad Nacional de Colombia, sede Bogotá, ubicada sobre la Carrera 45. Es un punto clave para el acceso peatonal y vehicular, particularmente conveniente para quienes vienen de Chapinero o el sector oriental de la ciudad.',
  history: 'Uno de los puntos de acceso tradicionales al campus de la Universidad Nacional, conectando con importantes vías de la ciudad.',
  // contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]', // Eliminado
  hours: {
    'Todos los días': '6:00 AM - 10:00 PM', // Horario actualizado
  },
  rooms: [],
  specialServices: [],
  markerColor: Colors.orange,
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
  coords: LatLng(4.634500, -74.086000),
  icon: Icons.login,
  imageUrls: ['assets/images/26.jpg'],
  info: 'Entrada y salida importante de la Universidad Nacional de Colombia, sede Bogotá, ubicada en la Avenida Calle 26. Se encuentra frente a la estación de Transmilenio "Ciudad Universitaria - Lotería de Bogotá".',
  history: 'Uno de los puntos de acceso vehicular y peatonal más usados desde la Avenida 26.',
  // contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]', // Eliminado
  hours: {
    'Todos los días': '6:00 AM - 10:00 PM', // Horario actualizado
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
  latitude: 4.643545960656645,
  longitude: -74.08315693451407,
  shortName: 'Entrada Calle 53',
  category: 'Acceso al Campus',
  coords: LatLng(4.643545960656645, -74.08315693451407),
  icon: Icons.login,
  imageUrls: ['assets/images/53.jpg'],
  info: 'Entrada y salida de la Universidad Nacional de Colombia, sede Bogotá, situada por la Calle 53. Se encuentra cerca de la parada del Icontec y el edificio Cubo de Colsubsidio.',
  history: 'Punto de acceso secundario, útil para quienes vienen desde el sector de la Calle 53.',
  // contactInfo: 'Seguridad Universitaria: [Número de contacto de seguridad si aplica]', // Eliminado
  hours: {
    'Todos los días': '6:00 AM - 10:00 PM', // Horario actualizado
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
// Ahora no se usa directamente para el Dropdown principal, sino 'mainBuildingCategories'
// Deberías considerar si esta lista 'buildingCategories' sigue siendo necesaria,
// o si 'mainBuildingCategories' y 'facultySubcategories' la reemplazan.
// Por ahora, la dejaré, pero ten en cuenta que la lógica de filtro usará las nuevas.
final List<String> buildingCategories = [
  'Todos',
  'Facultad',
  'Aulas y Oficinas',
  'Auditorio',
  'Biblioteca',
  'Comedor',
  'Oficinas',
  'Servicios',
  'Bienestar y Deportes',
  'Laboratorio',
  'Ciencia y Tecnología',
  'Acceso al Campus',
];