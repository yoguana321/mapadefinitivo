import '/models/room.dart';
import '/models/professor.dart';

const String info451 = 'El Edificio 451, sede de la Facultad de Química, es un importante centro de investigación y docencia. Alberga una amplia gama de laboratorios especializados, aulas de clase, oficinas de docentes y espacios para seminarios.';
const String history451 = 'Es parte del patrimonio arquitectónico de la universidad y ha sido objeto de proyectos de conservación y activación cultural. El edificio fue concebido como sede para laboratorios, aulas y espacios de investigación en química, botánica y zoología, heredando la tradición científica de José Celestino Mutis.';
const Map<String, String> hours451 = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 14:00',
  'Domingo': 'Cerrado',
};
const String contactInfo451 = 'Contacto: Secretaría del Departamento de Química. \nTeléfono: Por definir.';


final List<Room> rooms451 = [
  // --- PISO -1 ---
  Room(id: '451-s1-lab-quimica', number: 'Laboratorio', name: 'Laboratorio de química computacional y bioinformática', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-120', number: '120', name: 'Laboratorio de macromoléculas', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-cindenic-122', number: '122', name: 'CINDENIC Planta 1', floor: 'Piso -1', isServiceRoom: false, description: 'Sede de PICTNICS', category: 'Centros de Investigación'), // Cambiado
  Room(id: '451-s1-cindenic-124', number: '124', name: 'CINDENIC Planta 2', floor: 'Piso -1', isServiceRoom: false, description: 'Sede de PICTNICS', category: 'Centros de Investigación'), // Cambiado
  Room(id: '451-s1-lab-125', number: '125', name: 'Lab- DRES (Diseño y reactividad de estructuras sólidas)', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-126', number: '126', name: 'Laboratorio de fisicoquímica aplicada', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-128', number: '128', name: 'Laboratorio de bioprospeccion de compuestos volátiles', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-129', number: '129', name: 'Laboratorio de polímeros y coloides', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-130', number: '130', name: 'Laboratorio de compuestos de coordinación', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-131', number: '131', name: 'Laboratorio de fluidos presurizados', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-132', number: '132', name: 'Laboratorio de química de alimentos', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-133b', number: '133B', name: 'Laboratorio de biocombustibles - Grupo APRENA', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-lab-135', number: '135', name: 'Laboratorio de macromoléculas', floor: 'Piso -1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-s1-taller', number: '136', name: 'Taller de mantenimiento y de mecánica', floor: 'Piso -1', isServiceRoom: true, category: 'Servicios'), // Cambiado de 'Taller' a 'Servicios'
  Room(id: '451-s1-banos', number: 'Baños', name: 'Baños mixtos', floor: 'Piso -1', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-s1-usg', number: '145', name: 'USG (Manejo, almacenamiento y gestión de sustancias químicas)', floor: 'Piso -1', isServiceRoom: true, category: 'Servicios'), // Cambiado de 'Almacén' a 'Servicios'

  // --- PISO 1 ---
  Room(id: '451-1-oficina-104', number: '104', name: 'Dirección de Química', floor: 'Piso 1', isServiceRoom: false, category: 'Oficinas Administrativas'), // Cambiado de 'Dirección' a 'Oficinas Administrativas'
  Room(id: '451-1-oficina-102', number: '102', name: 'Programas Curriculares', floor: 'Piso 1', isServiceRoom: false, category: 'Oficinas Académicas'), // Cambiado de 'Oficina Administrativa' a 'Oficinas Académicas'
  Room(id: '451-1-fotocopiadoras', number: '101', name: 'Fotocopiadoras', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-1-banos', number: 'Baños', name: 'Baños de mujeres y hombres', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-1-oficina-109', number: '109', name: 'Oficina de Profesores 109', floor: 'Piso 1', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'rodolfo_quevedo', name: 'Rodolfo Quevedo P.', department: 'Química'),
    Professor(id: 'manuel_molina', name: 'Manuel Fredy Molina Caballero', department: 'Química'),
  ],),
  Room(id: '451-1-aula-113', number: '113', name: 'Aula Máxima Luis Montoya Valenzuela', floor: 'Piso 1', isServiceRoom: false, category: 'Auditorios'), // Cambiado
  Room(id: '451-1-lab-149', number: '149', name: 'Laboratorio Fisicoquímica', floor: 'Piso 1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-1-lab-151', number: '151', name: 'Lab Álvaro Cortes Burschi - Química General', floor: 'Piso 1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-1-lab-153', number: '153', name: 'Laboratorio Rayos X', floor: 'Piso 1', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-1-salon-100-1', number: '100-1', name: 'Salón Seminarios Combustible', floor: 'Piso 1', isServiceRoom: false, category: 'Salas de Reuniones'), // Cambiado de 'Salón de Seminarios' a 'Salas de Reuniones'

  // --- PISO 2 ---
  Room(id: '451-2-oficina-202-general', number: 'Oficina 202', name: 'Oficina 202 (General)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficinas Administrativas'), // Cambiado de 'Oficina' a 'Oficinas Administrativas'
  Room(id: '451-2-oficina-202-1', number: 'Oficina 202-1', name: 'Oficina 202-1', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jaime_alberto_rios_motta', name: 'Jaime Alberto Rios Motta', department: 'Química'),
    Professor(id: 'mauricio_maldonado_villamil', name: 'Mauricio Maldonado Villamil', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-2', number: 'Oficina 202-2', name: 'Oficina 202-2', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'gina_marcela_hincapie_trivino', name: 'Gina Marcela Hincapié Trivino', department: 'Química'),
    Professor(id: 'sara_luz_gomez_maya', name: 'Sara Luz Gómez Maya', department: 'Química'),
    Professor(id: 'francisco_nunez_zarur', name: 'Francisco Núñez Zarur', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-3', number: 'Oficina 202-3', name: 'Oficina 202-3', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'martha_nancy_calderon_ozuna', name: 'Martha Nancy Calderon Ozuna', department: 'Química'),
    Professor(id: 'angela_graciela_torres_rodriguez', name: 'Angela Graciela Torres Rodriguez', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-carolina', number: 'Oficina 202', name: 'Oficina 202 (Carolina Blanco)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficinas Administrativas', professors: [ // Cambiado de 'Oficina' a 'Oficinas Administrativas'
    Professor(id: 'carolina_blanco', name: 'Carolina Blanco', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-6', number: 'Oficina 202-6', name: 'Oficina 202-6 (Coordinación de Extensión)', floor: 'Piso 2', isServiceRoom: false, category: 'Oficinas Académicas', professors: [ // Cambiado de 'Coordinación' a 'Oficinas Académicas'
    Professor(id: 'carlos_daza', name: 'Carlos Daza', department: 'Química'),
    Professor(id: 'leon_perez', name: 'León Pérez', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-7', number: 'Oficina 202-7', name: 'Oficina 202-7', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'andrea_alvarez_moreno', name: 'Andrea Álvarez Moreno', department: 'Química'),
    Professor(id: 'juan_alberto_torres_luna', name: 'Juan Alberto Torres Luna', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-8', number: 'Oficina 202-8', name: 'Oficina 202-8', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'ruth_garzon_fernandez', name: 'Ruth Garzón Fernández', department: 'Química'),
    Professor(id: 'jose_miguel_villarreal_ascencio', name: 'José Miguel Villarreal Ascencio', department: 'Química'),
  ]),
  Room(id: '451-2-oficina-202-9', number: '202-9', name: 'Oficina 202-9', floor: 'Piso 2', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'yeimer_herrera', name: 'Yeimer Herrera', department: 'Química'),
    Professor(id: 'liliana_giraldo_g', name: 'Liliana Giraldo G.', department: 'Química'),
  ]),
  Room(id: '451-2-deposito-direccion', number: 'Depósito', name: 'Depósito Dirección (Piso 2)', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'), // Cambiado de 'Depósito' a 'Servicios'

  Room(id: '451-2-banos-h', number: 'Baños', name: 'Baños de hombres', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-2-lab-239', number: '239', name: 'Laboratorio de computación cuántica', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-243', number: '243', name: 'Laboratorio Guillermo Campo 4', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-241', number: '241', name: 'Laboratorio de química general', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-salon-200-1', number: '200-1', name: 'Salón de seminarios bioquímica', floor: 'Piso 2', isServiceRoom: false, category: 'Salas de Reuniones'), // Cambiado de 'Salón de Seminarios' a 'Salas de Reuniones'
  Room(id: '451-2-banos-myh', number: 'Baños', name: 'Baños de mujeres y hombres', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-2-banos-m', number: 'Baños', name: 'Baños de mujeres', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-2-lab-232', number: '232', name: 'Lab Química Analítica - Cromatografía de gases y HLPC', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-233', number: '233', name: 'Laboratorio de equipos comunes', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-quimica-agricola', number: 'Laboratorio', name: 'Laboratorio Química Agrícola', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-203', number: '203', name: 'Lab Arcillas Materiales Cerámicos y Vítreos', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-salon-204', number: '204', name: 'Salón Sven Zethelius', floor: 'Piso 2', isServiceRoom: false, category: 'Salones Especiales'), // Cambiado de 'Salón de Eventos' a 'Salones Especiales'
  Room(id: '451-2-lab-205', number: '205', name: 'Lab Análisis Residuos de Plaguicidas y Jairo A Guerrero', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-posgrados', number: '206', name: 'Oficina de Posgrados', floor: 'Piso 2', isServiceRoom: false, category: 'Oficinas Académicas'), // Cambiado de 'Oficina Administrativa' a 'Oficinas Académicas'
  Room(id: '451-2-lab-207', number: '207', name: 'Lab Instrumental Análisis de Residuos de Plaguicidas', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-208', number: '208', name: 'Lab Estudio de Actividades Metabólicas Vegetales', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-210', number: '210', name: 'Química de hongos, macromicetos', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-212', number: '212', name: 'Lab Química de Hongos Macromicetos', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-213', number: '213', name: 'Lab Microbiología Ambiental y Aplicada', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-214', number: '214', name: 'Lab Química de Hongos Macromicetos', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-217-215', number: '217-215', name: 'Lab de Calorimetría y Dinámica Química no Lineal', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-218', number: '218', name: 'Lab Síntesis de Compuestos Heterocíclicos', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-219', number: '219', name: 'Lab Química Ambiental', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-220', number: '220', name: 'Lab Química Analítica Espectrofotometría Ultravioleta/Visible', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-221', number: '221', name: 'Lab Química Analítica Preparación de Muestras', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-oficina-222', number: '222', name: 'Grupo de Investigación de Química Heterocíclica (GIQH)', floor: 'Piso 2', isServiceRoom: false, category: 'Centros de Investigación'), // Cambiado de 'Oficina de Grupo de Investigación' a 'Centros de Investigación'
  Room(id: '451-2-lab-223', number: '223', name: 'Lab Química Analítica', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-224', number: '224', name: 'Lab Química Espectrofotometría Infrarroja', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-226', number: '226', name: 'Lab Química Espectrofotometría Absorción Atómica', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-228', number: '228', name: 'Lab de Residuos de Plaguicidas', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-230', number: '230', name: 'Lab Electroquímica', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2-lab-229-231', number: '229-231', name: 'Lab Química Agrícola', floor: 'Piso 2', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-2a-biblioteca', number: 'Biblioteca', name: 'Biblioteca Antonio García Banus', floor: 'Piso 2A', isServiceRoom: false, category: 'Biblioteca'), // Mantenido

  // --- PISO 3 ---
  Room(id: '451-3-deposito-302-1', number: '302-1', name: 'Depósito Dirección (Piso 3)', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'), // Cambiado de 'Depósito' a 'Servicios'
  Room(id: '451-3-oficina-302-2', number: '302-2', name: 'Oficina 302-2', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'nicolas_hernandez_guarin', name: 'Nicolás Hernández Guarin', department: 'Química'),
  ]),
  Room(id: '451-3-oficina-302-3', number: '302-3', name: 'Oficina 302-3', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'jose_leopoldo_rojas_a', name: 'JOSÉ LEOPOLDO ROJAS A.', department: 'Química'),
  ]),
  Room(id: '451-3-oficina-302-4', number: '302-4', name: 'Oficina 302-4', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'liliam_a_palomeque_f', name: 'Liliam A. Palomeque F.', department: 'Química'),
  ]),
  Room(id: '451-3-oficina-302-5', number: '302-5', name: 'Oficina 302-5', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'edgar_delgado_m', name: 'Edgar Delgado M.', department: 'Química'),
  ]),
  Room(id: '451-3-oficina-302-6', number: '302-6', name: 'Oficina 302-6', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'cristian_ochoa_p', name: 'CRISTIAN OCHOA P.', department: 'Química'),
  ]),
  Room(id: '451-3-oficina-302-7', number: '302-7', name: 'Oficina 302-7', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'esco_modiguez_b', name: 'Esco Modiguez-B.', department: 'Química'),
  ]),
  Room(id: '451-3-salon-marcel-ewert', number: '302-8', name: 'Salón Marcel Ewert', floor: 'Piso 3', isServiceRoom: false, category: 'Salones Especiales'), // Cambiado de 'Salón de Eventos' a 'Salones Especiales'
  Room(id: '451-3-oficina-302-9', number: '302-9', name: 'Oficina 302-9', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'yeimer_herrera_giraldo', name: 'Yeimer Herrera', department: 'Química'),
    Professor(id: 'liliana_giraldo_g', name: 'Liliana Giraldo G.', department: 'Química'),
  ]),
  Room(id: '451-3-lab-343-345', number: '343-345', name: 'Laboratorio Química Orgánica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-341', number: '341', name: 'Lab Biomembranas y Grupo de Investigación Bioquímica y Biología Molecular de las Microbacterias', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-banos', number: 'Baños', name: 'Baños de hombres y mujeres', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-3-lab-336', number: '336', name: 'Laboratorio 336', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-334', number: '334', name: 'Lab Grupo Síntesis y Aplicación Peptídicas', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-333', number: '333', name: 'Lab Química Analítica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios', description: 'Análisis cualitativo y cuantitativo.'), // Cambiado
  Room(id: '451-3-lab-331', number: '331', name: 'Lab Química Analítica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-330-329', number: '330-329', name: 'Laboratorio de Bioquímica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-327', number: '327', name: 'LCH Aplicaciones Fisicoquímicas del Estado Sólido', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-oficina-326', number: '326', name: 'Oficina de Profesores 326', floor: 'Piso 3', isServiceRoom: false, category: 'Oficina de Profesores', professors: [
    Professor(id: 'paula_andrea_cuervo', name: 'Paula Andrea Cuervo Prada', department: 'Química'),
    Professor(id: 'marta_lucia_serrano', name: 'Marta Lucia Serrano Lopez', department: 'Química'),
    Professor(id: 'mauricio_urquiza', name: 'Mauricio Urquiza Martinez', department: 'Química'),
  ],),
  Room(id: '451-3-lab-325', number: '325', name: 'Lab de Extensión y Asesoría', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-324', number: '324', name: 'Lab Alimentos Funcionales', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-322', number: '322', name: 'Lab Fisicoquímica Electroquímica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-317', number: '317', name: 'Lab Química Analítica', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios', description: 'Análisis cuantitativo y cualitativo.'), // Cambiado
  Room(id: '451-3-oficina-316', number: '316', name: 'Grupo de Estudios en Síntesis y Aplicaciones de Compuestos Heterocíclicos (GESACH)', floor: 'Piso 3', isServiceRoom: false, category: 'Centros de Investigación'), // Cambiado de 'Oficina de Grupo de Investigación' a 'Centros de Investigación'
  Room(id: '451-3-lab-315', number: '315', name: 'Lab Química Analítica A', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-313', number: '313', name: 'Laboratorio de Ecología Química', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-oficina-311', number: '311', name: 'Grupo de Aditivos Naturales de Aroma y Color (GANAC)', floor: 'Piso 3', isServiceRoom: false, category: 'Centros de Investigación'), // Cambiado de 'Oficina de Grupo de Investigación' a 'Centros de Investigación'
  Room(id: '451-3-lab-308', number: '308', name: 'Lab Fullerenos', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
  Room(id: '451-3-lab-309', number: '309', name: 'Aplicaciones Analíticas de Compuestos Orgánicos (AACO)', floor: 'Piso 3', isServiceRoom: false, category: 'Laboratorios'), // Cambiado

  // --- PISO 4 ---
  Room(id: '451-4-oficina-403', number: '403', name: 'Oficina de Profesor 403', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'humberto_mayorga', name: 'Humberto Mayorga Wandurraga', department: 'Química')],),
  Room(id: '451-4-oficina-405', number: '405', name: 'Oficina de Profesores 405', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'pedro_filipe', name: 'Pedro Filipe de Brito Brandao', department: 'Química'), Professor(id: 'adrian_sandoval', name: 'Adrian Gabriel Sandoval Hernandez', department: 'Química')],),
  Room(id: '451-4-oficina-407', number: '407', name: 'Oficina de Profesores 407', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'ana_burgos', name: 'Ana Esperanza Burgos C', department: 'Química'), Professor(id: 'pedro_hernandez', name: 'Pedeo J Hernandez C', department: 'Química')],),
  Room(id: '451-4-oficina-409', number: '409', name: 'Oficina de Profesores 409', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'zuly_rivera', name: 'Zuly Jenny Rivera Monroy', department: 'Química'), Professor(id: 'ivonne_cubillos', name: 'Ivonne Cubillos Gonzales', department: 'Química'), Professor(id: 'gilma_granados', name: 'Gilma Granados Oliveros', department: 'Química')],),
  Room(id: '451-4-oficina-411', number: '411', name: 'Oficina de Profesores 411', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'diana_sinuco', name: 'Diana Cristina Sinuco', department: 'Química'), Professor(id: 'coco_okio', name: 'Coco Okio', department: 'Química')],),
  Room(id: '451-4-oficina-413', number: '413', name: 'Oficina de Profesores 413', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'eliseo_avella', name: 'Eliseo Avella Moreno', department: 'Química'), Professor(id: 'alvaro_duarte', name: 'Alvaro Duarte Ruiz', department: 'Química')],),
  Room(id: '451-4-oficina-415', number: '415', name: 'Oficina de Profesores 415', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'carlos_soto', name: 'Carlos Yesid Soto Ospina', department: 'Química'), Professor(id: 'josue_clavijo', name: 'Josue Itsman Clavijo', department: 'Química')],),
  Room(id: '451-4-oficina-417', number: '417', name: 'Oficina de Profesores 417', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'jorge_gomez', name: 'Jorge Henrique Gomez Lopes', department: 'Química'), Professor(id: 'diana_farias', name: 'Diana Maria Farias Camero', department: 'Química'), Professor(id: 'fabian_orozco', name: 'Fabian Orozco', department: 'Química')],),
  Room(id: '451-4-oficina-419', number: '419', name: 'Oficina de Profesores 419', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'luis_moreno', name: 'Luis C Moreno A', department: 'Química'), Professor(id: 'leon_velasquez', name: 'Leon Mauricio Velasquez M', department: 'Química')],),
  Room(id: '451-4-oficina-421', number: '421', name: 'Oficina de Profesores 421', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'fabian_parada', name: 'Fabian Parada Alfonso', department: 'Química'), Professor(id: 'l_guillermo_sarmiento', name: 'L Guillermo Sarmiento A', department: 'Química'), Professor(id: 'andrea_sandoval', name: 'Andrea Del Pilar Sandoval Rojas', department: 'Química')],),
  Room(id: '451-4-oficina-423', number: '423', name: 'Oficina de Profesoras 423', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'luz_mary_salazar', name: 'Luz Mary Salazar P', department: 'Química'), Professor(id: 'astrid_garzon', name: 'Astrid Garzon', department: 'Química')],),
  Room(id: '451-4-banos-hm', number: 'Baños', name: 'Baños de hombres y mujeres', floor: 'Piso 4', isServiceRoom: true, category: 'Servicios'), // Cambiado
  Room(id: '451-4-oficina-425', number: '425', name: 'Oficina de Profesores 425', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'monica_avila', name: 'Monica Constanza Avila Murillo', department: 'Química'), Professor(id: 'carolina_chegwin', name: 'Carolina Chegwin Angarita', department: 'Química'), Professor(id: 'patricia_martinez', name: 'Patricia Martinez M', department: 'Química')],),
  Room(id: '451-4-oficina-427', number: '427', name: 'Oficina de Profesores 427', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'wilman_delgado', name: 'Wilman Delgado', department: 'Química'), Professor(id: 'freddy_ramos', name: 'Freddy Alejando Ramos R', department: 'Química'), Professor(id: 'leonardo_castellanos', name: 'Leonardo Castellanos H', department: 'Química')],),
  Room(id: '451-4-oficina-429', number: '429', name: 'Oficina de Profesores 429', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'coralia_osorio', name: 'Coralia Osorio Roa', department: 'Química'), Professor(id: 'luis_contreras', name: 'Luis Ernesto Contrera Rodrigues', department: 'Química')],),
  Room(id: '451-4-oficina-422', number: '422', name: 'Oficina de Profesores 422', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'cesar_sierra', name: 'Cesar A Sierra A', department: 'Química'), Professor(id: 'luis_cuca', name: 'Luis Henrique Cuca S', department: 'Química')],),
  Room(id: '451-4-oficina-433b', number: '433b', name: 'Oficina de Profesores 433B', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'laura_ortiz', name: 'Laura Ortiz Q', department: 'Química'), Professor(id: 'harold_ardila', name: 'Harold Duan Ardila B', department: 'Química'), Professor(id: 'constancia_lopez', name: 'Constancia Lopez O', department: 'Química')],),
  Room(id: '451-4-oficina-435', number: '435', name: 'Oficina de Profesor 435', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'ricardo_fierro', name: 'Ricardo Fierro Medina', department: 'Química')],),
  Room(id: '451-4-oficina-437', number: '437', name: 'Oficina de Profesoras 437', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'maria_martinez', name: 'Maria Jose Martinez Cordon', department: 'Química'), Professor(id: 'yezmin_agamez', name: 'Yezmin Yaneth Agamez Pertuz', department: 'Química')],),
  Room(id: '451-4-oficina-439', number: '439', name: 'Oficina de Profesores 439', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'manuela_abellaneda', name: 'Manuela Abellaneda T', department: 'Química'), Professor(id: 'carlos_guerrero', name: 'Carlos A Guerrero F', department: 'Química')],),
  Room(id: '451-4-oficina-443', number: '443', name: 'Oficina de Profesor 443', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'marco_suarez', name: 'Marco F Suar3z H', department: 'Química')],),
  Room(id: '451-4-oficina-441', number: '441', name: 'Oficina de Profesores 441', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'yesmith_santos', name: 'Yesmith Santos P', department: 'Química'), Professor(id: 'ricaurte_rodriguez', name: 'Ricaurte Rodriguez Angulo', department: 'Química'), Professor(id: 'carlos_narvaez', name: 'Carlos Eduardo Narvaez C', department: 'Química')],),
  Room(id: '451-4-oficina-445', number: '445', name: 'Oficina de Profesores 445', floor: 'Piso 4', isServiceRoom: false, category: 'Oficina de Profesores', professors: [Professor(id: 'mauricio_maldonado', name: 'Mauricio Maldonado V', department: 'Química'), Professor(id: 'jaime_rios', name: 'Jaime A Rios M', department: 'Química')],),
  Room(id: '451-4-revista', number: '445', name: 'Revista Colombiana de Química y Olimpiada Colombiana de Química', floor: 'Piso 4', isServiceRoom: false, category: 'Oficinas Administrativas'), // Cambiado de 'Oficina Administrativa' a 'Oficinas Administrativas'
  Room(id: '451-4-sala-profesores', number: '453', name: 'Sala de Profesores', floor: 'Piso 4', isServiceRoom: false, category: 'Salas de Reuniones'), // Cambiado de 'Sala de Profesores' a 'Salas de Reuniones'
  Room(id: '451-4-banos-mh', number: 'Baños', name: 'Baños de mujeres y hombres', floor: 'Piso 4', isServiceRoom: true, category: 'Servicios'), // Cambiado

  // --- PISO 5 ---
  Room(id: '451-5-productos-naturales', number: '500-1', name: 'Productos Naturales', floor: 'Piso 5', isServiceRoom: false, category: 'Laboratorios'), // Cambiado
];

final List<Room> specialServices451 = [
  Room(
    id: '451-prestamo-herramientas',
    number: 'Taller',
    name: 'Préstamo de herramientas',
    floor: 'Piso -1',
    isServiceRoom: true,
    category: 'Servicios', // Cambiado
  ),
  Room(
    id: '451-club-go',
    number: 'Biblioteca',
    name: 'Club de Go Unal',
    floor: 'Piso 2A',
    isServiceRoom: false,
    category: 'Salas de Estudio', // Cambiado de 'Club Estudiantil' a 'Salas de Estudio'
  ),
];