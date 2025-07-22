import '/models/room.dart';
import '/models/professor.dart';

const String info409 = 'El Edificio 409, conocido como el Laboratorio de Hidráulica, es un espacio fundamental para la investigación y las prácticas de la Facultad de Ingeniería. Cuenta con laboratorios especializados, aulas de pregrado y posgrado, y oficinas para profesores.';
const String history409 = 'Historia pendiente. Se necesita información sobre la construcción y evolución del Edificio 409.';
const Map<String, String> hours409 = {
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
};
const String contactInfo409 = 'Contacto: Departamento de Ingeniería Civil y Agrícola. \nTeléfono: Por definir.';


final List<Room> rooms409 = [
  // --- PRIMER PISO ---
  Room(
    id: '409-1-lab',
    number: 'Laboratorio',
    name: 'Laboratorio de Prácticas de Hidráulica (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: false, // Laboratories are generally not service rooms
    category: 'Laboratorio',
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '409-2-lab',
    number: 'Laboratorio',
    name: 'Laboratorio de Prácticas de Hidráulica (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: false, // Laboratories are generally not service rooms
    category: 'Laboratorio',
  ),
  Room(
    id: '409-2-oficina-202a',
    number: 'Oficina 202a',
    name: 'Oficina 202a',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Oficina',
  ),

  // --- TERCER PISO ---
  Room(
    id: '409-3-banos',
    number: 'Baños',
    name: 'Baños (Piso 3)',
    floor: 'Piso 3',
    isServiceRoom: true,
    category: 'Servicio',
  ),
  Room(
    id: '409-3-oficina-301',
    number: 'Oficina 301',
    name: 'Oficina de Profesor 301',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'nestor_alonso_mancipe_munoz', name: 'Néstor Alonso Mancipe Muñoz', department: 'Ingeniería Civil y Agrícola'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-oficina-302',
    number: 'Oficina 302',
    name: 'Oficina de Profesor 302',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'oscar_julian_quiroga_garzon', name: 'Óscar Julián Quiroga Garzón', department: 'Ingeniería Civil y Agrícola'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-oficinas-303-304',
    number: 'Oficinas 303 y 304',
    name: 'Oficinas de Docentes (303 y 304)',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-oficinas-305-306',
    number: 'Oficinas 305 y 306',
    name: 'Oficinas de Docentes (305 y 306)',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-auditorio-307',
    number: 'Auditorio 307',
    name: 'Auditorio 307',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Auditorio',
  ),
  Room(
    id: '409-3-sala-profesores-308',
    number: 'Sala de Profesores 308',
    name: 'Sala de Profesores 308',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Sala de Profesores',
  ),
  Room(
    id: '409-3-salon-pregrado-309',
    number: 'Salón Pregrado 309',
    name: 'Salón Pregrado 309',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Aula',
  ),
  Room(
    id: '409-3-oficina-310',
    number: 'Oficina 310',
    name: 'Oficina de Profesores 310',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'adriana_patricia_pina', name: 'Adriana Patricia Piña Fulano', department: 'Ingeniería Civil y Agrícola'),
      Professor(id: 'mario_enrique_moreno', name: 'Mario Enrique Moreno Castiblanco', department: 'Ingeniería Civil y Agrícola'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-oficina-311',
    number: 'Oficina 311',
    name: 'Oficina de Profesores 311',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'rafael_orlando_ortiz', name: 'Rafael Orlando Ortiz Mosquera', department: 'Ingeniería Civil y Agrícola'),
      Professor(id: 'erasmo_alfredo_rodriguez', name: 'Erasmo Alfredo Rodríguez Sandoval', department: 'Ingeniería Civil y Agrícola'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '409-3-salon-posgrado-312',
    number: 'Salón de Posgrado 312',
    name: 'Salón de Posgrado 312',
    floor: 'Piso 3',
    isServiceRoom: false,
    category: 'Aula de Posgrado',
  ),
  Room(
    id: '409-3-oficina-313',
    number: 'Oficina 313',
    name: 'Oficina de Profesor 313',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'leonardo_david_donado', name: 'Leonardo David Donado Garzón', department: 'Ingeniería Civil y Agrícola'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
];

final List<Room> specialServices409 = [];