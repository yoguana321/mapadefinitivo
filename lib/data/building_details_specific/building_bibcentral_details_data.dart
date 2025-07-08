// lib/data/building_details_specific/building_bibcentral_details_data.dart

import '/models/room.dart';
// Aunque no se usen profesores aquí, es bueno mantenerlo si el modelo Room lo soporta.

// Información General y de Historia de la Biblioteca Central
const String infoBibCentral = 'La Biblioteca Pública Gabriel García Márquez, antes conocida como Biblioteca Pública Parque El Tunal, es un centro de información y estudio especializado en literatura latinoamericana. Alberga una vasta colección y múltiples espacios para la comunidad universitaria y el público.'; //
const String historyBibCentral = 'La Biblioteca Pública Gabriel García Márquez abrió sus puertas el 10 de mayo de 2001 como Biblioteca Pública Parque El Tunal. El 18 de junio de 2014, fue renombrada en honor al escritor, cuentista, periodista, guionista, novelista y Premio Nobel de Literatura colombiano. Está especializada en literatura latinoamericana y lleva el nombre del Premio Nobel, quien residió en Barcelona de 1967 a 1975.';
const Map<String, String> hoursBibCentral = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
  'Feriado': 'Cerrado', // Considera un manejo para días feriados
};
const String contactInfoBibCentral = 'Atención al Usuario: [Número Real], Correo: [Correo Real]';

