// lib/data/building_details_specific/building_406_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info406 = 'El Edificio 406, sede del Instituto de Ensayos e Investigaciones (IEI), es un hito histórico en la infraestructura científica del país. Alberga laboratorios fundamentales para la ingeniería civil, como los de estructuras, pavimentos y suelos, así como oficinas y salas de cómputo.';
const String history406 = '''
El Edificio 406, que alberga el Instituto de Ensayos e Investigaciones (IEI) de la Universidad Nacional de Colombia, es una pieza fundamental en la historia arquitectónica y científica del país. Construido en 1941, fue no solo uno de los primeros edificios en levantarse en el campus de la Ciudad Universitaria, sino que también se destacó por ser el primer edificio en Colombia destinado exclusivamente para laboratorios.

Esta característica le otorgó una importancia vital en el desarrollo de la infraestructura de investigación y ensayo del país, siendo un referente para la ingeniería civil y ambiental. A lo largo de su historia, el 406 ha sido un epicentro de conocimiento y experimentación, contribuyendo significativamente a los avances en diversas áreas de la ingeniería.
''';
const String hours406 = 'Horario de Edificio: Lunes a Viernes 6:00 - 22:00, Sábados 7:00 - 18:00 (Horarios específicos de laboratorios pueden variar).';
const String contactInfo406 = 'Contacto IEI: insei_bog@unal.edu.co'; // Usando un correo de tu imagen, puedes añadir más.

