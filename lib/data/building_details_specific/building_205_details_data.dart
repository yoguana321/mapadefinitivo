// lib/data/building_details_specific/edificio_205_details_data.dart
import '/models/room.dart';
import '/models/professor.dart';

const String info205 = '''
El Edificio 205, conocido oficialmente como el Edificio Orlando Fals Borda y popularmente como el Edificio de Sociología, es un centro académico clave en la Universidad Nacional de Colombia. Fue diseñado dentro de la fase "Organicismo" del campus, caracterizada por sus formas ovaladas y cilíndricas y el uso de ladrillos a la vista. Alberga aulas, oficinas administrativas y auditorios, sirviendo como sede principal del Departamento de Sociología, además de otras unidades y servicios universitarios.
''';

const String history205 = '''
Construido en 1966, el Edificio Orlando Fals Borda fue concebido inicialmente como la sede de la Facultad de Sociología. Sin embargo, en sus primeros años, la facultad se transformó en un departamento de Ciencias Humanas, lo que llevó al edificio a compartir su espacio con los departamentos de Psicología y Educación desde su inauguración.

En 1971, tras la disolución del departamento de Educación y el traslado del departamento de Psicología a las Aulas de Ciencias Humanas, el edificio retomó su uso original, consolidándose como la sede exclusiva del Departamento de Sociología, aunque sigue albergando otras dependencias importantes de la universidad.
''';

const Map<String, String> hours205 = {
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
};

const String contactInfo205 = 'Secretaría del Edificio Orlando Fals Borda (205) / Departamento de Sociología. \nTeléfono: Por definir. Correo: por_definir@unal.edu.co';
const String website205 = 'https://humanas.unal.edu.co/sociologia/'; // Asumiendo este es el sitio web principal

