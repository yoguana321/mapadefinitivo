import '/models/room.dart';
import '/models/professor.dart';

const String info453 = 'El Edificio GUILLERMINA URIBE BONE, conocido como Aulas de Ingeniería, es un centro académico dedicado a la enseñanza e investigación en diversas ramas de la ingeniería. Alberga aulas, laboratorios especializados, oficinas de dirección y docencia, y espacios para actividades académicas y administrativas.';
const String history453 = 'Nombrado en honor a GUILLERMINA URIBE BONE, la primera mujer egresada de la Facultad de Ingeniería de Bogotá. Su construcción se llevó a cabo entre 1969 y 1970 bajo la dirección del arquitecto Francisco Rojas Sánchez, con modificaciones posteriores en 1981 para mejorar su funcionalidad.';
const Map<String, String> hours453 = {}; // No hours provided in the text
const String contactInfo453 = 'Departamentos de Ingeniería (Eléctrica, Sistemas, Química, Civil, Mecánica). Coordinación de Mantenimiento.'; // Inferred from "Direcciones" and "Coordinaciones" sections


final List<Room> rooms453 = [
  // --- INFORMACIÓN GENERAL ---
  // Bebederos, puntos de carga, baños generales
  Room(id: '453-bebederos', number: 'General', name: 'Bebederos', floor: 'Múltiples pisos', isServiceRoom: true, category: 'Servicio'),
  Room(id: '453-puntos-carga', number: 'General', name: 'Puntos de Carga', floor: 'Múltiples pisos', isServiceRoom: true, category: 'Servicio'),
  Room(id: '453-banos-dcha-mujer', number: 'Baños', name: 'Baños Mujeres (Derecha entrada)', floor: 'Piso 1', isServiceRoom: true, category: 'Servicio'), // Assuming general entrance means Piso 1
  Room(id: '453-banos-fondo-hombres', number: 'Baños', name: 'Baños Hombres (Al fondo de entrada)', floor: 'Piso 1', isServiceRoom: true, category: 'Servicio'), // Assuming general entrance means Piso 1

  // Auditorios
  Room(id: '453-auditorio-a', number: 'Auditorio A', name: 'Auditorio A', floor: 'Múltiples pisos', isServiceRoom: false, category: 'Auditorio'),
  Room(id: '453-auditorio-b', number: 'Auditorio B', name: 'Auditorio B', floor: 'Múltiples pisos', isServiceRoom: false, category: 'Auditorio'),
  Room(id: '453-auditorio-c-antonio-maria-gomez-m', number: 'Auditorio C', name: 'Auditorio C Antonio María Gómez M', floor: 'Múltiples pisos', isServiceRoom: false, category: 'Auditorio'),

  // --- PISO 1 ---
  Room(id: '453-1-aula-100', number: '100', name: 'Aula 100', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-101', number: '101', name: 'Dirección Departamento de Sistemas e Industrial', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-1-sala-101a', number: '101A', name: 'Sala Multimedios Sistemas e Industrial', floor: 'Piso 1', isServiceRoom: false, category: 'Sala de Medios'),
  Room(id: '453-1-oficina-102', number: '102', name: 'Oficina de Profesores 102', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'hector_cifuentes_aya', name: 'Héctor Cifuentes Aya', department: 'Ingeniería'),
    Professor(id: 'luis_gerardo_astaiza_amado', name: 'Luis Gerardo Astaiza Amado', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-103', number: '103', name: 'Aula 103', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-104', number: '104', name: 'Oficina de Profesores 104', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jorge_eliecer_camargo_mendoza', name: 'Jorge Eliecer Camargo Mendoza', department: 'Ingeniería'),
    Professor(id: 'carlos_eduardo_moreno', name: 'Carlos Eduardo Moreno', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-105', number: '105', name: 'Aula 105', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-106', number: '106', name: 'Oficina de Profesores 106', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'juan_carlos_torres_pardo', name: 'Juan Carlos Torres Pardo', department: 'Ingeniería'),
    Professor(id: 'carlos_orlando_robles_roa', name: 'Carlos Orlando Robles Roa', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-107', number: '107', name: 'Aula 107', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-108', number: '108', name: 'Oficina de Profesores 108', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'ismael_castaneda_fuentes', name: 'Ismael Castañeda Fuentes', department: 'Ingeniería'),
    Professor(id: 'jonatan_gomez_perdomo', name: 'Jonatan Gómez Perdomo', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-109', number: '109', name: 'Aula 109', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-110', number: '110', name: 'Oficina de Profesores 110', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'joger_eduardo_ortiz_trivino', name: 'Joger Eduardo Ortiz Triviño', department: 'Ingeniería'),
    Professor(id: 'libia_denise_cangrejo_aljurr', name: 'Libia Denise Cangrejo Aljurr', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-111', number: '111', name: 'Aula 111', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-112', number: '112', name: 'Oficina de Profesores 112', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'cesar_augusto_pedraza_bonilla', name: 'Cesar Augusto Pedraza Bonilla', department: 'Ingeniería'),
    Professor(id: 'sandra_liliana_rojas_martinez', name: 'Sandra Liliana Rojas Martínez', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-113', number: '113', name: 'Aula 113', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-114', number: '114', name: 'Oficina de Profesores 114', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'fabio_augusto_gonzales_osorio', name: 'Fabio Augusto Gonzales Osorio', department: 'Ingeniería'),
    Professor(id: 'felipe_restrepo_calle', name: 'Felipe Restrepo Calle', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-aula-115', number: '115', name: 'Aula 115', floor: 'Piso 1', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-1-oficina-116', number: '116', name: 'Oficina de Profesores 116', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'edgar_miguel_vargas_c', name: 'Edgar Miguel Vargas C', department: 'Ingeniería'),
    Professor(id: 'feliz_antonio_cortes_aldana', name: 'Feliz Antonio Cortes Aldana', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-oficina-118', number: '118', name: 'Oficina de Profesores 118', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'luis_fernando_nino_vasquez', name: 'Luis Fernando Niño Vasquez', department: 'Ingeniería'),
    Professor(id: 'german_jairo_hernandez_perez', name: 'Germán Jairo Hernández Pérez', department: 'Ingeniería'),
  ]),
  Room(id: '453-1-unidad-informatica-119', number: '119', name: 'Unidad de Informática 119', floor: 'Piso 1', isServiceRoom: false, category: 'Centro de Cómputo'),
  Room(id: '453-1-oficina-120', number: '120', name: 'Oficina de Profesores 120', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jean_pierre_charlamos', name: 'Jean Pierre Charlamos', department: 'Ingeniería'),
    Professor(id: 'ivan_mauricio_rueda_caceres', name: 'Iván Mauricio Rueda Caceres', department: 'Ingeniería'),
  ]),

  // --- PISO 2 ---
  Room(id: '453-2-oficina-200', number: '200', name: 'Oficina de Profesores 200', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'cesar_manuel_lovera_cabrera', name: 'César Manuel Lovera Cabrera', department: 'Ingeniería'),
    Professor(id: 'helga_duarte_amaya', name: 'Helga Duarte Amaya', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-201', number: '201', name: 'Dirección de Departamento Ingeniería Civil y Agrícola', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-2-oficina-202', number: '202', name: 'Oficina de Profesor 202', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'oscar_german_duarte_velasco', name: 'Óscar Germán Duarte Velasco', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-lab-203', number: '203', name: 'Laboratorio de Bases de Datos y Sistemas de Información', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),
  Room(id: '453-2-oficina-204', number: '204', name: 'Oficina de Profesores 204', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'javier_leonardo_araque_quijano', name: 'Javier Leonardo Araque Quijano', department: 'Ingeniería'),
    Professor(id: 'sergio_raul_rivera_rodriguez', name: 'Sergio Raúl Rivera Rodríguez', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-aula-205', number: '205', name: 'Aula 205', floor: 'Piso 2', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-2-oficina-206', number: '206', name: 'Oficina de Profesores 206', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'elizabeth_leon_guzman', name: 'Elizabeth León Guzmán', department: 'Ingeniería'),
    Professor(id: 'frank_alexander_ballesteros_riveros', name: 'Frank Alexander Ballesteros Riveros', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-aula-207', number: '207', name: 'Aula 207 (Departamento de Ingeniería de Sistemas e Industrial - Investigación en Sistemas Inteligentes)', floor: 'Piso 2', isServiceRoom: false, category: 'Aula'),
  // Dedicated rooms/labs/groups listed in the image, associated with the department in 207
  Room(id: '453-2-lab-mindlab', number: 'Lab Mindlab', name: 'Laboratorio Mindlab: Investigación en Aprendizaje, Percepción y Descubrimiento Computacional', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),
  Room(id: '453-2-lab-lisi', number: 'Lab LISI', name: 'Laboratorio LISI: Investigación en Sistemas Inteligentes', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),
  Room(id: '453-2-grupo-griego', number: 'Grupo Griego', name: 'Grupo de Investigación en Gestión y Organizaciones (GRIEGO)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Grupo de Investigación'),
  Room(id: '453-2-grupo-angeosc', number: 'Grupo ANGeoSc', name: 'Grupo de Investigación en Geomántica (ANGeoSc)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Grupo de Investigación'),
  Room(id: '453-2-grupo-tlon', number: 'Grupo TLON', name: 'Grupo de Investigación en Redes de Telecomunicaciones Dinámicas & Lenguajes de Programación Distribuidos (TLON)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Grupo de Investigación'),
  Room(id: '453-2-grupo-algos', number: 'Grupo ALGOS', name: 'Grupo de Investigación en Algoritmos y Combinatoria (ALGOS)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Grupo de Investigación'),
  Room(id: '453-2-lab-unsecurelab', number: 'Lab UnSecureLab', name: 'Laboratorio UnSecureLab: Investigación en Ciberseguridad', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),

  Room(id: '453-2-oficina-208', number: '208', name: 'Oficina de Profesores 208', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jesus_alberti_delgsdi_rivera', name: 'Jesús Alberti Delgado Rivera', department: 'Ingeniería'),
    Professor(id: 'javier_alveiro_rosero_garcia', name: 'Javier Alveiro Rosero Garcia', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-209', number: '209', name: 'Dirección Área Curricular de Ingeniería Sistemas e Industrial', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-2-oficina-210', number: '210', name: 'Oficina de Profesores 210', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'german_andres_ramos_fuentes', name: 'Germán Andres Ramos Fuentes', department: 'Ingeniería'),
    Professor(id: 'jhon_jairo_ramirez_echeverry', name: 'Jhon Jairo Ramírez Echeverry', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-grupo-211', number: '211', name: 'MDLYGE Grupo de Investigación de Mecanismo de Desarrollo Limpio y Gestión Energética', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Grupo de Investigación'),
  Room(id: '453-2-oficina-212', number: '212', name: 'Oficina de Profesores 212', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jesus_maria_quintero_quintero', name: 'Jesus María Quintero Quintero', department: 'Ingeniería'),
    Professor(id: 'eduardo_alirio_mojica_nava', name: 'Eduardo Alirio Mojica Nava', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-lab-213', number: '213', name: 'Laboratorio de Ingeniería Industrial', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),
  Room(id: '453-2-aula-214', number: '214', name: 'Aula 214', floor: 'Piso 2', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-2-oficina-puerta-misteriosa', number: 'Puerta Misteriosa', name: 'Oficina Puerta Misteriosa', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'oscar_julian_perdomo_charry', name: 'Óscar Julián Perdomo Charry', department: 'Ingeniería'),
    Professor(id: 'camilo_andres_cortes_guerrero', name: 'Camilo Andres Cortes Guerrero', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-215', number: '215', name: 'Oficina de Profesores 215', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'fernando_salazar_delgado', name: 'Fernando Salazar Delgado', department: 'Ingeniería'),
    Professor(id: 'carlos_julio_lozano_piedrahita', name: 'Carlos Julio Lozano Piedrahita', department: 'Ingeniería'),
    Professor(id: 'jeisson_andres_vergara_vargas', name: 'Jeisson Andrés Vergara Vargas', department: 'Ingeniería'),
    Professor(id: 'jorge_enrique_amaya_cala', name: 'Jorge Enrique Amaya Cala', department: 'Ingeniería'),
    Professor(id: 'juan_carlos_aldana_bernal', name: 'Juan Carlos Aldana Bernal', department: 'Ingeniería'),
    Professor(id: 'juan_carlos_torres_pardo_215', name: 'Juan Carlos Torres Pardo', department: 'Ingeniería'), // Duplicated name, different office
    Professor(id: 'michael_silva_cruz', name: 'Michael Silva Cruz', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-216', number: '216', name: 'Oficina de Profesor 216', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'ingrid_patricia_paez_parra', name: 'Ingrid Patricia Paez Parra', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-217', number: '217', name: 'Oficina de Profesores 217', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'mario_alberto_perez_rodriguez', name: 'Mario Alberto Pérez Rodríguez', department: 'Ingeniería'),
    Professor(id: 'jesus_guillermo_tovar_rache', name: 'Jesús Guillermo Tovar Rache', department: 'Ingeniería'),
    Professor(id: 'pedro_agustin_perez_torres', name: 'Pedro Agustín Pérez Torres', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-218', number: '218', name: 'Oficina de Profesor 218', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'francisco_meluk_orozco', name: 'Francisco Meluk Orozco', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-oficina-220', number: '220', name: 'Oficina de Profesores 220', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'alfonso_herrera_jimenez', name: 'Alfonso Herrera Jiménez', department: 'Ingeniería'),
    Professor(id: 'giovanni_munoz_puerta', name: 'Giovanni Munoz Puerta', department: 'Ingeniería'),
  ]),
  Room(id: '453-2-sala-posgrados-sistemas-221', number: '221', name: 'Sala de Postgrados de Sistemas', floor: 'Piso 2', isServiceRoom: false, category: 'Sala de Estudio'),
  Room(id: '453-2-sala-descanso', number: 'General', name: 'Sala de Descanso (con puertos de carga y máquina expendedora)', floor: 'Piso 2', isServiceRoom: true, category: 'Zona de Descanso'),
  Room(id: '453-2-oficina-222', number: '222', name: 'Dirección Ingeniería Eléctrica y Electrónica - Coordinación Curricular Eléctrica', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-2-lab-224', number: '224', name: 'Laboratorio de Ingeniería de Software y Arquitectura de Hardware y Software', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorio'),
  Room(id: '453-2-sala-profesores', number: 'Sala Profesores', name: 'Sala de Profesores (Piso 2)', floor: 'Piso 2', isServiceRoom: false, category: 'Sala de Profesores'),
  Room(id: '453-2-oficina-226', number: '226', name: 'Dirección de Postgrados, Registro y Programación Académica', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina Administrativa'),
  Room(id: '453-2-oficina-228', number: '228', name: 'Oficina de Estudiantes', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina Administrativa'),
  Room(id: '453-2-oficina-230', number: '230', name: 'Administración del Edificio', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina Administrativa'),

  // --- PISO 3 ---
  Room(id: '453-3-oficina-300', number: '300', name: 'Oficina de Profesores 300', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'carlos_a_martinez_riascos', name: 'Carlos A Martínez Riascos', department: 'Ingeniería'),
    Professor(id: 'nestor_algeciras_enciso', name: 'Néstor Algeciras Enciso', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-oficina-301', number: '301', name: 'Dirección de Departamento Ingeniería Química y Ambiental', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-3-oficina-302', number: '302', name: 'Oficina de Profesores 302', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'julio_cesar_vargas_saenz', name: 'Julio Cesar Vargas Sáenz', department: 'Ingeniería'),
    Professor(id: 'mario_andrea_noriega_valencia', name: 'Mario Andrea Noriega Valencia', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-303', number: '303', name: 'Aula 303', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-304', number: '304', name: 'Oficina de Profesor 304', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'hugo_alberto_herrera_fonseca', name: 'Hugo Alberto Herrera Fonseca', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-sala-305', number: '305', name: 'Sala L.M Broniewski', floor: 'Piso 3', isServiceRoom: false, category: 'Sala de Reuniones'),
  Room(id: '453-3-oficina-306', number: '306', name: 'Oficina de Profesores 306', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'luis_carlos_belalcazar_ceron', name: 'Luis Carlos Belalcázar Cerón', department: 'Ingeniería'),
    Professor(id: 'gustavo_adolfo_orozco_alvarado', name: 'Gustavo Adolfo Orozco Alvarado', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-307', number: '307', name: 'Aula 307', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-308', number: '308', name: 'Oficina de Profesores 308', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jairo_ernesto_perilla_perilla', name: 'Jairo Ernesto Perilla Perilla', department: 'Ingeniería'),
    Professor(id: 'hugo_m_galindo_valbuena', name: 'Hugo M. Galindo Valbuena', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-309', number: '309', name: 'Aula 309', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-310', number: '310', name: 'Oficina de Profesores 310', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'sofia_esperanza_monroy_varela', name: 'Sofía Esperanza Monroy Varela', department: 'Ingeniería'),
    Professor(id: 'david_alberto_herrera_alvarez', name: 'David Alberto Herrera Alvarez', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-311', number: '311', name: 'Aula 311', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-312', number: '312', name: 'Oficina de Profesores 312', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jaime_leon_aguilar_arias', name: 'Jaime León Aguilar Arias', department: 'Ingeniería'),
    Professor(id: 'armando_espinosa_hernandez', name: 'Armando Espinosa Hernández', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-313', number: '313', name: 'Aula 313', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-314', number: '314', name: 'Oficina de Profesores 314', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'dolly_santos_barbosa', name: 'Dolly Santos Barbosa', department: 'Ingeniería'),
    Professor(id: 'gabriel_e_rocha_camino', name: 'Gabriel E Rocha Camino', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-315', number: '315', name: 'Aula 315', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-316', number: '316', name: 'Oficina de Profesores 316', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'rodrigo_jimenez_pizarro', name: 'Rodrigo Jiménez Pizarro', department: 'Ingeniería'),
    Professor(id: 'javier_andrea_davila_rincon', name: 'Javier Andrea Dávila Rincón', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-317', number: '317', name: 'Aula 317', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-318', number: '318', name: 'Oficina de Profesores 318', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'juan_g_cadavid_estrada', name: 'Juan G Cadavid Estrada', department: 'Ingeniería'),
    Professor(id: 'ivan_dario_gil_chaves', name: 'Ivan Dario Gil Chaves', department: 'Ingeniería'),
  ]),
  Room(id: '453-3-aula-319', number: '319', name: 'Aula 319', floor: 'Piso 3', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-3-oficina-320', number: '320', name: 'Oficina de Profesores 320', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'juan_carlos_serrato_bermudez', name: 'Juan Carlos Serrato Bermúdez', department: 'Ingeniería'),
    Professor(id: 'luis_alejandro_boyaca_m', name: 'Luis Alejandro Boyaca M', department: 'Ingeniería'),
  ]),

  // --- PISO 4 ---
  Room(id: '453-4-oficina-400', number: '400', name: 'Oficina de Profesores 400', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'sonia_lucia_rincon_prat', name: 'Sonia Lucía Rincón Prat', department: 'Ingeniería'),
    Professor(id: 'nhora_acuna', name: 'Nhora Acuña', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-oficina-401', number: '401', name: 'Dirección de Departamento Ingeniería Mecánica y Mecatrónica', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Dirección'),
  Room(id: '453-4-oficina-402', number: '402', name: 'Oficina de Profesores 402', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'luis_en_benitez_hernandez', name: 'Luis En Benítez Hernández', department: 'Ingeniería'),
    Professor(id: 'carlos_a_narvaez_tovar', name: 'Carlos A Narváez Tovar', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-403', number: '403', name: 'Aula 403', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-404', number: '404', name: 'Oficina de Profesores 404', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'flavio_augusto_prieto_ortiz', name: 'Flavio Augusto Prieto Ortiz', department: 'Ingeniería'),
    Professor(id: 'victor_hugo_grisales_palacio', name: 'Víctor Hugo Grisales Palacio', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-405', number: '405', name: 'Aula 405', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-406', number: '406', name: 'Oficina de Profesores 406', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'cesar_augusto_sanchez_correa', name: 'César Augusto Sánchez Correa', department: 'Ingeniería'),
    Professor(id: 'carlos_alberto_duque_daza', name: 'Carlos Alberto Duque Daza', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-407', number: '407', name: 'Aula 407', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-408', number: '408', name: 'Oficina de Profesores 408', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'nicolas_giraldo_peralta', name: 'Nicolás Giraldo Peralta', department: 'Ingeniería'),
    Professor(id: 'adriana_fernanda_sierra', name: 'Adriana Fernanda Sierra', department: 'Ingeniería'),
    Professor(id: 'freddy_alejandro_orjuela', name: 'Freddy Alejandro Orjuela', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-409', number: '409', name: 'Aula 409', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-410', number: '410', name: 'Oficina de Profesores 410', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jaime_g_guerrero_casariego', name: 'Jaime G Guerrero Casariego', department: 'Ingeniería'),
    Professor(id: 'carlos_he_galeano_uruena', name: 'Carlos He Galeano Urueña', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-411', number: '411', name: 'Aula 411', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-412', number: '412', name: 'Oficina de Profesores 412', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'maria_alejandra_guzman_liz', name: 'María Alejandra Guzmán Liz', department: 'Ingeniería'),
    Professor(id: 'karen_herrera_quintero', name: 'Karen Herrera Quintero', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-413', number: '413', name: 'Aula 413', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-414', number: '414', name: 'Oficina de Profesores 414', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'juan_edilberto_rincon_pardo', name: 'Juan Edilberto Rincón Pardo', department: 'Ingeniería'),
    Professor(id: 'oscar_yesid_suarez_palacios', name: 'Óscar Yesid Suárez Palacios', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-415', number: '415', name: 'Aula 415', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-416', number: '416', name: 'Oficina de Profesores 416', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'aldo_g_benavides_m', name: 'Aldo G Benavides M', department: 'Ingeniería'),
    Professor(id: 'henry_octavio_cortes_ramos', name: 'Henry Octavio Cortés Ramos', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-aula-417', number: '417', name: 'Aula 417', floor: 'Piso 4', isServiceRoom: false, category: 'Aula'),
  Room(id: '453-4-oficina-418', number: '418', name: 'Oficina de Profesores 418', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'fernando_rodriguez', name: 'Fernando Rodríguez', department: 'Ingeniería'),
    Professor(id: 'carlos_julios_camacho_lopez', name: 'Carlos Julios Camacho López', department: 'Ingeniería'),
  ]),
  Room(id: '453-4-oficina-419-420', number: '419-420', name: 'Oficina de Profesor 419-420', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'alexander_gomez_mejia', name: 'Alexander Gómez Mejía', department: 'Ingeniería'),
  ]),
];

// No special services explicitly identified beyond general facilities already integrated into rooms453.
final List<Room> specialServices453 = [];