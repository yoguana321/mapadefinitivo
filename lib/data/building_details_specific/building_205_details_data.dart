import '/models/room.dart';
import '/models/professor.dart';

const String info205 = 'El Edificio 205, conocido como el Edificio Fals Borda, es un centro académico con aulas, oficinas administrativas y auditorios. Sirve como sede de diversas unidades, incluyendo áreas de bienestar universitario y el Centro Editorial.';
const String history205 = 'Historia pendiente. Se necesita información sobre la historia del edificio Fals Borda.';
const Map<String, String> hours205 = {
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
};
const String contactInfo205 = 'Contacto: Secretaría del Edificio Fals Borda. \nTeléfono: Por definir.';


final List<Room> rooms205 = [
  // --- PRIMER PISO ---
  Room(
    id: '205-1-auditorio-camilo-torres-1',
    number: 'Auditorio',
    name: 'Auditorio Camilo Torres (Entrada 1)',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(id: '205-1-aula-102', number: 'Aula 102', name: 'Aula 102', floor: 'Piso 1', isServiceRoom: false,),
  Room(id: '205-1-aula-103', number: 'Aula 103', name: 'Aula 103', floor: 'Piso 1', isServiceRoom: false,),
  Room(
    id: '205-1-auditorio-104',
    number: 'Auditorio 104',
    name: 'Auditorio 104 Luz Gabriela Arango Gaviria',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '205-1-salon-105',
    number: 'Aula 105',
    name: 'Salón Miguel Angel Beltran',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '205-1-papeleria',
    number: 'Papelería',
    name: 'Papelería',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-116',
    number: 'Oficina 116',
    name: 'Coordinación Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '205-1-oficina-117',
    number: 'Oficina 117',
    name: 'Soporte Técnico Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-almacen-publicaciones',
    number: 'Almacén',
    name: 'Almacén de Publicaciones Centro Editorial',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-120',
    number: 'Oficina 120',
    name: 'Audiovisuales Unidad de Informática y Comunicaciones',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-121',
    number: 'Oficina 121',
    name: 'Representación Estudiantil Dirección de Bienestar Universitario',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '205-1-sala-estudio-118',
    number: 'Sala de Estudio 118',
    name: 'Sala de Estudio 118',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '205-1-oficina-106',
    number: 'Oficina 106',
    name: 'Préstamo de Implementos Promoción Deportiva',
    floor: 'Piso 1',
    isServiceRoom: true,
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
    description: 'Servicio suspendido temporalmente.',
  ),
  Room(
    id: '205-1-oficina-112',
    number: 'Oficina 112',
    name: 'Dirección Gestión de Bienestar',
    floor: 'Piso 1',
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
  ),
  Room(
    id: '205-1-oficina-113',
    number: 'Oficina 113',
    name: 'Fomento Socioeconómico / Gestión Cultural',
    floor: 'Piso 1',
    isServiceRoom: false,
    scheduleMap: {
      'Lunes a Viernes': '08:00 - 16:00',
    },
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '205-2-oficina-224',
    number: 'Oficina 224',
    name: 'Centro Editorial',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-oficina-225',
    number: 'Oficina 225',
    name: 'Unidad Administrativa',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-oficina-administrativa',
    number: 'Oficina',
    name: 'Oficina Unidad Administrativa',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-oficina-tesoreria',
    number: 'Oficina',
    name: 'Oficina Tesorería',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-oficina-230',
    number: 'Oficina 230',
    name: 'Dirección Departamento Coordinación Curricular',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-coordinacion-curricular',
    number: 'Oficina',
    name: 'Coordinación Curricular Atención a Estudiantes',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-salon-228',
    number: 'Salón 228',
    name: 'Salón Edgar Helmut García Villamizar',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-aula-201',
    number: 'Aula 201',
    name: 'Aula de Informática',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '205-2-auditorio-camilo-torres-2',
    number: 'Auditorio',
    name: 'Auditorio Camilo Torres (Entrada 2)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(id: '205-2-aula-203', number: 'Aula 203', name: 'Aula 203', floor: 'Piso 2', isServiceRoom: false,),
  Room(id: '205-2-aula-204', number: 'Aula 204', name: 'Aula 204', floor: 'Piso 2', isServiceRoom: false,),
  Room(id: '205-2-aula-205', number: 'Aula 205', name: 'Aula 205', floor: 'Piso 2', isServiceRoom: false,),
  Room(
    id: '205-2-oficina-206',
    number: 'Oficina 206',
    name: 'Secretaría Académica / Notas',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(id: '205-2-aula-207', number: 'Aula 207', name: 'Aula 207', floor: 'Piso 2', isServiceRoom: false,),
  Room(
    id: '205-2-oficina-222a',
    number: 'Oficina 222a',
    name: 'Maestría en Sociología',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '205-2-oficina-223',
    number: 'Oficina 223',
    name: 'Vicedecanatura de Investigación y Extensión / PEEC',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
];

// No se especificaron servicios especiales para este edificio
final List<Room> specialServices205 = [];