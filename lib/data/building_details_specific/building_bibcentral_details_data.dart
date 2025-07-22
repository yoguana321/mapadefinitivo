import '/models/room.dart';
import '/models/professor.dart';

// Information for Biblioteca Central Gabriel García Márquez (Universidad Nacional de Colombia)
const String infoBibCentral = 'La Biblioteca Central Gabriel García Márquez es la biblioteca más importante de la Universidad Nacional de Colombia, ubicada en el centro del campus universitario en Bogotá. Cuenta con un amplio catálogo de información en todas las áreas del conocimiento, incluyendo espacios especializados para música, arte y arquitectura, videoteca, fonoteca, centros de cómputo, y una sala dedicada a personas con discapacidad visual. Alberga también una importante colección de libros raros y curiosos.';
const String historyBibCentral = 'La idea de una biblioteca central para la Universidad Nacional de Colombia se remonta a 1962, tras un estudio de Paul S. Miles que recomendó centralizar las veintiún bibliotecas de la universidad. En 1964, el Consejo Superior Universitario dispuso su creación, cediendo el antiguo edificio de la Facultad de Filosofía y Letras. Los trabajos de construcción iniciaron en 1968, con los planos elaborados por un equipo de arquitectos dirigido por Alberto Estrada y asesorado por el bibliotecólogo John Venstra. En 1971, el 1 de marzo, la biblioteca comenzó a funcionar en sus actuales instalaciones. Abrió sus puertas al público el 10 de mayo de 2001 bajo el nombre de Biblioteca Pública Parque El Tunal, y el 18 de junio de 2014, fue renombrada Biblioteca Central Gabriel García Márquez en honor al Premio Nobel de Literatura colombiano.';
const Map<String, String> hoursBibCentral = {
  // These hours are placeholders. For official hours, please consult the university's or library's official website.
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
  'Feriado': 'Cerrado',
};
const String contactInfoBibCentral = 'Universidad Nacional de Colombia, Ciudad Universitaria de Bogotá - Contacto: [Información de contacto real de la biblioteca]';


