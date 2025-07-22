import '/models/room.dart';
import '/models/professor.dart';

const String info411 = 'El Edificio 411, conocido como Patios de Ingeniería, es un espacio fundamental para la investigación y las prácticas en diversas ramas de la ingeniería, incluyendo laboratorios especializados, aulas de pregrado y posgrado, y oficinas para profesores.';
const String history411 = '''
El Edificio 411, popularmente conocido como Patios de Ingeniería, fue construido en la década de 1940, formando parte del conjunto original de edificaciones que conformaron la naciente Ciudad Universitaria de la Universidad Nacional de Colombia en Bogotá. Históricamente, este edificio ha albergado laboratorios cruciales para el desarrollo de la ingeniería en el país, incluyendo áreas como telecomunicaciones y ensayos eléctricos.

En años recientes, el Edificio 411 ha sido objeto de significativas renovaciones que han mejorado su infraestructura y capacidad tecnológica, a la vez que se ha procurado conservar su invaluable valor patrimonial. Hoy en día, sigue siendo un espacio vital y dinámico para la formación académica, la investigación y la innovación en diversas disciplinas de la ingeniería.
''';
const Map<String, String> hours411 = {
  'Lunes': '07:00 - 22:00', // DEJAN ABIERTAS SALAS DE PRACTICA
  'Martes': '07:00 - 22:00', // DEJAN ABIERTAS SALAS DE PRACTICA
  'Miércoles': '07:00 - 22:00', // DEJAN ABIERTAS SALAS DE PRACTICA
  'Jueves': '07:00 - 14:00',
  'Viernes': '07:00 - 14:00',
  'Sábado': 'Cerrado', // Asumiendo cerrado si no se especifica.
  'Domingo': 'Cerrado', // Asumiendo cerrado.
  'Feriado': 'Cerrado', // Asumiendo cerrado.
};
const String contactInfo411 = 'Contacto: Área Curricular de Ingeniería Eléctrica y Electrónica. \nCorreo electrónico: Por definir. \nTeléfono: Por definir.';