final List<Room> roomsBibCentral = [
  // --- INFORMACIÓN GENERAL (Servicios que no pertenecen a un piso específico o son accesibles desde 'General') ---
  Room(
    id: 'bib-ASC',
    number: 'Ascensor',
    name: 'Ascensor Principal',
    floor: 'General',
    isServiceRoom: true, // Se mantiene como servicio
  ),

  // --- PRIMER PISO ---
  Room(
    id: 'bib-P1-MaquinasExp',
    number: 'Máquinas Exp.',
    name: 'Máquinas expendedoras',
    floor: 'Piso 1',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P1-SalaMusica',
    number: 'Sala Música',
    name: 'Sala de música',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico, no un servicio común
  ),
  Room(
    id: 'bib-P1-BiblioArte',
    number: 'Bibl. Arte y Arq.',
    name: 'Biblioteca de arte y arquitectura',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),
  Room(
    id: 'bib-P1-SalasEstudioGrupo',
    number: 'Salas Estudio Grupo',
    name: 'Salas de estudio en grupo',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),
  Room(
    id: 'bib-P1-Admin',
    number: 'Área Adm.',
    name: 'Área administrativa',
    floor: 'Piso 1',
    // isServiceRoom: false, // Oficina/Área específica
  ),
  Room(
    id: 'bib-P1-ServCircPrest',
    number: 'Serv. Circ. y Préstamo',
    name: 'Servicio de circulación y préstamos',
    floor: 'Piso 1',
    // isServiceRoom: false, // Servicio de la biblioteca
  ),
  Room(
    id: 'bib-P1-ServDevLibros',
    number: 'Serv. Devolución',
    name: 'Servicio de devolución de libros',
    floor: 'Piso 1',
    // isServiceRoom: false, // Servicio de la biblioteca
  ),
  Room(
    id: 'bib-P1-SalaDiscVisual',
    number: 'Sala Disc. Visual',
    name: 'Sala personas con discapacidad visual',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),
  Room(
    id: 'bib-P1-BanosMujer',
    number: 'Baños Mujer P1',
    name: 'Baños Mujer',
    floor: 'Piso 1',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P1-BanosHombre',
    number: 'Baños Hombre P1',
    name: 'Baños Hombre',
    floor: 'Piso 1',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P1-Videoteca',
    number: 'Videoteca',
    name: 'Videoteca',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),
  Room(
    id: 'bib-P1-Fonoteca',
    number: 'Fonoteca',
    name: 'Fonoteca',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),
  Room(
    id: 'bib-P1-Computadores',
    number: 'Computadores',
    name: 'Algunos computadores disponibles',
    floor: 'Piso 1',
    // isServiceRoom: false, // Equipamiento
  ),
  Room(
    id: 'bib-P1-AtencionUsuario',
    number: 'Atención Usuario',
    name: 'Atención al usuario',
    floor: 'Piso 1',
    // isServiceRoom: false, // Servicio de la biblioteca
  ),
  Room(
    id: 'bib-P1-Multimedia',
    number: 'Multimedia',
    name: 'Multimedia',
    floor: 'Piso 1',
    // isServiceRoom: false, // Espacio específico
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: 'bib-P2-BiblioCienciasSoc',
    number: 'Bibl. Ciencias Sociales',
    name: 'Biblioteca ciencias sociales',
    floor: 'Piso 2',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P2-BanoMujer',
    number: 'Baños Mujer P2',
    name: 'Baño mujer',
    floor: 'Piso 2',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P2-BanoHombre',
    number: 'Baños Hombre P2',
    name: 'Baño hombre',
    floor: 'Piso 2',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P2-SalaComputo',
    number: 'Sala Cómputo',
    name: 'Sala de cómputo',
    floor: 'Piso 2',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P2-SalaMantenimiento',
    number: 'Sala Mantenimiento',
    name: 'Sala de mantenimiento',
    floor: 'Piso 2',
    // isServiceRoom: false, // Área interna
  ),
  Room(
    id: 'bib-P2-CuartoComunicaciones',
    number: 'Cuarto Comunicaciones',
    name: 'Cuarto de comunicaciones',
    floor: 'Piso 2',
    isServiceRoom: true, // Se considera un cuarto técnico/servicio
  ),
  Room(
    id: 'bib-P2-BiblioCienciasSocI',
    number: 'Bibl. Ciencias Sociales I',
    name: 'Biblioteca ciencias sociales I',
    floor: 'Piso 2',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P2-Reprografia',
    number: 'Reprografía P2',
    name: 'Reprografía',
    floor: 'Piso 2',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P2-SalaCapacitacion',
    number: 'Sala Capacitación',
    name: 'Sala capacitación',
    floor: 'Piso 2',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P2-CircPrestamo',
    number: 'Circ. y Préstamo P2',
    name: 'Circulación y préstamo',
    floor: 'Piso 2',
    // isServiceRoom: false, // Servicio de la biblioteca
  ),

  // --- TERCER PISO ---
  Room(
    id: 'bib-P3-BanoMujer',
    number: 'Baños Mujer P3',
    name: 'Baño mujer',
    floor: 'Piso 3',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P3-BanoHombre',
    number: 'Baños Hombre P3',
    name: 'Baño hombre',
    floor: 'Piso 3',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P3-BiblioCienciasSalud',
    number: 'Bibl. Ciencias Salud',
    name: 'Biblioteca ciencias de la salud',
    floor: 'Piso 3',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P3-BiblioCienciasSoc2',
    number: 'Bibl. Ciencias Sociales II',
    name: 'Biblioteca ciencias sociales 2',
    floor: 'Piso 3',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P3-Reprografia',
    number: 'Reprografía P3',
    name: 'Reprografía',
    floor: 'Piso 3',
    isServiceRoom: true, // Servicio
  ),
  Room(
    id: 'bib-P3-SalasEstudioGrupo',
    number: 'Salas Estudio Grupo P3',
    name: 'Salas de estudio en grupo',
    floor: 'Piso 3',
    // isServiceRoom: false,
  ),

  // --- CUARTO PISO ---
  Room(
    id: 'bib-P4-BiblioJFelix',
    number: 'Bibl. José Félix Patiño',
    name: 'Biblioteca José Félix Patiño Restrepo',
    floor: 'Piso 4',
    // isServiceRoom: false,
  ),
  Room(
    id: 'bib-P4-SeccionRarosCuriosos',
    number: 'Libros Raros y Curiosos',
    name: 'Sección libros raros y curiosos',
    floor: 'Piso 4',
    // isServiceRoom: false,
  ),
];