final List<Room> roomsBibCentral = [
  // --- GENERAL SERVICES (accessible across multiple floors) ---
  Room(
    id: 'bcggm-ascensor',
    number: 'Ascensor',
    name: 'Ascensor Principal',
    floor: 'General', // Indicates it serves multiple floors
    isServiceRoom: true,
    category: 'Servicios',
  ),

  // --- PRIMER PISO ---
  Room(
    id: 'bcggm-p1-maquinas-expendedoras',
    number: 'Máquinas Exp.',
    name: 'Máquinas expendedoras',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-sala-musica',
    number: 'Sala Música',
    name: 'Sala de música',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Salas de Estudio', // Fits best as a specialized study/resource room
  ),
  Room(
    id: 'bcggm-p1-biblioteca-arte-arquitectura',
    number: 'Bibl. Arte y Arq.',
    name: 'Biblioteca de arte y arquitectura',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Centro de Documentación',
  ),
  Room(
    id: 'bcggm-p1-salas-estudio-grupo',
    number: 'Salas Estudio Grupo',
    name: 'Salas de estudio en grupo',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Salas de Estudio',
  ),
  Room(
    id: 'bcggm-p1-area-administrativa',
    number: 'Área Adm.',
    name: 'Área administrativa',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: 'bcggm-p1-servicio-circulacion-prestamos',
    number: 'Serv. Circ. y Préstamo',
    name: 'Servicio de circulación y préstamos',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-servicio-devolucion-libros',
    number: 'Serv. Devolución',
    name: 'Servicio de devolución de libros',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-sala-discapacidad-visual',
    number: 'Sala Disc. Visual',
    name: 'Sala personas con discapacidad visual',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Salones Especiales', // A specialized room, fits here.
  ),
  Room(
    id: 'bcggm-p1-bano-mujer',
    number: 'Baños Mujer P1',
    name: 'Baño mujer',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-bano-hombre',
    number: 'Baño Hombre P1',
    name: 'Baño hombre',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-videoteca',
    number: 'Videoteca',
    name: 'Videoteca',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Centro de Documentación', // Similar to a library resource
  ),
  Room(
    id: 'bcggm-p1-fonoteca',
    number: 'Fonoteca',
    name: 'Fonoteca',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Centro de Documentación', // Similar to a library resource
  ),
  Room(
    id: 'bcggm-p1-computadores',
    number: 'Computadores',
    name: 'Algunos computadores disponibles',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Sala de Cómputo',
  ),
  Room(
    id: 'bcggm-p1-atencion-usuario',
    number: 'Atención Usuario',
    name: 'Atención al usuario',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p1-multimedia',
    number: 'Multimedia',
    name: 'Multimedia',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Centro de Documentación', // Houses multimedia resources for research
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: 'bcggm-p2-biblioteca-ciencias-sociales',
    number: 'Bibl. Ciencias Sociales',
    name: 'Biblioteca ciencias sociales',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Centro de Documentación',
  ),
  Room(
    id: 'bcggm-p2-bano-mujer',
    number: 'Baños Mujer P2',
    name: 'Baño mujer',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p2-bano-hombre',
    number: 'Baños Hombre P2',
    name: 'Baño hombre',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p2-sala-computo',
    number: 'Sala Cómputo',
    name: 'Sala de cómputo',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Sala de Cómputo',
  ),
  Room(
    id: 'bcggm-p2-sala-mantenimiento',
    number: 'Sala Mantenimiento',
    name: 'Sala de mantenimiento',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p2-cuarto-comunicaciones',
    number: 'Cuarto Comunicaciones',
    name: 'Cuarto de comunicaciones',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p2-biblioteca-ciencias-sociales-i',
    number: 'Bibl. Ciencias Sociales I',
    name: 'Biblioteca ciencias sociales I',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Centro de Documentación',
  ),
  Room(
    id: 'bcggm-p2-reprografia',
    number: 'Reprografía P2',
    name: 'Reprografía',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p2-sala-capacitacion',
    number: 'Sala Capacitación',
    name: 'Sala capacitación',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Sala de Reuniones',
  ),
  Room(
    id: 'bcggm-p2-circulacion-prestamo',
    number: 'Circ. y Préstamo P2',
    name: 'Circulación y préstamo',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicios',
  ),

  // --- TERCER PISO ---
  Room(
    id: 'bcggm-p3-bano-mujer',
    number: 'Baños Mujer P3',
    name: 'Baño mujer',
    floor: 'Piso 3',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p3-bano-hombre',
    number: 'Baños Hombre P3',
    name: 'Baño hombre',
    floor: 'Piso 3',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p3-biblioteca-ciencias-salud',
    number: 'Bibl. Ciencias Salud',
    name: 'Biblioteca ciencias de la salud',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Centro de Documentación',
  ),
  Room(
    id: 'bcggm-p3-biblioteca-ciencias-sociales-2',
    number: 'Bibl. Ciencias Sociales II',
    name: 'Biblioteca ciencias sociales 2',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Centro de Documentación',
  ),
  Room(
    id: 'bcggm-p3-reprografia',
    number: 'Reprografía P3',
    name: 'Reprografía',
    floor: 'Piso 3',
    isServiceRoom: true,
    category: 'Servicios',
  ),
  Room(
    id: 'bcggm-p3-salas-estudio-grupo',
    number: 'Salas Estudio Grupo P3',
    name: 'Salas de estudio en grupo',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Salas de Estudio',
  ),

  // --- CUARTO PISO ---
  Room(
    id: 'bcggm-p4-biblioteca-jose-felix-patino-restrepo',
    number: 'Bibl. José Félix Patiño',
    name: 'Biblioteca José Félix Patiño Restrepo',
    floor: 'Piso 4',
    isServiceRoom: false,
    category: 'Centro de Documentación', // Specialized Library
  ),
  Room(
    id: 'bcggm-p4-seccion-libros-raros-curiosos',
    number: 'Libros Raros y Curiosos',
    name: 'Sección libros raros y curiosos',
    floor: 'Piso 4',
    isServiceRoom: false,
    category: 'Centro de Documentación', // Specialized Library
  ),
];

// No specific special services provided beyond what's already in rooms.
final List<Room> specialServicesBibCentral = [];