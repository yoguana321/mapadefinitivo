import '/models/room.dart';
import '/models/professor.dart';

const String infoAuditorioLeon = 'Uno de los auditorios más importantes de la Universidad Nacional de Colombia, ideal para eventos culturales y académicos de gran escala.';
const String historyAuditorioLeon = 'El Auditorio León de Greiff, inaugurado en 1968, es una obra emblemática del arquitecto Alberto Estrada. Su diseño audaz y su acústica lo convierten en un referente arquitectónico y cultural. Ha sido escenario de innumerables conciertos, conferencias y eventos de trascendencia nacional e internacional.';
const String hoursAuditorioLeon = 'Horario de eventos: Varía según programación. Consultar cartelera.';
const String contactInfoAuditorioLeon = 'Administración del Auditorio: [Número Real], Correo: [Correo Real]';

final List<Room> roomsAuditorioLeon = [
  Room(
    id: 'leon-TAQ',
    number: 'Taquilla',
    name: 'Taquilla',
    floor: 'General',
    isServiceRoom: true,
    // services: ['Venta de boletas'],
  ),
  Room(
    id: 'leon-CAFET',
    number: 'Cafetería',
    name: 'Cafetería interna',
    floor: 'General',
    isServiceRoom: true,
    // services: ['Bebidas', 'Snacks'],
  ),
  Room(
    id: 'leon-BANOS',
    number: 'Baños',
    name: 'Baños (Pisos)',
    floor: 'General',
    isServiceRoom: true,
  ),

  Room(
    id: 'leon-SALA_PPAL',
    number: 'Sala Principal',
    name: 'Sala Principal',
    floor: 'Piso 1',
    // services: ['Sistema de sonido profesional', 'Proyector de alta definición', 'Escenario', 'Capacidad para 1800 personas'],
  ),
  Room(
    id: 'leon-VEST',
    number: 'Vestíbulo',
    name: 'Vestíbulo',
    floor: 'Piso 1',
    // services: ['Espacio para exposiciones temporales', 'Área de recepción'],
  ),
  Room(
    id: 'leon-CAMERINOS',
    number: 'Camerinos',
    name: 'Camerinos',
    floor: 'Piso -1',
    isServiceRoom: true, // Esto es un servicio del edificio
    // services: ['Vestuarios', 'Área de maquillaje'],
  ),
];