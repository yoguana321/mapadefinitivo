import '/models/room.dart';
import '/models/professor.dart';

const String infoBibCentral = 'La Biblioteca Central Gabriel García Márquez es el principal centro de información y estudio de la Universidad Nacional de Colombia. Ofrece una vasta colección de recursos y múltiples espacios de trabajo.';
const String historyBibCentral = 'Diseñada por [Nombre del Arquitecto, si lo conoces], la Biblioteca Central fue inaugurada en [Año de Inauguración]. Es un edificio icónico del campus que ha crecido y evolucionado para satisfacer las necesidades académicas y de investigación de la comunidad universitaria, adoptando el nombre del nobel colombiano Gabriel García Márquez.';
const String hoursBibCentral = 'Horario de Lunes a Viernes: 6:00 - 22:00, Sábados: 8:00 - 18:00, Domingos: 9:00 - 17:00';
const String contactInfoBibCentral = 'Atención al Usuario: [Número Real], Correo: [Correo Real]';

final List<Room> roomsBibCentral = [
  Room(
    id: 'bib-REC',
    number: 'Recepción',
    name: 'Recepción y Préstamo de Libros',
    floor: 'General',
    isServiceRoom: true,
    // services: ['Préstamo interno y externo', 'Devoluciones'],
  ),
  Room(
    id: 'bib-CAFET',
    number: 'Cafetería',
    name: 'Cafetería de la Biblioteca',
    floor: 'General',
    isServiceRoom: true,
    // services: ['Café', 'Snacks', 'Zona de descanso'],
  ),
  Room(
    id: 'bib-BANOS',
    number: 'Baños',
    name: 'Baños',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: 'bib-ASC',
    number: 'Ascensores',
    name: 'Ascensores',
    floor: 'General',
    isServiceRoom: true,
  ),

  Room(
    id: 'bib-SCG',
    number: 'SCG',
    name: 'Sala de Consulta General',
    floor: 'Piso 1',
    // services: ['Mesas de estudio', 'Acceso a colecciones generales'],
  ),
  Room(
    id: 'bib-SRE',
    number: 'SRE',
    name: 'Sala de Recursos Electrónicos',
    floor: 'Piso 1',
    // services: ['Computadoras con internet', 'Bases de datos académicas'],
  ),
  Room(
    id: 'bib-CREF',
    number: 'CRef',
    name: 'Colección de Referencia',
    floor: 'Piso 2',
    // services: ['Diccionarios', 'Enciclopedias', 'Publicaciones seriadas'],
  ),
  Room(
    id: 'bib-STG',
    number: 'STG',
    name: 'Salas de Trabajo en Grupo',
    floor: 'Piso 2',
    // services: ['Mesas grandes', 'Pizarras', 'Reservables'],
  ),
  Room(
    id: 'bib-CE',
    number: 'CE',
    name: 'Colección Especializada',
    floor: 'Piso 3',
    // services: ['Libros por área temática específica'],
  ),
  Room(
    id: 'bib-HEM',
    number: 'Hemeroteca',
    name: 'Hemeroteca',
    floor: 'Piso 3',
    // services: ['Periódicos', 'Revistas', 'Publicaciones históricas'],
  ),
  Room(
    id: 'bib-ARCH_C',
    number: 'Arch. Central',
    name: 'Archivo Central',
    floor: 'Piso 4',
  ),
];