final List<Room> rooms411 = [
  // --- PRIMER PISO ---
  Room(
    id: '411-1-almacen',
    number: 'Almacén',
    name: 'Almacén (Préstamo de materiales)',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Almacén',
  ),
  Room(
    id: '411-1-lab-ensayos-electricos-industriales-102c',
    number: 'Laboratorio 102C',
    name: 'Laboratorio Ensayos Eléctricos e Industriales LABE',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-emd-101',
    number: 'Sala 101',
    name: 'Espacio EM&D 101',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Espacio Académico',
  ),
  Room(
    id: '411-1-emd-102d',
    number: 'Sala 102D',
    name: 'Espacio EM&D 102D',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Espacio Académico',
  ),
  Room(
    id: '411-1-lab-alta-tension-113',
    number: 'Laboratorio 113',
    name: 'Laboratorio de Alta Tensión',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-electronica-analoga-112',
    number: 'Laboratorio 112',
    name: 'Laboratorio de Electrónica Análoga',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-ingenieria-agricola-100',
    number: 'Laboratorio 100',
    name: 'Laboratorio 100 Ingeniería Agrícola',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-automatizacion-maquinas-108',
    number: 'Laboratorio 108',
    name: 'Laboratorio Automatización de Máquinas',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-microprocesadores-107-a', // Adjusted ID for uniqueness
    number: 'Laboratorio 107',
    name: 'Laboratorio de Microprocesadores 107',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-electronica-potencia-115',
    number: 'Laboratorio 115',
    name: 'Laboratorio Electrónica de Potencia',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-instrumentacion-116',
    number: 'Laboratorio 116',
    name: 'Laboratorio de Instrumentación',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-maquinas-electricas-114',
    number: 'Laboratorio 114',
    name: 'Laboratorio de Máquinas Eléctricas',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-compatibilidad-electromagnetica-118',
    number: 'Laboratorio 118',
    name: 'Laboratorio Compatibilidad Electromagnética',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-ieee-117',
    number: 'Oficina 117',
    name: 'I.E.E.E. (Rama Estudiantil)',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Oficina de Grupo Estudiantil',
  ),
  Room(
    id: '411-1-lab-maquinas-herramientas-107-b', // Adjusted ID for uniqueness
    number: 'Laboratorio 107',
    name: 'Laboratorio Máquinas y Herramientas 107',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-metrologia-106',
    number: 'Laboratorio 106',
    name: 'Laboratorio Metrología',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-transmision-calor-105',
    number: 'Laboratorio 105',
    name: 'Laboratorio Transmisión de Calor',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-plantas-termicas-energias-renovables-104',
    number: 'Laboratorio 104',
    name: 'Laboratorio Plantas Térmicas y Energías Renovables',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-motores-103',
    number: 'Laboratorio 103',
    name: 'Laboratorio de Motores',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-metalografia-102',
    number: 'Laboratorio 102',
    name: 'Laboratorio Metalografía',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-lab-mecatronica-101', // Adjusted ID to differentiate from Em&d 101
    number: 'Laboratorio 101',
    name: 'Laboratorio Mecatrónica',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-1-sala-investigacion-educacion-innovacion-204-acceso-1p',
    number: 'Sala 204',
    name: 'Sala 204 de Investigación en Tecnologías para la Educación y la Innovación (Acceso por el Primer Piso)',
    floor: 'Piso 1', // Explicitly placed on 1st floor as per note, despite 204 number
    isServiceRoom: false,
    category: 'Sala de Investigación',
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '411-2-oficina-204-triana',
    number: 'Oficina 204',
    name: 'Oficina 204',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'cristian_camilo_triana', name: 'Ing. Cristian Camilo Triana Infante', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-205-mantilla-barrera',
    number: 'Oficina 205',
    name: 'Oficina 205',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'juan_miguel_mantilla', name: 'Ing. Juan Miguel Mantilla González', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'eduardo_barrera', name: 'Ing. Eduardo Barrera Guadrón', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-206-mendez-cardenas',
    number: 'Oficina 206',
    name: 'Oficina 206',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'luis_miguel_mendez', name: 'Ing. Luis Miguel Méndez Moreno', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'pedro_fabian_cardenas', name: 'Ing. Pedro Fabian Cárdenas Herrera', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-207-coordinacion-electrica',
    number: 'Oficina 207',
    name: 'Coordinación Curricular Eléctrica',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'hernando_diaz', name: 'Ing. Hernando Diaz Morales', department: 'Ingeniería Eléctrica'),
      Professor(id: 'fredy_andres_olarte', name: 'Ing. Fredy Andrés Olarte Dussan', department: 'Ingeniería Eléctrica'),
    ],
    isServiceRoom: false,
    category: 'Coordinación',
  ),
  Room(
    id: '411-2-oficina-208-bacca-varon',
    number: 'Oficina 208',
    name: 'Oficina 208',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'jan_bacca', name: 'Ing. Jan Bacca Rodriguez', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'gloria_margarita_varon', name: 'Ing. Gloria Margarita Varón Duran', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-209-baquero-cortes',
    number: 'Oficina 209',
    name: 'Oficina 209',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'giovanny_baquero', name: 'Ing. Giovanny Baquero Rozo', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'jhon_alexander_cortes', name: 'Ing. Jhon Alexander Cortes Romero', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-210-sofrony',
    number: 'Oficina 210',
    name: 'Oficina 210',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'jorge_sofrony', name: 'Ing. Jorge Sofrony Esmeral', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-oficina-211-rodriguez-tibaduiza-sanchez',
    number: 'Oficina 211',
    name: 'Oficina 211',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'pablo_enrique_rodriguez', name: 'Ing. Pablo Enrique Rodriguez Espinoza', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'diego_alexander_tibaduiza', name: 'Ing. Diego Alexander Tibaduiza', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'carlos_eduardo_sanchez', name: 'Ing. Carlos Eduardo Sánchez', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-sala-reuniones-docentes-administrativas',
    number: 'Sala de Reuniones',
    name: 'SALA DE REUNIONES DOCENTES ADMINISTRATIVAS (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Sala de Reuniones',
  ),
  Room(
    id: '411-2-oficina-212-eslava-camargo',
    number: 'Oficina 212',
    name: 'Oficina 212',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'johan_sebastian_eslava', name: 'Ing. Johan Sebastián Eslava Garnón', department: 'Ingeniería Eléctrica y Electrónica'),
      Professor(id: 'carlos_ivin_camargo', name: 'Ing. Carlos Ivin Camargo Barefo', department: 'Ingeniería Eléctrica y Electrónica'),
    ],
    isServiceRoom: false,
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '411-2-salon-203c-microelectronica',
    number: 'Salón 203C',
    name: 'Salón 203C Sala de Microeléctrica (GMUN)',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-salon-203b-investigacion-desarrollo',
    number: 'Salón 203B',
    name: 'Salón 203B Investigación y Desarrollo',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-lab-control-203a',
    number: 'Laboratorio 203A',
    name: 'Laboratorio de Control 203A',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-lab-comunicaciones-200b',
    number: 'Laboratorio 200B',
    name: 'Laboratorio de Comunicaciones 200B',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-lab-electronica-digital-microprocesadores-202a',
    number: 'Laboratorio 202A',
    name: 'Laboratorio Electrónica Digital y Microprocesadores 202A',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-lab-circuitos-202b',
    number: 'Laboratorio 202B',
    name: 'Laboratorio de Circuitos 202B',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '411-2-sala-fiun-auditorio',
    number: 'Auditorio',
    name: 'Sala FIUN (Auditorio)',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Auditorio',
  ),
];