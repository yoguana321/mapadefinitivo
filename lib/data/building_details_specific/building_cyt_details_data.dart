// lib/data/building_details_specific/building_cyt_details_data.dart

import '/models/room.dart';
import '/models/professor.dart'; // Mantener por si acaso, aunque no se usen profesores directamente aquí.

const String infoCYT = 'El Edificio de Ciencia y Tecnología (CYT) es una moderna construcción con enfoque bioclimático, hogar de aulas, laboratorios especializados, y una extensión de la biblioteca.';
const String historyCYT = '''
El edificio CYT fue construido como parte de una importante fase de renovación del campus, impulsada por la Universidad Nacional de Colombia. Su edificación fue posible gracias a una generosa donación de la Organización Luis Carlos Sarmiento Angulo, que entregó el edificio a la Universidad en el año 2008.

Diseñado por el arquitecto Camilo Avellaneda, el CYT se destaca por su avanzada arquitectura bioclimática y sus principios de sostenibilidad. Alberga diversas funciones académicas y de investigación, contribuyendo significativamente a la infraestructura de ciencia y tecnología de la universidad.
''';
const String hoursCYT = 'Horario General: Lunes a Viernes 6:00 - 22:00, Sábados 7:00 - 18:00. Horario de Biblioteca y Auditorio puede variar.';
const String contactInfoCYT = 'Contacto: Oficina de Administración del Edificio CYT. [Número Real], Correo: [Correo Real]';

