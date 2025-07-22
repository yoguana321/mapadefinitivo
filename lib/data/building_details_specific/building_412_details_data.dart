// lib/data/building_details_specific/building_412_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info412 = 'El Edificio 412 de la Facultad de Ingeniería está dedicado a los laboratorios de Ingeniería Química. Alberga equipos especializados para la experimentación e investigación, oficinas de profesores y salones de posgrado, fundamentales para la formación práctica y avanzada.';
const String history412 = '''
El edificio 412 ha sido un pilar para la docencia e investigación de la carrera de Ingeniería Química en la Universidad Nacional de Colombia. Diseñado para albergar los laboratorios de la disciplina, su construcción se enmarcó en la expansión de la infraestructura dedicada a las ciencias aplicadas.

Desde su apertura, ha sido equipado con diversas máquinas y herramientas necesarias para la experimentación y el desarrollo de proyectos de investigación en el campo de la química y los procesos industriales. A lo largo de los años, ha evolucionado para incorporar tecnologías modernas, siendo un espacio clave tanto para los estudiantes de pregrado como de posgrado de la Facultad de Ingeniería.
''';
const Map<String, String> hours412 = {
  'Lunes': '07:00 - 17:00', // Horario ajustado según la información más específica de los laboratorios.
  'Martes': '07:00 - 17:00',
  'Miércoles': '07:00 - 17:00',
  'Jueves': '07:00 - 17:00',
  'Viernes': '07:00 - 17:00',
  'Sábado': '07:00 - 18:00', // Mantiene el horario de sábado previo si no se especifica.
  'Domingo': 'Cerrado',
  'Feriado': 'Cerrado',
};
const String contactInfo412 = '''
Contacto General: Secretaría de Ingeniería Química - Facultad de Ingeniería.
Coordinador de Laboratorios: Javier Andrés Dávila Rincón
Correo: labiq_fiqbog@unal.edu.co
Extensión: 14301, 14302, 14306

Coordinador Laboratorio de Ingeniería Química: Mario Enrique Velásquez Lozano
Correo: mevelasquezl@unal.edu.co
Extensión: 14314
''';


