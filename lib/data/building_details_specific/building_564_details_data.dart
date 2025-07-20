import '/models/room.dart';
import '/models/professor.dart';

const String info564 = 'El Edificio Aulas de Ciencias Gloria Amparo Galeano Garcés (564) está dedicado a la Facultad de Ciencias. Posee una gran cantidad de aulas de clase, auditorios y servicios para el estudiantado como cafetería y máquinas expendedoras.';
const String history564 = 'Historia pendiente. Se necesita información sobre la construcción y evolución del Edificio 564.';
const Map<String, String> hours564 = {
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
};
const String contactInfo564 = 'Contacto: Decanatura de la Facultad de Ciencias. \nTeléfono: Por definir.';


final List<Room> rooms564 = [
  // --- SÓTANO (PISO -1) ---
  Room(
    id: '564-s1-auditorio1',
    number: 'Auditorio 1',
    name: 'Auditorio Dora Türk de García Banús',
    floor: 'Sótano',
    isServiceRoom: false,
  ),
  Room(
    id: '564-s1-auditorio2',
    number: 'Auditorio 2',
    name: 'Auditorio Stella Torres de Young',
    floor: 'Sótano',
    isServiceRoom: false,
  ),
  Room(
    id: '564-s1-banos',
    number: 'Baños',
    name: 'Baño de hombres y mujeres',
    floor: 'Sótano',
    isServiceRoom: true,
  ),
  Room(
    id: '564-s1-ascensor',
    number: 'Ascensor',
    name: 'Ascensor',
    floor: 'Sótano',
    isServiceRoom: true,
  ),
  Room(
    id: '564-s1-depositos',
    number: '2 depósitos',
    name: 'Depósitos',
    floor: 'Sótano',
    isServiceRoom: true,
  ),
  Room(
    id: '564-s1-planta-electrica',
    number: 'Planta Eléctrica',
    name: 'Planta Eléctrica',
    floor: 'Sótano',
    isServiceRoom: true,
  ),

  // --- PRIMER PISO (PISO 1) ---
  Room(
    id: '564-1-aulas',
    number: 'Salón 101 a 107',
    name: 'Aulas de Clase',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '564-1-cafeteria',
    number: 'Cafetería',
    name: 'Cafetería',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '564-1-banos',
    number: 'Baños',
    name: 'Baño unisex y accesible',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '564-1-maquinas',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),

  // --- SEGUNDO PISO (PISO 2) ---
  Room(
    id: '564-2-aulas',
    number: 'Salón 201 a 207',
    name: 'Aulas de Clase',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '564-2-maquinas',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '564-2-banos',
    number: 'Baños',
    name: 'Baño de hombres y mujeres',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),

  // --- TERCER PISO (PISO 3) ---
  Room(
    id: '564-3-aulas',
    number: 'Salón 301 a 307',
    name: 'Aulas de Clase',
    floor: 'Piso 3',
    isServiceRoom: false,
  ),
  Room(
    id: '564-3-maquinas',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras',
    floor: 'Piso 3',
    isServiceRoom: true,
  ),
  Room(
    id: '564-3-banos',
    number: 'Baños',
    name: 'Baño de hombres y mujeres',
    floor: 'Piso 3',
    isServiceRoom: true,
  ),

  // --- CUARTO PISO (PISO 4) ---
  Room(
    id: '564-4-cubierta',
    number: 'Cubierta',
    name: 'Cubierta / Roof',
    floor: 'Piso 4',
    isServiceRoom: false,
  ),
];

final List<Room> specialServices564 = [
  Room(
    id: '564-dispensadores-agua',
    number: 'Dispositivos de agua',
    name: 'Dispositivos para llenar agua',
    floor: 'Junto al Edificio',
    isServiceRoom: true,
  ),
];