final List<Room> roomsCYT = [
  // --- NIVEL SUBTERRÁNEO ---
  Room(
    id: 'cyt-sub-auditorio-entrada',
    number: 'Entrada Auditorio',
    name: 'Entrada al Auditorio CYT',
    floor: 'Subterráneo',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-sub-sillas',
    number: 'Área de Sillas',
    name: 'Zona de Espera con Sillas (Auditorio)',
    floor: 'Subterráneo',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-sub-salida-emergencia',
    number: 'Salida de Emergencia',
    name: 'Salida de Emergencia (Subterráneo)',
    floor: 'Subterráneo',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-sub-auditorio',
    number: 'Auditorio Principal',
    name: 'Auditorio Principal CYT',
    floor: 'Subterráneo',
    isServiceRoom: false,
  ),

  // --- PISO 1 ---
  Room(
    id: 'cyt-1-auditorio',
    number: 'Acceso Auditorio',
    name: 'Acceso Superior al Auditorio CYT',
    floor: 'Piso 1',
    isServiceRoom: true, // Considera si es un acceso o parte de la sala
  ),
  Room(
    id: 'cyt-1-cajero-bancolombia',
    number: 'Cajero Bancolombia',
    name: 'Cajero Automático Bancolombia',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-cajero-davivienda',
    number: 'Cajero Davivienda',
    name: 'Cajero Automático Davivienda',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-bano-mujeres-der',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Derecha)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-bano-hombres-izq',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Izquierda)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-estacion-emergencia',
    number: 'Estación de Emergencia',
    name: 'Estación de Emergencia (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-ascensor',
    number: 'Ascensor',
    name: 'Ascensor (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-punto-informacion',
    number: 'Punto de Información',
    name: 'Punto de Información (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-biblioteca-entrada',
    number: 'Biblioteca Entrada',
    name: 'Entrada Biblioteca CYT',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-biblioteca-cargadores',
    number: 'Puntos de Carga',
    name: 'Puntos de Carga (Biblioteca Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-biblioteca-sillas',
    number: 'Área de Sillas',
    name: 'Área de Sillas (Biblioteca Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-1-biblioteca-tableros',
    number: 'Tableros de Estudio',
    name: 'Tableros de Estudio (Biblioteca Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true,
  ),

  // --- PISO 2 ---
  Room(
    id: 'cyt-2-biblioteca',
    number: 'Biblioteca General',
    name: 'Biblioteca CYT',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: 'cyt-2-mate-fisica-estadistica',
    number: 'Área Matemáticas/Física',
    name: 'Área de Estudio: Matemáticas, Física y Estadística',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: 'cyt-2-aula-computadores',
    number: 'Aula de Computadores',
    name: 'Aula de Computadores (Uso Público)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  // Salones del Piso 2 (ejemplo, puedes ajustar los números según los IDs reales)
  Room(id: 'cyt-2-sal-201', number: 'Salón 201', name: 'Salón de Clases 201', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-202', number: 'Salón 202', name: 'Salón de Clases 202', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-203', number: 'Salón 203', name: 'Salón de Clases 203', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-204', number: 'Salón 204', name: 'Salón de Clases 204', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-205', number: 'Salón 205', name: 'Salón de Clases 205', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-206', number: 'Salón 206', name: 'Salón de Clases 206', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-207', number: 'Salón 207', name: 'Salón de Clases 207', floor: 'Piso 2'),
  Room(id: 'cyt-2-sal-208', number: 'Salón 208', name: 'Salón de Clases 208 (Grande)', floor: 'Piso 2'),
  // Cuartos Técnicos (CT)
  Room(id: 'cyt-2-ct-201', number: 'CT 201', name: 'Cuarto Técnico 201', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-202', number: 'CT 202', name: 'Cuarto Técnico 202', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-203', number: 'CT 203', name: 'Cuarto Técnico 203', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-204', number: 'CT 204', name: 'Cuarto Técnico 204', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-205', number: 'CT 205', name: 'Cuarto Técnico 205', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-206', number: 'CT 206', name: 'Cuarto Técnico 206', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-207', number: 'CT 207', name: 'Cuarto Técnico 207', floor: 'Piso 2', isServiceRoom: true),
  Room(id: 'cyt-2-ct-208', number: 'CT 208', name: 'Cuarto Técnico 208', floor: 'Piso 2', isServiceRoom: true),
  Room(
    id: 'cyt-2-cafeteria',
    number: 'Cafetería',
    name: 'Cafetería (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-2-vestier-hombres',
    number: 'Vestier Hombres',
    name: 'Vestier de Hombres (Piso 2)',
    floor: 'Piso 2',
    isServiceRoom: true,
  ),

  // --- PISO 3 ---
  Room(
    id: 'cyt-3-biblioteca',
    number: 'Biblioteca General',
    name: 'Biblioteca CYT',
    floor: 'Piso 3',
    isServiceRoom: false,
  ),
  // Salones del Piso 3
  Room(id: 'cyt-3-sal-301', number: 'Salón 301', name: 'Salón de Clases 301', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-302', number: 'Salón 302', name: 'Salón de Clases 302', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-303', number: 'Salón 303', name: 'Salón de Clases 303', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-304', number: 'Salón 304', name: 'Salón de Clases 304', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-305', number: 'Salón 305', name: 'Salón de Clases 305', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-306', number: 'Salón 306', name: 'Salón de Clases 306', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-307', number: 'Salón 307', name: 'Salón de Clases 307', floor: 'Piso 3'),
  Room(id: 'cyt-3-sal-308', number: 'Salón 308', name: 'Salón de Clases 308 (Grande)', floor: 'Piso 3'),
  // Cuartos Técnicos (CT)
  Room(id: 'cyt-3-ct-301', number: 'CT 301', name: 'Cuarto Técnico 301', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-302', number: 'CT 302', name: 'Cuarto Técnico 302', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-303', number: 'CT 303', name: 'Cuarto Técnico 303', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-304', number: 'CT 304', name: 'Cuarto Técnico 304', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-305', number: 'CT 305', name: 'Cuarto Técnico 305', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-306', number: 'CT 306', name: 'Cuarto Técnico 306', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-307', number: 'CT 307', name: 'Cuarto Técnico 307', floor: 'Piso 3', isServiceRoom: true),
  Room(id: 'cyt-3-ct-308', number: 'CT 308', name: 'Cuarto Técnico 308', floor: 'Piso 3', isServiceRoom: true),
  Room(
    id: 'cyt-3-bano-hombres-fondo',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Fondo)',
    floor: 'Piso 3',
    isServiceRoom: true,
  ),

  // --- PISO 4 ---
  Room(
    id: 'cyt-4-biblioteca',
    number: 'Biblioteca General',
    name: 'Biblioteca CYT',
    floor: 'Piso 4',
    isServiceRoom: false,
  ),
  Room(
    id: 'cyt-4-salones-computadores-proyectores',
    number: 'Salones con Computadores',
    name: 'Salones de Clase con Computadores y Proyectores',
    floor: 'Piso 4',
    isServiceRoom: false,
  ),
  // Cuartos Técnicos (CT)
  Room(id: 'cyt-4-ct-401', number: 'CT 401', name: 'Cuarto Técnico 401', floor: 'Piso 4', isServiceRoom: true),
  Room(id: 'cyt-4-ct-402', number: 'CT 402', name: 'Cuarto Técnico 402', floor: 'Piso 4', isServiceRoom: true),
  Room(id: 'cyt-4-ct-403', number: 'CT 403', name: 'Cuarto Técnico 403', floor: 'Piso 4', isServiceRoom: true),
  Room(id: 'cyt-4-ct-404', number: 'CT 404', name: 'Cuarto Técnico 404', floor: 'Piso 4', isServiceRoom: true),
  Room(
    id: 'cyt-4-lab-redes-comunicaciones',
    number: 'Laboratorio Redes',
    name: 'Laboratorio de Redes y Comunicaciones',
    floor: 'Piso 4',
    isServiceRoom: false,
  ),
  Room(
    id: 'cyt-4-bano-mujeres-fondo',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Fondo)',
    floor: 'Piso 4',
    isServiceRoom: true,
  ),

  // --- PISO 5 ---
  Room(
    id: 'cyt-5-terraza-cafeteria',
    number: 'Terraza Cafetería',
    name: 'Terraza y Cafetería (en construcción)',
    floor: 'Piso 5',
    isServiceRoom: true, // Es un servicio, aunque esté en construcción
  ),
  Room(
    id: 'cyt-5-comedores-profesores',
    number: 'Comedor Profesores',
    name: 'Comedor de Profesores',
    floor: 'Piso 5',
    isServiceRoom: true,
  ),
  Room(
    id: 'cyt-5-comedores-estudiantes',
    number: 'Comedor Estudiantes',
    name: 'Comedor de Estudiantes',
    floor: 'Piso 5',
    isServiceRoom: true,
  ),
];