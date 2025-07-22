// lib/data/building_details_specific/edificio_228_antonio_narino_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info228 = 'El Edificio 228 es la sede de la Facultad de Enfermería. Cuenta con laboratorios de simulación, aulas de clase, salas de informática y espacios de trabajo y estudio para docentes y estudiantes. Las oficinas administrativas clave se encuentran en los pisos superiores.';
const String history228 = 'Historia pendiente. Se necesita información sobre la construcción y evolución del Edificio 228.';
const Map<String, String> hours228 = {
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
};
const String contactInfo228 = 'Contacto: Decanatura de la Facultad de Enfermería. \nTeléfono: Por definir.';


final List<Room> rooms228 = [
  // --- PISO SUBTERRÁNEO ---
  Room(
    id: '228-sotano-lab-simulacion',
    number: 'Laboratorios de Simulación',
    name: 'Laboratorios de Simulación de la Facultad de Enfermería',
    floor: 'Piso Subterráneo',
    category: 'Laboratorios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '228-sotano-auditorio',
    number: 'Auditorio Natividad Pinto',
    name: 'Auditorio Natividad Pinto',
    floor: 'Piso Subterráneo',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),

  // --- PRIMER PISO ---
  Room(
    id: '228-1-sala-informatica',
    number: 'Sala de Informática',
    name: 'Sala de Informática',
    floor: 'Piso 1',
    category: 'Aulas Especializadas', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '228-1-comedor',
    number: 'Comedor',
    name: 'Comedor de la Facultad',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '228-1-trabajo1',
    number: 'Sala de Trabajo 1',
    name: 'Sala de Trabajo 1',
    floor: 'Piso 1',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-1-trabajo2',
    number: 'Sala de Trabajo 2',
    name: 'Sala de Trabajo 2',
    floor: 'Piso 1',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '228-2-206',
    number: 'Aula 206',
    name: 'Aula 206', // Ensuring name is present based on your list
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-205',
    number: 'Aula 205',
    name: 'Aula 205', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-204',
    number: 'Aula 204',
    name: 'Aula 204', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-oficina-203-docentes',
    number: 'Oficina 203',
    name: 'Oficina de Docentes',
    floor: 'Piso 2',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-oficina-202-docentes',
    number: 'Oficina 202',
    name: 'Oficina de Docentes',
    floor: 'Piso 2',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-estudio1',
    number: 'Área de estudio 1',
    name: 'Área de estudio 1', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-estudio2',
    number: 'Área de estudio 2',
    name: 'Área de estudio 2', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-aula-203',
    number: 'Aula 203',
    name: 'Aula 203', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-aula-202',
    number: 'Aula 202',
    name: 'Aula 202', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-aula-201',
    number: 'Aula 201',
    name: 'Aula 201', // Ensuring name is present
    floor: 'Piso 2',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-2-oficinas-201',
    number: 'Oficinas 201',
    name: 'Oficinas de Docentes',
    floor: 'Piso 2',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),

  // --- TERCER PISO ---
  Room(
    id: '228-3-301',
    number: 'Aula 301',
    name: 'Aula 301', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-302',
    number: 'Aula 302',
    name: 'Aula 302', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-profesores',
    number: 'Sala de Profesores',
    name: 'Sala de Profesores',
    floor: 'Piso 3',
    category: 'Salones Especiales', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-301-docentes',
    number: 'Oficina 301',
    name: 'Oficina de Docentes',
    floor: 'Piso 3',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-302',
    number: 'Oficina 302',
    name: 'Dep. de Enfermería / Dep. Salud de Colectivos',
    floor: 'Piso 3',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-303',
    number: 'Aula 303',
    name: 'Aula 303', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-304',
    number: 'Aula 304',
    name: 'Aula 304', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-303-docentes',
    number: 'Oficina 303',
    name: 'Oficina de Docentes',
    floor: 'Piso 3',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-305',
    number: 'Aula 305',
    name: 'Aula 305', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-304-docentes',
    number: 'Oficina 304',
    name: 'Oficina de Docentes',
    floor: 'Piso 3',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-306',
    number: 'Aula 306',
    name: 'Aula 306', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-305',
    number: 'Oficina 305',
    name: 'Sala de Juntas',
    floor: 'Piso 3',
    category: 'Salones Especiales', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-oficina-306-docentes',
    number: 'Oficina 306',
    name: 'Oficina de Docentes',
    floor: 'Piso 3',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-307',
    number: 'Aula 307',
    name: 'Aula 307', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '228-3-308',
    number: 'Aula 308',
    name: 'Aula 308', // Ensuring name is present
    floor: 'Piso 3',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),

  // --- CUARTO PISO ---
  Room(
    id: '228-4-oficina-403',
    number: 'Oficina 403',
    name: 'Secretaría de Facultad',
    floor: 'Piso 4',
    category: 'Oficinas Administrativas', // Added category
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Jueves': '08:00 - 17:00',
      'Viernes': '07:00 - 16:00',
    },
  ),
  Room(
    id: '228-4-oficina-404',
    number: 'Oficina 404',
    name: 'Área Curricular Pregrado y Posgrado',
    floor: 'Piso 4',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Jueves': '08:00 - 17:00',
      'Viernes': '07:00 - 16:00',
    },
  ),
  Room(
    id: '228-4-oficina-405',
    number: 'Oficina 405',
    name: 'Unidad Administrativa',
    floor: 'Piso 4',
    category: 'Oficinas Administrativas', // Added category
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Jueves': '08:00 - 17:00',
      'Viernes': '07:00 - 16:00',
    },
  ),
  Room(
    id: '228-4-oficina-402',
    number: 'Oficina 402',
    name: 'Centro de Extensión e Investigación',
    floor: 'Piso 4',
    category: 'Oficinas Académicas', // Added category
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Jueves': '08:00 - 17:00',
      'Viernes': '07:00 - 16:00',
    },
  ),
  Room(
    id: '228-4-oficina-401',
    number: 'Oficina 401',
    name: 'Decanatura y Vicedecanatura',
    floor: 'Piso 4',
    category: 'Oficinas Administrativas', // Added category
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Jueves': '08:00 - 17:00',
      'Viernes': '07:00 - 16:00',
    },
  ),
];

// No se especificaron servicios especiales para este edificio
final List<Room> specialServices228 = [];