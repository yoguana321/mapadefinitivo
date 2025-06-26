// lib/data/building_details_specific/building_453_details_data.dart
// Si '/models/room.dart' funciona para ti, déjalo así.
// Si no, cámbialo a '../../models/room.dart'
import '/models/room.dart';
import '/models/professor.dart';

const String info453 =
    'El Edificio 453, conocido como Guillermina Uribe Bone, alberga aulas, oficinas y laboratorios de varias facultades de ingeniería. Es un punto central para la vida académica de pregrado y posgrado.';
const String history453 =
    'Nombrado en honor a GUILLERMINA URIBE BONE, la primera mujer egresada de la Facultad de Ingeniería de Bogotá. Su construcción se llevó a cabo entre 1969 y 1970 bajo la dirección del arquitecto Francisco Rojas Sánchez, con modificaciones posteriores en 1981 para mejorar su funcionalidad.';
const String hours453 =
    'Horario del edificio: Lunes a Viernes 6:00 - 22:00';
const String contactInfo453 =
    'Decanatura: [Número Real], Secretaría: [Número Real] (Ajusta los números reales aquí)';

final List<Room> rooms453 = [
  // --- SERVICIOS GENERALES (floor: 'General', isServiceRoom: true) ---
  Room(
    id: '453-Auditorios-General',
    number: 'Auditorios A, B, C',
    name: 'Auditorios Principales',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: '453-Banos-General',
    number: 'Baños',
    name: 'Baños (Derecha Mujer, Al Fondo de Entrada Hombre)',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: '453-Ascensores-General',
    number: 'Ascensores',
    name: 'Ascensores',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: '453-Bebederos-General',
    number: 'Bebederos',
    name: 'Bebederos',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: '453-PuntosCarga-General',
    number: 'Puntos de Carga',
    name: 'Puntos de Carga',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: '453-MaquinasExp-General',
    number: 'Máquinas Exp.',
    name: 'Máquinas Expendedoras',
    floor: 'General',
    isServiceRoom: true,
  ),

  // --- DIRECCIONES Y COORDINACIONES (Consideradas servicios generales o en un piso específico) ---
  // Las pondremos en 'General' si no tienen un número de aula/oficina específico en un piso.
  Room(
    id: '453-Dir-Electrica',
    number: 'Dirección Eléctrica',
    name: 'Dirección de Ingeniería Eléctrica',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Dir-Sistemas',
    number: 'Dirección Sistemas',
    name: 'Dirección de Ingeniería de Sistemas',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Dir-Quimica',
    number: 'Dirección Química',
    name: 'Dirección de Ingeniería Química y Ambiental',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Dir-Civil',
    number: 'Dirección Civil',
    name: 'Dirección de Ingeniería Civil',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Dir-Mecanica',
    number: 'Dirección Mecánica',
    name: 'Dirección de Ingeniería Mecánica y Mecatrónica',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Coord-Mantenimiento',
    number: 'Coord. Mantenimiento',
    name: 'Coordinación de Mantenimiento',
    floor: 'General', // O el piso real si lo conoces
    isServiceRoom: true,
  ),
  Room(
    id: '453-Aud-AntonioGomez',
    number: 'Aud. C',
    name: 'Auditorio Antonio María Gómez M.',
    floor: 'General', // Si es un auditorio principal
  ),

  // --- AULAS Y OFICINAS POR PISO ---

  // Piso 1
  Room(id: '453-100', number: '100', name: 'Aula 100', floor: 'Piso 1'),
  Room(
    id: '453-101-DirSIS',
    number: '101',
    name: 'Aula 101 / Dirección Dpto. de Sistemas e Industrial',
    floor: 'Piso 1',
  ),
  Room(
    id: '453-101A-Multimedios',
    number: '101A',
    name: 'Sala Multimedios Sistemas e Industrial',
    floor: 'Piso 1',
  ),
  Room(
    id: '453-102',
    number: '102',
    name: 'Aula 102',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_hector_c', name: 'Prof. Héctor Cifuentes Aya', department: 'Ingeniería', email: 'hector.cifuentes@unal.edu.co'),
      Professor(id: 'prof_luis_g_a', name: 'Prof. Luis Gerardo Astaiza Amado', department: 'Ingeniería', email: 'luis.astaiza@unal.edu.co'),
    ],
  ),
  Room(id: '453-103', number: '103', name: 'Aula 103', floor: 'Piso 1'),
  Room(
    id: '453-104',
    number: '104',
    name: 'Aula 104',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_jorge_e_c', name: 'Prof. Jorge Eliecer Camargo Mendoza', department: 'Ingeniería', email: 'jorge.camargo@unal.edu.co'),
      Professor(id: 'prof_carlos_e_m', name: 'Prof. Carlos Eduardo Moreno', department: 'Ingeniería', email: 'carlos.moreno@unal.edu.co'),
    ],
  ),
  Room(id: '453-105', number: '105', name: 'Aula 105', floor: 'Piso 1'),
  Room(
    id: '453-106',
    number: '106',
    name: 'Aula 106',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_juan_c_t', name: 'Prof. Juan Carlos Torres Pardo', department: 'Ingeniería', email: 'juan.torres@unal.edu.co'),
      Professor(id: 'prof_carlos_o_r', name: 'Prof. Carlos Orlando Robles Roa', department: 'Ingeniería', email: 'carlos.robles@unal.edu.co'),
    ],
  ),
  Room(id: '453-107', number: '107', name: 'Aula 107', floor: 'Piso 1'),
  Room(
    id: '453-108',
    number: '108',
    name: 'Aula 108',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_ismael_c', name: 'Prof. Ismael Castañeda Fuentes', department: 'Ingeniería', email: 'ismael.castaneda@unal.edu.co'),
      Professor(id: 'prof_jonatan_g', name: 'Prof. Jonatan Gómez Perdomo', department: 'Ingeniería', email: 'jonatan.gomez@unal.edu.co'),
    ],
  ),
  Room(id: '453-109', number: '109', name: 'Aula 109', floor: 'Piso 1'),
  Room(
    id: '453-110',
    number: '110',
    name: 'Aula 110',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_joger_e_o', name: 'Prof. Joger Eduardo Ortiz Triviño', department: 'Ingeniería', email: 'joger.ortiz@unal.edu.co'),
      Professor(id: 'prof_libia_d_c', name: 'Prof. Libia Denise Cangrejo Aljurr', department: 'Ingeniería', email: 'libia.cangrejo@unal.edu.co'),
    ],
  ),
  Room(id: '453-111', number: '111', name: 'Aula 111', floor: 'Piso 1'),
  Room(
    id: '453-112',
    number: '112',
    name: 'Aula 112',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_cesar_a_p', name: 'Prof. César Augusto Pedraza Bonilla', department: 'Ingeniería', email: 'cesar.pedraza@unal.edu.co'),
      Professor(id: 'prof_sandra_l_r', name: 'Prof. Sandra Liliana Rojas Martínez', department: 'Ingeniería', email: 'sandra.rojas@unal.edu.co'),
    ],
  ),
  Room(id: '453-113', number: '113', name: 'Aula 113', floor: 'Piso 1'),
  Room(
    id: '453-114',
    number: '114',
    name: 'Aula 114',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_fabio_a_g', name: 'Prof. Fabio Augusto González Osorio', department: 'Ingeniería', email: 'fabio.gonzalez@unal.edu.co'),
      Professor(id: 'prof_felipe_r_c', name: 'Prof. Felipe Restrepo Calle', department: 'Ingeniería', email: 'felipe.restrepo@unal.edu.co'),
    ],
  ),
  Room(id: '453-115', number: '115', name: 'Aula 115', floor: 'Piso 1'),
  Room(
    id: '453-116',
    number: '116',
    name: 'Aula 116',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_edgar_m_v', name: 'Prof. Edgar Miguel Vargas C.', department: 'Ingeniería', email: 'edgar.vargas@unal.edu.co'),
      Professor(id: 'prof_feliz_a_c', name: 'Prof. Feliz Antonio Cortés Aldana', department: 'Ingeniería', email: 'feliz.cortes@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-118',
    number: '118',
    name: 'Aula 118',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_luis_f_n', name: 'Prof. Luis Fernando Niño Vásquez', department: 'Ingeniería', email: 'luis.nino@unal.edu.co'),
      Professor(id: 'prof_german_j_h', name: 'Prof. Germán Jairo Hernández Pérez', department: 'Ingeniería', email: 'german.hernandez@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-119-UInform',
    number: '119',
    name: 'Unidad de Informática',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: '453-120',
    number: '120',
    name: 'Aula 120',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'prof_jean_p_c', name: 'Prof. Jean Pierre Charlamos', department: 'Ingeniería', email: 'jean.charlamos@unal.edu.co'),
      Professor(id: 'prof_ivan_m_r', name: 'Prof. Iván Mauricio Rueda Cáceres', department: 'Ingeniería', email: 'ivan.rueda@unal.edu.co'),
    ],
  ),

  // Piso 2
  Room(
    id: '453-200',
    number: '200',
    name: 'Aula 200',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_cesar_m_l', name: 'Prof. César Manuel Lovera Cabrera', department: 'Ingeniería', email: 'cesar.lovera@unal.edu.co'),
      Professor(id: 'prof_helga_d_a', name: 'Prof. Helga Duarte Amaya', department: 'Ingeniería', email: 'helga.duarte@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-201-DirCivil',
    number: '201',
    name: 'Dirección Dpto. Ingeniería Civil y Agrícola',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-202',
    number: '202',
    name: 'Aula 202',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_oscar_g_d', name: 'Prof. Óscar Germán Duarte Velasco', department: 'Ingeniería', email: 'oscar.duarte@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-203-LabBD',
    number: '203',
    name: 'Laboratorio de Bases de Datos y Sistemas de Información',
    floor: 'Piso 2',
  ),
  Room(
    id: '453-204',
    number: '204',
    name: 'Aula 204',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_javier_l_a', name: 'Prof. Javier Leonardo Araque Quijano', department: 'Ingeniería', email: 'javier.araque@unal.edu.co'),
      Professor(id: 'prof_sergio_r_r', name: 'Prof. Sergio Raúl Rivera Rodríguez', department: 'Ingeniería', email: 'sergio.rivera@unal.edu.co'),
    ],
  ),
  Room(id: '453-205', number: '205', name: 'Aula 205', floor: 'Piso 2'),
  Room(
    id: '453-206',
    number: '206',
    name: 'Aula 206',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_elizabeth_l', name: 'Prof. Elizabeth León Guzmán', department: 'Ingeniería', email: 'elizabeth.leon@unal.edu.co'),
      Professor(id: 'prof_frank_a_b', name: 'Prof. Frank Alexander Ballesteros Riveros', department: 'Ingeniería', email: 'frank.ballesteros@unal.edu.co'),
    ],
  ),
  Room(id: '453-207', number: '207', name: 'Aula 207', floor: 'Piso 2'),
  Room(
    id: '453-208',
    number: '208',
    name: 'Aula 208',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_jesus_a_d', name: 'Prof. Jesús Alberti Delgado Rivera', department: 'Ingeniería', email: 'jesus.delgado@unal.edu.co'),
      Professor(id: 'prof_javier_a_r', name: 'Prof. Javier Alveiro Rosero García', department: 'Ingeniería', email: 'javier.rosero@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-209-DirAreaSis',
    number: '209',
    name: 'Dirección Área Curricular de Ing. Sistemas e Industrial',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-210',
    number: '210',
    name: 'Aula 210',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_german_a_r', name: 'Prof. Germán Andrés Ramos Fuentes', department: 'Ingeniería', email: 'german.ramos@unal.edu.co'),
      Professor(id: 'prof_jhon_j_r', name: 'Prof. Jhon Jairo Ramírez Echeverry', department: 'Ingeniería', email: 'jhon.ramirez@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-211-MDLYGE',
    number: '211',
    name: 'Grupo de Investigación MDLYGE (Mecanismos de Desarrollo Limpio y Gestión Energética)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-212',
    number: '212',
    name: 'Aula 212',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_jesus_m_q', name: 'Prof. Jesús María Quintero Quintero', department: 'Ingeniería', email: 'jesus.quintero@unal.edu.co'),
      Professor(id: 'prof_eduardo_a_m', name: 'Prof. Eduardo Alirio Mojica Nava', department: 'Ingeniería', email: 'eduardo.mojica@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-213-LabInd',
    number: '213',
    name: 'Laboratorio de Ingeniería Industrial',
    floor: 'Piso 2',
  ),
  Room(id: '453-214', number: '214', name: 'Aula 214', floor: 'Piso 2'),
  Room(
    id: '453-PuertaMisteriosa',
    number: 'Puerta Misteriosa',
    name: 'Puerta Misteriosa', // Si es una oficina o aula, pon su nombre real.
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_oscar_j_p', name: 'Prof. Óscar Julián Perdomo Charry', department: 'Ingeniería', email: 'oscar.perdomo@unal.edu.co'),
      Professor(id: 'prof_camilo_a_c', name: 'Prof. Camilo Andrés Cortés Guerrero', department: 'Ingeniería', email: 'camilo.cortes@unal.edu.co'),
    ],
  ),
  Room(id: '453-215', number: '215', name: 'Aula 215', floor: 'Piso 2'),
  Room(
    id: '453-216',
    number: '216',
    name: 'Aula 216',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_ingrid_p_p', name: 'Prof. Ingrid Patricia Páez Parra', department: 'Ingeniería', email: 'ingrid.paez@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-217',
    number: '217',
    name: 'Aula 217',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_mario_a_p', name: 'Prof. Mario Alberto Pérez Rodríguez', department: 'Ingeniería', email: 'mario.perez@unal.edu.co'),
      Professor(id: 'prof_jesus_g_t', name: 'Prof. Jesús Guillermo Tovar Rache', department: 'Ingeniería', email: 'jesus.tovar@unal.edu.co'),
      Professor(id: 'prof_pedro_a_p', name: 'Prof. Pedro Agustín Pérez Torres', department: 'Ingeniería', email: 'pedro.perez@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-218',
    number: '218',
    name: 'Aula 218',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_francisco_m_o', name: 'Prof. Francisco Meluk Orozco', department: 'Ingeniería', email: 'francisco.meluk@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-220',
    number: '220',
    name: 'Aula 220',
    floor: 'Piso 2',
    professors: [
      Professor(id: 'prof_alfonso_h_j', name: 'Prof. Alfonso Herrera Jiménez', department: 'Ingeniería', email: 'alfonso.herrera@unal.edu.co'),
      Professor(id: 'prof_giovanni_m_p', name: 'Prof. Giovanni Muñoz Puerta', department: 'Ingeniería', email: 'giovanni.munoz@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-221-SalaPostSist',
    number: '221',
    name: 'Sala de Postgrados de Sistemas',
    floor: 'Piso 2',
  ),
  Room(
    id: '453-SalaDescanso',
    number: 'Sala Descanso',
    name: 'Sala de Descanso (Puertos de Carga, Máquina Expendedora)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-222-DirElec',
    number: '222',
    name: 'Dirección Ing. Eléctrica y Electrónica / Coordinación Curricular Eléctrica',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-224-LabSoft',
    number: '224',
    name: 'Laboratorio de Ingeniería de Software y Arquitectura de Hardware/Software',
    floor: 'Piso 2',
  ),
  Room(
    id: '453-SalaProfesores',
    number: 'Sala Profesores',
    name: 'Sala de Profesores',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-226-DirPostReg',
    number: '226',
    name: 'Dirección de Postgrados Registro y Programación Académica',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-228-OfiEstudiantes',
    number: '228',
    name: 'Oficina de Estudiantes',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: '453-230-AdminEdificio',
    number: '230',
    name: 'Administración del Edificio',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),

  // Piso 3
  Room(
    id: '453-300',
    number: '300',
    name: 'Aula 300',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_carlos_a_m', name: 'Prof. Carlos A. Martínez Riascos', department: 'Ingeniería', email: 'carlos.martinez@unal.edu.co'),
      Professor(id: 'prof_nestor_a_e', name: 'Prof. Néstor Algeciras Enciso', department: 'Ingeniería', email: 'nestor.algeciras@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-301-DirQuimicaAmb',
    number: '301',
    name: 'Dirección Dpto. Ingeniería Química y Ambiental',
    floor: 'Piso 3',
    isServiceRoom: true,
  ),
  Room(
    id: '453-302',
    number: '302',
    name: 'Aula 302',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_julio_c_v', name: 'Prof. Julio César Vargas Sáenz', department: 'Ingeniería', email: 'julio.vargas@unal.edu.co'),
      Professor(id: 'prof_mario_a_n', name: 'Prof. Mario Andrea Noriega Valencia', department: 'Ingeniería', email: 'mario.noriega@unal.edu.co'),
    ],
  ),
  Room(id: '453-303', number: '303', name: 'Aula 303', floor: 'Piso 3'),
  Room(
    id: '453-304',
    number: '304',
    name: 'Aula 304',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_hugo_a_h', name: 'Prof. Hugo Alberto Herrera Fonseca', department: 'Ingeniería', email: 'hugo.herrera@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-305-SalaLM',
    number: '305',
    name: 'Sala L.M. Broniewski',
    floor: 'Piso 3',
  ),
  Room(
    id: '453-306',
    number: '306',
    name: 'Aula 306',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_luis_c_b', name: 'Prof. Luis Carlos Belalcázar Cerón', department: 'Ingeniería', email: 'luis.belalcazar@unal.edu.co'),
      Professor(id: 'prof_gustavo_a_o', name: 'Prof. Gustavo Adolfo Orozco Alvarado', department: 'Ingeniería', email: 'gustavo.orozco@unal.edu.co'),
    ],
  ),
  Room(id: '453-307', number: '307', name: 'Aula 307', floor: 'Piso 3'),
  Room(
    id: '453-308',
    number: '308',
    name: 'Aula 308',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_jairo_e_p', name: 'Prof. Jairo Ernesto Perilla Perilla', department: 'Ingeniería', email: 'jairo.perilla@unal.edu.co'),
      Professor(id: 'prof_hugo_m_g', name: 'Prof. Hugo M. Galindo Valbuena', department: 'Ingeniería', email: 'hugo.galindo@unal.edu.co'),
    ],
  ),
  Room(id: '453-309', number: '309', name: 'Aula 309', floor: 'Piso 3'),
  Room(
    id: '453-310',
    number: '310',
    name: 'Aula 310',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_sofia_e_m', name: 'Prof. Sofía Esperanza Monroy Varela', department: 'Ingeniería', email: 'sofia.monroy@unal.edu.co'),
      Professor(id: 'prof_david_a_h', name: 'Prof. David Alberto Herrera Álvarez', department: 'Ingeniería', email: 'david.herrera@unal.edu.co'),
    ],
  ),
  Room(id: '453-311', number: '311', name: 'Aula 311', floor: 'Piso 3'),
  Room(
    id: '453-312',
    number: '312',
    name: 'Aula 312',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_jaime_l_a', name: 'Prof. Jaime León Aguilar Arias', department: 'Ingeniería', email: 'jaime.aguilar@unal.edu.co'),
      Professor(id: 'prof_armando_e_h', name: 'Prof. Armando Espinosa Hernández', department: 'Ingeniería', email: 'armando.espinosa@unal.edu.co'),
    ],
  ),
  Room(id: '453-313', number: '313', name: 'Aula 313', floor: 'Piso 3'),
  Room(
    id: '453-314',
    number: '314',
    name: 'Aula 314',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_dolly_s_b', name: 'Prof. Dolly Santos Barbosa', department: 'Ingeniería', email: 'dolly.santos@unal.edu.co'),
      Professor(id: 'prof_gabriel_e_r', name: 'Prof. Gabriel E. Rocha Camino', department: 'Ingeniería', email: 'gabriel.rocha@unal.edu.co'),
    ],
  ),
  Room(id: '453-315', number: '315', name: 'Aula 315', floor: 'Piso 3'),
  Room(
    id: '453-316',
    number: '316',
    name: 'Aula 316',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_rodrigo_j_p', name: 'Prof. Rodrigo Jiménez Pizarro', department: 'Ingeniería', email: 'rodrigo.jimenez@unal.edu.co'),
      Professor(id: 'prof_javier_a_d', name: 'Prof. Javier Andrea Dávila Rincón', department: 'Ingeniería', email: 'javier.davila@unal.edu.co'),
    ],
  ),
  Room(id: '453-317', number: '317', name: 'Aula 317', floor: 'Piso 3'),
  Room(
    id: '453-318',
    number: '318',
    name: 'Aula 318',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_juan_g_c', name: 'Prof. Juan G. Cadavid Estrada', department: 'Ingeniería', email: 'juan.cadavid@unal.edu.co'),
      Professor(id: 'prof_ivan_d_g', name: 'Prof. Ivan Darío Gil Chaves', department: 'Ingeniería', email: 'ivan.gil@unal.edu.co'),
    ],
  ),
  Room(id: '453-319', number: '319', name: 'Aula 319', floor: 'Piso 3'),
  Room(
    id: '453-320',
    number: '320',
    name: 'Aula 320',
    floor: 'Piso 3',
    professors: [
      Professor(id: 'prof_joger_e_o', name: 'Prof. Joger Eduardo Ortiz Triviño', department: 'Ingeniería', email: 'joger.ortiz@unal.edu.co'),
      Professor(id: 'prof_luis_a_b', name: 'Prof. Luis Alejandro Boyacá M.', department: 'Ingeniería', email: 'luis.boyaca@unal.edu.co'),
    ],
  ),

  // Piso 4
  Room(
    id: '453-400',
    number: '400',
    name: 'Aula 400',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_sonia_l_r', name: 'Prof. Sonia Lucía Rincón Prat', department: 'Ingeniería', email: 'sonia.rincon@unal.edu.co'),
      Professor(id: 'prof_nhora_a', name: 'Prof. Nhora Acuña', department: 'Ingeniería', email: 'nhora.acuna@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-401-DirMecatronica',
    number: '401',
    name: 'Dirección Dpto. Ingeniería Mecánica y Mecatrónica',
    floor: 'Piso 4',
    isServiceRoom: true,
  ),
  Room(
    id: '453-402',
    number: '402',
    name: 'Aula 402',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_luis_e_b', name: 'Prof. Luis E. Benítez Hernández', department: 'Ingeniería', email: 'luis.benitez@unal.edu.co'),
      Professor(id: 'prof_carlos_a_n', name: 'Prof. Carlos A. Narváez Tovar', department: 'Ingeniería', email: 'carlos.narvaez@unal.edu.co'),
    ],
  ),
  Room(id: '453-403', number: '403', name: 'Aula 403', floor: 'Piso 4'),
  Room(
    id: '453-404',
    number: '404',
    name: 'Aula 404',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_flavio_a_p', name: 'Prof. Flavio Augusto Prieto Ortiz', department: 'Ingeniería', email: 'flavio.prieto@unal.edu.co'),
      Professor(id: 'prof_victor_h_g', name: 'Prof. Víctor Hugo Grisales Palacio', department: 'Ingeniería', email: 'victor.grisales@unal.edu.co'),
    ],
  ),
  Room(id: '453-405', number: '405', name: 'Aula 405', floor: 'Piso 4'),
  Room(
    id: '453-406',
    number: '406',
    name: 'Aula 406',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_cesar_a_s', name: 'Prof. César Augusto Sánchez Correa', department: 'Ingeniería', email: 'cesar.sanchez@unal.edu.co'),
      Professor(id: 'prof_carlos_a_d', name: 'Prof. Carlos Alberto Duque Daza', department: 'Ingeniería', email: 'carlos.duque@unal.edu.co'),
    ],
  ),
  Room(id: '453-407', number: '407', name: 'Aula 407', floor: 'Piso 4'),
  Room(
    id: '453-408',
    number: '408',
    name: 'Aula 408',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_nicolas_g_p', name: 'Prof. Nicolás Giraldo Peralta', department: 'Ingeniería', email: 'nicolas.giraldo@unal.edu.co'),
      Professor(id: 'prof_adriana_f_s', name: 'Prof. Adriana Fernanda Sierra', department: 'Ingeniería', email: 'adriana.sierra@unal.edu.co'),
      Professor(id: 'prof_freddy_a_o', name: 'Prof. Freddy Alejandro Orjuela', department: 'Ingeniería', email: 'freddy.orjuela@unal.edu.co'),
    ],
  ),
  Room(id: '453-409', number: '409', name: 'Aula 409', floor: 'Piso 4'),
  Room(
    id: '453-410',
    number: '410',
    name: 'Aula 410',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_jaime_g_g', name: 'Prof. Jaime G. Guerrero Casariego', department: 'Ingeniería', email: 'jaime.guerrero@unal.edu.co'),
      Professor(id: 'prof_carlos_h_g', name: 'Prof. Carlos H. Galeano Urueña', department: 'Ingeniería', email: 'carlos.galeano@unal.edu.co'),
    ],
  ),
  Room(id: '453-411', number: '411', name: 'Aula 411', floor: 'Piso 4'),
  Room(
    id: '453-412',
    number: '412',
    name: 'Aula 412',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_maria_a_g', name: 'Prof. María Alejandra Guzmán Liz', department: 'Ingeniería', email: 'maria.guzman@unal.edu.co'),
      Professor(id: 'prof_karen_h_q', name: 'Prof. Karen Herrera Quintero', department: 'Ingeniería', email: 'karen.herrera@unal.edu.co'),
    ],
  ),
  Room(id: '453-413', number: '413', name: 'Aula 413', floor: 'Piso 4'),
  Room(
    id: '453-414',
    number: '414',
    name: 'Aula 414',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_juan_e_r', name: 'Prof. Juan Edilberto Rincón Pardo', department: 'Ingeniería', email: 'juan.rincon@unal.edu.co'),
      Professor(id: 'prof_oscar_y_s', name: 'Prof. Óscar Yesid Suárez Palacios', department: 'Ingeniería', email: 'oscar.suarez@unal.edu.co'),
    ],
  ),
  Room(id: '453-415', number: '415', name: 'Aula 415', floor: 'Piso 4'),
  Room(
    id: '453-416',
    number: '416',
    name: 'Aula 416',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_aldo_g_b', name: 'Prof. Aldo G. Benavides M.', department: 'Ingeniería', email: 'aldo.benavides@unal.edu.co'),
      Professor(id: 'prof_henry_o_c', name: 'Prof. Henry Octavio Cortés Ramos', department: 'Ingeniería', email: 'henry.cortes@unal.edu.co'),
    ],
  ),
  Room(id: '453-417', number: '417', name: 'Aula 417', floor: 'Piso 4'),
  Room(
    id: '453-418',
    number: '418',
    name: 'Aula 418',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_fernando_r', name: 'Prof. Fernando Rodríguez', department: 'Ingeniería', email: 'fernando.rodriguez@unal.edu.co'),
      Professor(id: 'prof_carlos_j_c', name: 'Prof. Carlos Julio Camacho López', department: 'Ingeniería', email: 'carlos.camacho@unal.edu.co'),
    ],
  ),
  Room(
    id: '453-419-420',
    number: '419-420',
    name: 'Aulas 419 y 420',
    floor: 'Piso 4',
    professors: [
      Professor(id: 'prof_alexander_g_m', name: 'Prof. Alexander Gómez Mejía', department: 'Ingeniería', email: 'alexander.gomez@unal.edu.co'),
    ],
  ),
];