final List<Room> rooms406 = [
  // --- PRIMER PISO ---
  Room(
    id: '406-1-maquinas-expendedoras',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '406-1-bano-mujeres',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '406-1-bano-hombres',
    number: 'Baño Hombres',
    name: 'Baño de Hombres',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '406-1-sala-computo-101',
    number: 'Sala de Cómputo 101',
    name: 'Sala de Cómputo 101',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-estructuras-101',
    number: 'Lab. Estructuras 101',
    name: 'Laboratorio de Estructuras 101',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-pavimentos',
    number: 'Lab. Pavimentos',
    name: 'Laboratorio de Pavimentos',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-estructuras-cementos',
    number: 'Lab. Estructuras - Cementos',
    name: 'Laboratorio de Estructuras - Cementos',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-mecanica-solidos-103',
    number: 'Mecánica de Sólidos 103',
    name: 'Laboratorio de Mecánica de Sólidos 103',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-sala-computo-104',
    number: 'Sala de Cómputo 104',
    name: 'Sala de Cómputo 104',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-posgrado-estructuras-106',
    number: 'Posgrado Estructuras 106',
    name: 'Oficina Posgrado Estructuras 106',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-estructuras-agregados-concretos',
    number: 'Lab. Estructuras - Agregados y Concretos',
    name: 'Laboratorio de Estructuras - Agregados y Concretos',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-suelos',
    number: 'Lab. Suelos',
    name: 'Laboratorio de Suelos',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-lab-ingenieria-ambiental',
    number: 'Lab. Ingeniería Ambiental',
    name: 'Laboratorio de Ingeniería Ambiental',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '406-1-direccion-iei',
    number: 'Dirección IEI',
    name: 'Dirección Instituto de Ensayos e Investigaciones (IEI)',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '406-2-direccion-iei-218',
    number: 'Dirección IEI 218',
    name: 'Dirección Instituto de Ensayos e Investigaciones (IEI) - Oficina 218',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-unidad-ensayos-iei-secretaria-201',
    number: 'Unidad Ensayos IEI 201',
    name: 'Unidad de Ensayos IEI - Secretaría 201',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-profesores-catedra-202',
    number: 'Profesores Cátedra 202',
    name: 'Oficina de Profesores de Cátedra 202',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-sala-profesores-226',
    number: 'Sala de Profesores 226',
    name: 'Sala de Profesores 226',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-lab-ambiental-area-ensayos',
    number: 'Lab. Ambiental - Ensayos',
    name: 'Laboratorio Ambiental - Área de Ensayos',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-lab-operaciones-procesos',
    number: 'Lab. Operaciones y Procesos',
    name: 'Laboratorio de Operaciones y Procesos',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-sala-reuniones',
    number: 'Sala de Reuniones',
    name: 'Sala de Reuniones (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-lab-ingenieria-ambiental-agua-potable',
    number: 'Lab. Ing. Ambiental - Agua Potable',
    name: 'Laboratorio de Ingeniería Ambiental - Agua Potable',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-bano-mujeres',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '406-2-bano-hombres',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '406-2-prof-felix-hernandez-214',
    number: 'Oficina 214',
    name: 'Oficina 214',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'felix_hernandez', name: 'Ingeniero Félix Hernández Rodríguez', department: 'IEI'),
      Professor(id: 'nelson_pinzon', name: 'Ingeniero Nelson Pinzon Casallas', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-luis-enrique-giltorres-212',
    number: 'Oficina 212',
    name: 'Oficina 212',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'luis_giltorres', name: 'Ingeniero Luis Enrique Giltorres', department: 'IEI'),
      Professor(id: 'mauricio_tapia', name: 'Ingeniero Mauricio Alberto Tapia Camacho', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-juan-manuel-lizarazo-210',
    number: 'Oficina 210',
    name: 'Oficina 210',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'juan_lizarazo', name: 'Ingeniero Juan Manuel Lizarazo Marriaga', department: 'IEI'),
      Professor(id: 'julian_puerto', name: 'Ingeniero Julian David Puerto Suárez', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-secretaria-area-curricular-ing-civil-agricola-207',
    number: 'Secretaría 207',
    name: 'Secretaría de Área Curricular Ingeniera Civil y Agrícola 207',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-prof-octavio-coronado-205',
    number: 'Oficina 205',
    name: 'Oficina 205',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'octavio_coronado', name: 'Ingeniero Octavio Coronado García', department: 'IEI'),
      Professor(id: 'mario_torres', name: 'Ingeniero Mario Camilo Torres Suárez', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-ricardo-leon-parra-206',
    number: 'Oficina 206',
    name: 'Oficina 206',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'ricardo_parra', name: 'Ingeniero Ricardo León Parra Arango', department: 'IEI'),
      Professor(id: 'maritzabel_molina', name: 'Ingeniera Maritzabel Molina Herrera', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-julio-esteban-colmenares-208',
    number: 'Oficina 208',
    name: 'Oficina 208',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'julio_colmenares', name: 'Ingeniero Julio Esteban Colmenares', department: 'IEI'),
      Professor(id: 'guillermo_avila', name: 'Ingeniero Guillermo Eduardo Ávila Álvarez', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-carol-murillo-204',
    number: 'Oficina 204',
    name: 'Oficina 204',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'carol_murillo', name: 'Ingeniera Carol Andrea Murillo Feo', department: 'IEI'),
      Professor(id: 'ferney_bethanco', name: 'Ingeniero Ferney Bethanco Cardozo', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-centros-documentacion-geotecnia-203',
    number: 'Centro Doc. Geotecnia 203',
    name: 'Centros de Documentación Geotecnia 203',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '406-2-prof-carlos-julio-collazos-233',
    number: 'Oficina 233',
    name: 'Oficina 233',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'carlos_collazos', name: 'Ing. Carlos Julio Collazós Chaves', department: 'IEI'),
      Professor(id: 'hector_garcia', name: 'Ing. Hector Manuel García Lozada', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-quim-martha-cristina-bustos-235',
    number: 'Oficina 235',
    name: 'Oficina 235',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'martha_bustos', name: 'Quim. Martha Cristina Bustos Lopez', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-gabriela-arrieta-237',
    number: 'Oficina 237',
    name: 'Oficina 237',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'gabriela_arrieta', name: 'Prof. Gabriela Arrieta Loyo', department: 'IEI'),
    ],
  ),
  Room(
    id: '406-2-prof-leonei-vega-239',
    number: 'Oficina 239',
    name: 'Oficina 239',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'leonei_vega', name: 'Ing. Leonei Vega Mora', department: 'IEI'),
      Professor(id: 'otoniel_sanabria', name: 'Ing. Otoniel Alfonso Sanabria', department: 'IEI'),
    ],
  ),
  // --- TERCER PISO ---
  Room(
    id: '406-3-sala-estudiantes-302',
    number: 'Sala de Estudiantes 302',
    name: 'Sala de Estudiantes 302',
    floor: 'Piso 3',
    isServiceRoom: false,
  ),
  Room(
    id: '406-3-prof-dorian-luis-linero-301',
    number: 'Oficina 301',
    name: 'Oficina 301',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'dorian_linero', name: 'Ing. Dorian Luis Linero Segrera', department: 'IEI'),
      Professor(id: 'caori_takeuchi', name: 'Ing. Caori Patricia Takeuchi Tan', department: 'IEI'),
    ],
  ),
  // --- CUARTO PISO ---
  Room(
    id: '406-4-prof-jose-ricardo-martinez-401',
    number: 'Oficina 401',
    name: 'Oficina 401',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'jose_martinez', name: 'Ing. Jose Ricardo Martinez Vargas', department: 'IEI'),
    ],
  ),
];