final List<Room> rooms205 = [
  // --- PRIMER PISO ---
  // Auditorios - Piso 1
  Room(
    id: '205-1-auditorio-camilo-torres-101',
    number: '101',
    name: 'Auditorio Camilo Torres',
    floor: 'Piso 1',
    category: 'Auditorios',
    description: 'Auditorio principal del edificio, con acceso por la entrada 1.',
  ),
  Room(
    id: '205-1-auditorio-luz-gabriela-arango-104',
    number: '104',
    name: 'Auditorio Luz Gabriela Arango Gaviria',
    floor: 'Piso 1',
    category: 'Auditorios',
  ),

  // Aulas/Salones - Piso 1
  Room(id: '205-1-aula-102', number: '102', name: 'Aula 102', floor: 'Piso 1', category: 'Aulas'),
  Room(id: '205-1-aula-103', number: '103', name: 'Aula 103', floor: 'Piso 1', category: 'Aulas'),
  Room(
    id: '205-1-salon-miguel-angel-beltran-105',
    number: '105',
    name: 'Salón Miguel Ángel Beltrán',
    floor: 'Piso 1',
    category: 'Salones Especiales',
  ),
  Room(
    id: '205-1-sala-estudio-118',
    number: '118',
    name: 'Sala de Estudio',
    floor: 'Piso 1',
    category: 'Salas de Estudio',
    isServiceRoom: true,
  ),


  // Laboratorios - Piso 1
  Room(
    id: '205-1-laboratorio-lapis-107',
    number: '107',
    name: 'Laboratorio LAPIS',
    floor: 'Piso 1',
    category: 'Laboratorios',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-laboratorio-lapis-108',
    number: '108',
    name: 'Laboratorio LAPIS', // Asumo que 107 y 108 son parte del mismo laboratorio
    floor: 'Piso 1',
    category: 'Laboratorios',
    isServiceRoom: true,
  ),


  // Oficinas - Piso 1
  Room(
    id: '205-1-oficina-coordinacion-informatica-116',
    number: '116',
    name: 'Oficina Coordinación Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-1-oficina-representacion-estudiantil-121',
    number: '121',
    name: 'Oficina Representación Estudiantil Dirección de Bienestar Universitario',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-1-oficina-direccion-gestion-bienestar-112',
    number: '112',
    name: 'Oficina Dirección Gestión de Bienestar',
    floor: 'Piso 1',
    category: 'Oficinas de Bienestar',
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
  ),
  Room(
    id: '205-1-oficina-fomento-socioeconomico-113',
    number: '113',
    name: 'Oficina Fomento Socioeconómico / Gestión Cultural',
    floor: 'Piso 1',
    category: 'Oficinas de Bienestar',
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
  ),

  // Servicios - Piso 1
  Room(
    id: '205-1-papeleria-sn', // Sin número específico
    number: 'Papelería',
    name: 'Papelería',
    floor: 'Piso 1',
    category: 'Servicios',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-soporte-informatica-117',
    number: '117',
    name: 'Oficina Soporte Técnico Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    category: 'Servicios',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-almacen-publicaciones-119',
    number: '119',
    name: 'Almacén de Publicaciones Centro Editorial',
    floor: 'Piso 1',
    category: 'Servicios',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-audiovisuales-120',
    number: '120',
    name: 'Oficina Audiovisuales Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    category: 'Servicios',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-prestamo-implementos-106',
    number: '106',
    name: 'Oficina de Préstamo de Implementos de Promoción Deportiva',
    floor: 'Piso 1',
    category: 'Servicios',
    isServiceRoom: true,
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
    description: 'Servicio suspendido temporalmente.',
  ),


  // --- SEGUNDO PISO ---
  // Auditorios - Piso 2
  Room(
    id: '205-2-auditorio-camilo-torres-2-sn', // Asumo es la misma que 101, pero como entrada/acceso desde el Piso 2. No tiene número de sala propio.
    number: 'Auditorio',
    name: 'Auditorio Camilo Torres (Acceso Piso 2)',
    floor: 'Piso 2',
    category: 'Auditorios',
    description: 'Acceso secundario al Auditorio Camilo Torres desde el Piso 2.',
  ),

  // Aulas - Piso 2
  Room(
    id: '205-2-sala-computo-201',
    number: '201',
    name: 'Sala de Cómputo / Informática',
    floor: 'Piso 2',
    category: 'Aulas Especializadas',
    isServiceRoom: true,
  ),
  Room(id: '205-2-aula-203', number: '203', name: 'Aula 203', floor: 'Piso 2', category: 'Aulas'),
  Room(id: '205-2-aula-204', number: '204', name: 'Aula 204', floor: 'Piso 2', category: 'Aulas'),
  Room(id: '205-2-aula-205', number: '205', name: 'Aula 205', floor: 'Piso 2', category: 'Aulas'),
  Room(id: '205-2-aula-207', number: '207', name: 'Aula 207', floor: 'Piso 2', category: 'Aulas'),
  Room(
    id: '205-2-salon-edgar-helmut-garcia-228',
    number: '228',
    name: 'Salón Edgar Helmut García Villamizar',
    floor: 'Piso 2',
    category: 'Salones Especiales',
  ),

  // Oficinas - Piso 2
  Room(
    id: '205-2-oficina-secretaria-academica-206',
    number: '206',
    name: 'Oficina Secretaría Académica / Notas',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-oficina-maestria-sociologia-222a',
    number: '222a',
    name: 'Oficina Maestría en Sociología',
    floor: 'Piso 2',
    category: 'Oficinas Académicas',
  ),
  Room(
    id: '205-2-oficina-vicedecanatura-223',
    number: '223',
    name: 'Oficina Vicedecanatura de Investigación y Extensión / PEEC',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-oficina-centro-editorial-224',
    number: '224',
    name: 'Oficina Centro Editorial',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-oficina-unidad-administrativa-225',
    number: '225',
    name: 'Oficina Unidad Administrativa',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-oficina-direccion-coordinacion-curricular-230',
    number: '230',
    name: 'Oficina Dirección Departamento Coordinación Curricular',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-oficina-tesoreria-sn', // Sin número en la lista original
    number: 'Oficina',
    name: 'Oficina Tesorería',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
  Room(
    id: '205-2-coordinacion-curricular-atencion-estudiantes-sn', // Sin número en la lista original
    number: 'Oficina',
    name: 'Oficina Coordinación Curricular Atención a Estudiantes',
    floor: 'Piso 2',
    category: 'Oficinas Administrativas',
  ),
];

// No se especificaron servicios especiales para este edificio en los datos proporcionados
final List<Room> specialServices205 = [];

// Lista de profesores asociados al edificio (vacía si no se proporcionó)
final List<Professor> professors205 = [];