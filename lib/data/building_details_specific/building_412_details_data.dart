// lib/data/building_details_specific/building_412_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info412 = 'El Edificio 412 de la Facultad de Ingeniería está dedicado a los laboratorios de Ingeniería Química. Alberga equipos especializados para la experimentación e investigación, oficinas de profesores y salones de posgrado, fundamentales para la formación práctica y avanzada.';
const String history412 = '''
El edificio 412 ha sido un pilar para la docencia e investigación de la carrera de Ingeniería Química en la Universidad Nacional de Colombia. Diseñado para albergar los laboratorios de la disciplina, su construcción se enmarcó en la expansión de la infraestructura dedicada a las ciencias aplicadas.

Desde su apertura, ha sido equipado con diversas máquinas y herramientas necesarias para la experimentación y el desarrollo de proyectos de investigación en el campo de la química y los procesos industriales. A lo largo de los años, ha evolucionado para incorporar tecnologías modernas, siendo un espacio clave tanto para los estudiantes de pregrado como de posgrado de la Facultad de Ingeniería.
''';
const Map<String, String> hours412 = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
  'Feriado': 'Cerrado', // Considera un manejo para días feriados
};
const String contactInfo412 = 'Contacto: Secretaría de Ingeniería Química - Facultad de Ingeniería.'; // Puedes añadir un correo o teléfono real si lo tienes.


final List<Room> rooms412 = [
  // --- PRIMER PISO ---
  Room(
    id: '412-1-lab-maquinas',
    number: 'Laboratorios (Piso 1)',
    name: 'Laboratorios de Ingeniería Química (Puras Máquinas)',
    floor: 'Piso 1',
    isServiceRoom: false, // Es un espacio de trabajo principal
    description: 'Espacio dedicado a laboratorios con maquinaria pesada y equipos industriales para Ingeniería Química.',
  ),
  Room(
    id: '412-1-maquina-expendedora',
    number: 'Máquina Expendedora',
    name: 'Máquina Expendedora',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '412-2-sala-diseno-analisis-procesos',
    number: 'Sala de Diseño',
    name: 'Sala de Diseño y Análisis de Procesos (Laboratorio de Ingeniería Química)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '412-2-bano-hombres',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '412-2-bano-mujeres',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '412-2-secretaria',
    number: 'Secretaría',
    name: 'Secretaría (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '412-2-salon-posgrados-213',
    number: 'Salón 213',
    name: 'Salón de Posgrados 213',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '412-2-salon-posgrados-214',
    number: 'Salón 214',
    name: 'Salón de Posgrados 214',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '412-2-prof-laura-r-conde-alvaro-orjuela-201',
    number: 'Oficina 201',
    name: 'Oficina 201',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'laura_r_conde_rivera', name: 'Laura R. Conde Rivera', department: 'Ingeniería Química'),
      Professor(id: 'alvaro_orjuela', name: 'Álvaro Orjuela', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-nestor-rojas-luis-cordoba-206',
    number: 'Oficina 206',
    name: 'Oficina 206',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'nestor_rojas', name: 'Ing. Néstor Rojas', department: 'Ingeniería Química'),
      Professor(id: 'luis_cordoba', name: 'Ing. Luis Córdoba', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-luis-francisco-boada-ignacio-rodriguez-207',
    number: 'Oficina 207',
    name: 'Oficina 207',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'luis_francisco_boada', name: 'Ing. Luis Francisco Boada', department: 'Ingeniería Química'),
      Professor(id: 'ignacio_rodriguez', name: 'Ing. Ignacio Rodríguez', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-gerardo-rodriguez-mario-velasquez-208',
    number: 'Oficina 208',
    name: 'Oficina 208',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'gerardo_rodriguez', name: 'Ing. Gerardo Rodríguez', department: 'Ingeniería Química'),
      Professor(id: 'mario_velazquez', name: 'Ing. Mario Velázquez', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-ruben-dario-godoy-paulo-cesar-narvaez-209',
    number: 'Oficina 209',
    name: 'Oficina 209',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'ruben_dario_godoy', name: 'Ing. Rubén Darío Godoy', department: 'Ingeniería Química'),
      Professor(id: 'paulo_cesar_narvaez', name: 'Ing. Paulo César Narváez', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-ruth-lancheros-jorge-manrique-210',
    number: 'Oficina 210',
    name: 'Oficina 210',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'ruth_lancheros', name: 'Ing. Ruth Lancheros', department: 'Ingeniería Química'),
      Professor(id: 'jorge_manrique', name: 'Ing. Jorge Manrique', department: 'Ingeniería Química'),
    ],
  ),
  Room(
    id: '412-2-prof-armando-duran-oscar-suarez-211',
    number: 'Oficina 211',
    name: 'Oficina 211',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'armando_duran', name: 'Ing. Armando Durán', department: 'Ingeniería Química'),
      Professor(id: 'oscar_suarez', name: 'Ing. Óscar Suárez', department: 'Ingeniería Química'),
    ],
  ),
];