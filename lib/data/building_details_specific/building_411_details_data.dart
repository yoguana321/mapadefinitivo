// lib/data/building_details_specific/building_411_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info411 = 'El Edificio 411, o Patios de Ingeniería, es un centro histórico con laboratorios clave de telecomunicaciones, ensayos eléctricos y más. Recientemente renovado, sigue siendo un pilar para la formación e investigación en ingeniería.';
const String history411 = '''
El Edificio 411, popularmente conocido como Patios de Ingeniería, se construyó en la década de 1940, formando parte integral del conjunto original de la Ciudad Universitaria de la Universidad Nacional de Colombia en Bogotá. Desde sus inicios, ha sido un pilar para la ingeniería, albergando laboratorios fundamentales como los de telecomunicaciones y ensayos eléctricos.

En años recientes, el edificio ha sido objeto de importantes renovaciones, incorporando mejoras estructurales y tecnológicas que lo modernizan, a la vez que conservan su invaluable valor patrimonial. Hoy en día, el 411 continúa siendo un espacio esencial para la formación académica de alta calidad y la investigación avanzada en diversas ramas de la ingeniería.
''';
const String hours411 = 'Horario: Lunes a Miércoles 7:00 - 22:00 (Salas de práctica abiertas). Jueves a Viernes 7:00 - 14:00.';
const String contactInfo411 = 'Contacto: Secretaría de la Facultad de Ingeniería. [Número Real], Correo: [Correo Real]';

final List<Room> rooms411 = [
  // --- PRIMER PISO ---
  Room(
    id: '411-1-almacen',
    number: 'Almacén',
    name: 'Almacén (Préstamo de materiales)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '411-1-labe-102c',
    number: 'LABE 102C',
    name: 'Laboratorio de Ensayos Eléctricos e Industriales LABE 102C',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-emd-101',
    number: 'EM&D 101',
    name: 'Laboratorio EM&D 101',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-emd-102d',
    number: 'EM&D 102D',
    name: 'Laboratorio EM&D 102D',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-alta-tension-113',
    number: 'Lab. Alta Tensión 113',
    name: 'Laboratorio de Alta Tensión 113',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-electronica-analoga-112',
    number: 'Lab. Electrónica Análoga 112',
    name: 'Laboratorio de Electrónica Análoga 112',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-ing-agricola-100',
    number: 'Lab. Ing. Agrícola 100',
    name: 'Laboratorio 100 Ingeniería Agrícola',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-automatizacion-maquinas-108',
    number: 'Lab. Automatización 108',
    name: 'Laboratorio Automatización de Máquinas 108',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-microprocesadores-107',
    number: 'Lab. Microprocesadores 107',
    name: 'Laboratorio de Microprocesadores 107',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-electronica-potencia-115',
    number: 'Lab. Electrónica Potencia 115',
    name: 'Laboratorio Electrónica de Potencia 115',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-instrumentacion-116',
    number: 'Lab. Instrumentación 116',
    name: 'Laboratorio de Instrumentación 116',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-maquinas-electricas-114',
    number: 'Lab. Máquinas Eléctricas 114',
    name: 'Laboratorio de Máquinas Eléctricas 114',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-compatibilidad-electromagnetica-118',
    number: 'Lab. Compatibilidad 118',
    name: 'Laboratorio Compatibilidad Electromagnética 118',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-ieee-117',
    number: 'IEEE 117',
    name: 'Oficina IEEE 117',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-maquinas-herramientas-107',
    number: 'Lab. Máquinas y Herramientas 107',
    name: 'Laboratorio Máquinas y Herramientas 107',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-metrologia-106',
    number: 'Lab. Metrología 106',
    name: 'Laboratorio Metrología 106',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-transmision-calor-105',
    number: 'Lab. Transmisión Calor 105',
    name: 'Laboratorio Transmisión de Calor 105',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-plantas-termicas-energias-renovables-104',
    number: 'Lab. Plantas Térmicas 104',
    name: 'Laboratorio Plantas Térmicas y Energías Renovables 104',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-motores-103',
    number: 'Lab. Motores 103',
    name: 'Laboratorio de Motores 103',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-metalografia-102',
    number: 'Lab. Metalografía 102',
    name: 'Laboratorio Metalografía 102',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '411-1-lab-mecatronica-101',
    number: 'Lab. Mecatrónica 101',
    name: 'Laboratorio Mecatrónica 101',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  // Nota: La Sala 204 está en el segundo piso pero su acceso es por el primero.
  // La incluimos en el segundo piso y se puede añadir una nota en la descripción si es necesario
  // o en la app se puede manejar un "acceso por" especial.

  // --- SEGUNDO PISO ---
  Room(
    id: '411-2-salon-203c',
    number: 'Salón 203C',
    name: 'Salón 203C Sala de Microeléctrica (GMUN)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-salon-203b',
    number: 'Salón 203B',
    name: 'Salón 203B Investigación y Desarrollo',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-lab-control-203a',
    number: 'Lab. Control 203A',
    name: 'Laboratorio de Control 203A',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-salon-212',
    number: 'Salón 212',
    name: 'Salón 212 (Johan Sebastián Eslava / Carlos Iván Camargo)',
    floor: 'Piso 2',
    isServiceRoom: false,
    professors: [
      Professor(id: 'johan_eslava', name: 'Johan Sebastián Eslava', department: 'Ingeniería', email: 'j.eslava@unal.edu.co'), // Asumiendo correos ficticios
      Professor(id: 'carlos_camargo', name: 'Carlos Iván Camargo', department: 'Ingeniería', email: 'c.camargo@unal.edu.co'), // Asumiendo correos ficticios
    ],
  ),
  Room(
    id: '411-2-sala-fiun',
    number: 'Sala FIUN',
    name: 'Sala FIUN (Auditorio)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-lab-comunicaciones-200b',
    number: 'Lab. Comunicaciones 200B',
    name: 'Laboratorio de Comunicaciones 200B',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-lab-electronica-digital-microprocesadores-202a',
    number: 'Lab. Electrónica Digital 202A',
    name: 'Laboratorio Electrónica Digital y Microprocesadores 202A',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-lab-circuitos-202b',
    number: 'Lab. Circuitos 202B',
    name: 'Laboratorio de Circuitos 202B',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '411-2-sala-investigacion-tecnologias-educacion-innovacion-204',
    number: 'Sala 204',
    name: 'Sala 204 de Investigación en Tecnologías Para la Educación y la Innovación (Acceso por el Piso 1)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
];