final List<Room> rooms412 = [
  // --- PRIMER PISO ---
  Room(
    id: '412-1-lab-maquinas',
    number: 'Laboratorios (Piso 1)',
    name: 'Laboratorios de Ingeniería Química (Área de Máquinas)',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
    description: 'Espacio principal dedicado a laboratorios con maquinaria pesada y equipos industriales para Ingeniería Química.',
  ),
  Room(
    id: '412-1-maquina-expendedora',
    number: 'Máquina Expendedora',
    name: 'Máquina Expendedora',
    floor: 'Piso 1',
    isServiceRoom: true,
    category: 'Máquina Expendedora',
  ),
  Room(
    id: '412-1-lab-ingenieria-quimica-116',
    number: 'Salón 116',
    name: 'Laboratorio de Ingeniería Química (Salón 116)',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
    description: '''
Equipado con: Planta Piloto de Fermentación, Liofilizador, Cromatógrafo líquido de alta eficiencia, Microscopios (convencional con contraste de fases, Invertido), Centrífugas, Ultracongelador, Cámara de Bioseguridad, Electroporador, Biorreactores, Equipo de electroforésis para proteínas, Sistema de Ultrafiltración, Balanzas (analíticas y termogravimétrica), Muflas, Horno para calcinación, Mufla con atmósfera de CO2, Espectrofotómetro, pH metro UNITEKNE, Controlador APPKON, Cabina de flujo laminar, Calefactor HERDOLPH, Calentador de bloques HERDOLPH, Centrífuga HETTICH, Incubadora MEMMERT, Controlador de temperatura CEIF, Espectrofotómetro MILTON ROY COMPANY, Microscopio BAUSCH & LOMB, Bomba dosificadora EMEC, Bomba peristáltica WATSON MARLOW, Cilindro de fluidos AIRLIQUIDE, Controlador de agitación APPLIKON, Cromatógrafo SUGARPARK, Cromatógrafo HPLC modular, Electrodos de pH METTLER, Controlador de conductividad AECO, Bomba de vacío COLE PALMER, Baño de ultrasonido BRANSON, Kit de calibración de CO2 COLE PALMER, Medidor de oxígeno disuelto HANNA, Micropipetas WIGGEN HAUSER, Purificador de agua- des ionizador de agua MILLIPORE, Ultra congelador THERMOSCIENTIFIC.
''',
  ),
  // Laboratorios específicos sin número de sala listados en Portafolio de Servicios, asumiendo PISO 1
  Room(
    id: '412-1-lab-bioprocesos',
    number: 'Laboratorio',
    name: 'Laboratorio de Bioprocesos',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-ingenieria-bioquimica',
    number: 'Laboratorio',
    name: 'Laboratorio de Ingeniería Bioquímica',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-combustibles-lubricantes',
    number: 'Laboratorio',
    name: 'Laboratorio de Combustibles y Lubricantes',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-electroquimica-catalisis',
    number: 'Laboratorio',
    name: 'Laboratorio de Electroquímica y Catálisis',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-instrumental',
    number: 'Laboratorio',
    name: 'Laboratorio Instrumental',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-planta-piloto',
    number: 'Laboratorio',
    name: 'Laboratorio de Planta Piloto',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-polimeros',
    number: 'Laboratorio',
    name: 'Laboratorio de Polímeros',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-propiedades-termodinamicas-transporte',
    number: 'Laboratorio',
    name: 'Laboratorio de Propiedades Termodinámicas y de Transporte',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-control-procesos',
    number: 'Laboratorio',
    name: 'Laboratorio de Control de Procesos',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),
  Room(
    id: '412-1-lab-metrologia-temperatura',
    number: 'Laboratorio',
    name: 'Laboratorio de Metrología-Temperatura',
    floor: 'Piso 1',
    isServiceRoom: false,
    category: 'Laboratorio',
  ),


  // --- SEGUNDO PISO ---
  Room(
    id: '412-2-sala-diseno-analisis-procesos',
    number: 'Sala de Diseño',
    name: 'Sala de Diseño y Análisis de Procesos (Laboratorio de Ingeniería Química)',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Sala Especializada',
  ),
  Room(
    id: '412-2-bano-hombres',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicio',
  ),
  Room(
    id: '412-2-bano-mujeres',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
    category: 'Servicio',
  ),
  Room(
    id: '412-2-secretaria',
    number: 'Secretaría',
    name: 'Secretaría (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Secretaría',
  ),
  Room(
    id: '412-2-salon-posgrados-213',
    number: 'Salón 213',
    name: 'Salón de Posgrados 213',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Aula de Posgrado',
  ),
  Room(
    id: '412-2-salon-posgrados-214',
    number: 'Salón 214',
    name: 'Salón de Posgrados 214',
    floor: 'Piso 2',
    isServiceRoom: false,
    category: 'Aula de Posgrado',
  ),
  Room(
    id: '412-2-prof-laura-r-conde-alvaro-orjuela-201',
    number: 'Oficina 201',
    name: 'Oficina 201',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'laura_r_conde_rivera', name: 'Laura R. Conde Rivera', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'alvaro_orjuela', name: 'Álvaro Orjuela', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-nestor-rojas-luis-cordoba-206',
    number: 'Oficina 206',
    name: 'Oficina 206',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'nestor_rojas', name: 'Ing. Néstor Rojas', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'luis_cordoba', name: 'Ing. Luis Córdoba', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-luis-francisco-boada-ignacio-rodriguez-207',
    number: 'Oficina 207',
    name: 'Oficina 207',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'luis_francisco_boada', name: 'Ing. Luis Francisco Boada', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'ignacio_rodriguez', name: 'Ing. Ignacio Rodríguez', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-gerardo-rodriguez-mario-velasquez-208',
    number: 'Oficina 208',
    name: 'Oficina 208',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'gerardo_rodriguez', name: 'Ing. Gerardo Rodríguez', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'mario_velazquez', name: 'Ing. Mario Velázquez', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-ruben-dario-godoy-paulo-cesar-narvaez-209',
    number: 'Oficina 209',
    name: 'Oficina 209',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'ruben_dario_godoy', name: 'Ing. Rubén Darío Godoy', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'paulo_cesar_narvaez', name: 'Ing. Paulo César Narváez', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-ruth-lancheros-jorge-manrique-210',
    number: 'Oficina 210',
    name: 'Oficina 210',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'ruth_lancheros', name: 'Ing. Ruth Lancheros', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'jorge_manrique', name: 'Ing. Jorge Manrique', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
  Room(
    id: '412-2-prof-armando-duran-oscar-suarez-211',
    number: 'Oficina 211',
    name: 'Oficina 211',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'armando_duran', name: 'Ing. Armando Durán', department: 'Ingeniería Química y Ambiental'),
      Professor(id: 'oscar_suarez', name: 'Ing. Óscar Suárez', department: 'Ingeniería Química y Ambiental'),
    ],
    category: 'Oficina de Profesores',
  ),
];

final List<String> specialServices412 = [
  'Servicios de Ingeniería Biomédica.',
  'Trabajos con Ácido láctico.',
  'Biopolímeros.',
  'Degradación de productos industriales de petróleo.',
  'Trabajos con Microalgas.',
  'Ingeniería de tejidos.',
];