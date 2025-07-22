import '/models/room.dart';
import '/models/professor.dart';

// Information for CYT - Ciencia y Tecnología Building
const String infoCYT = 'El edificio CYT (Ciencia y Tecnología) es una estructura moderna del campus de la Universidad Nacional de Colombia, caracterizada por su arquitectura bioclimática y sostenibilidad. Fue posible gracias a una donación de la Organización Luis Carlos Sarmiento Angulo y entregado a la universidad en 2008. Alberga bibliotecas especializadas por áreas del conocimiento, aulas de estudio, auditorio, y servicios de apoyo.';
const String historyCYT = 'El edificio CYT fue construido como parte de una fase de renovación del campus que incluyó la recuperación de edificios como la Facultad de Economía y la Biblioteca Central. Su construcción fue financiada por una donación de la Organización Luis Carlos Sarmiento Angulo, entregándose a la Universidad Nacional en 2008. Fue diseñado por el arquitecto Camilo Avellaneda, con un enfoque en la arquitectura bioclimática y la sostenibilidad.';
const Map<String, String> hoursCYT = {
  // Placeholder hours, actual hours would need to be confirmed.
  'Lunes a Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado',
  'Feriado': 'Cerrado',
};
const String contactInfoCYT = 'Universidad Nacional de Colombia - CYT'; // Placeholder, actual contact info needed.


final List<Room> roomsCYT = [
  // --- SUBTERRÁNEO / SÓTANO ---
  Room(id: 'cyt-s-entrada-auditorio', number: 'Entrada Auditorio', name: 'Entrada al Auditorio', floor: 'Subterráneo', isServiceRoom: false, category: 'Auditorios'), // Access to an auditorium
  Room(id: 'cyt-s-sillas', number: 'Sillas (Auditorio)', name: 'Sillas del Auditorio', floor: 'Subterráneo', isServiceRoom: false, category: 'Auditorios'),
  Room(id: 'cyt-s-salida-emergencia', number: 'Salida de Emergencia', name: 'Salida de emergencia', floor: 'Subterráneo', isServiceRoom: true, category: 'Servicios'), // General services for safety

  // --- PRIMER PISO ---
  Room(id: 'cyt-p1-auditorio', number: 'Auditorio', name: 'Auditorio Principal', floor: 'Piso 1', isServiceRoom: false, category: 'Auditorios'),
  Room(id: 'cyt-p1-cajero-bancolombia', number: 'Cajero Bancolombia', name: 'Cajero Bancolombia', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Banking service is a general service
  Room(id: 'cyt-p1-cajero-davivienda', number: 'Cajero Davivienda', name: 'Cajero Davivienda', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Banking service is a general service
  Room(id: 'cyt-p1-bano-mujeres', number: 'Baño Mujeres P1', name: 'Baño mujeres (derecha)', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p1-bano-hombres', number: 'Baño Hombres P1', name: 'Baño hombres (izquierda)', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p1-estacion-emergencia', number: 'Estación de Emergencia', name: 'Estación de emergencia', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Safety service is a general service
  Room(id: 'cyt-p1-ascensor', number: 'Ascensor P1', name: 'Ascensor', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p1-punto-informacion', number: 'Punto de Información', name: 'Punto de información', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // User service is a general service
  Room(id: 'cyt-p1-biblioteca-entrada', number: 'Biblioteca - Entrada', name: 'Biblioteca - Entrada', floor: 'Piso 1', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p1-biblioteca-puntos-carga', number: 'Biblioteca - Puntos de Carga', name: 'Biblioteca - Puntos de carga', floor: 'Piso 1', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p1-biblioteca-sillas', number: 'Biblioteca - Sillas', name: 'Biblioteca - Sillas', floor: 'Piso 1', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p1-biblioteca-tableros', number: 'Biblioteca - Tableros', name: 'Biblioteca - Tableros', floor: 'Piso 1', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p1-biblioteca-aula-computadores', number: 'Biblioteca - Aula de Computadores', name: 'Biblioteca - Aula de computadores (uso público)', floor: 'Piso 1', isServiceRoom: false, category: 'Sala de Cómputo'),
  Room(id: 'cyt-p1-vestier-hombres', number: 'Vestier Hombres', name: 'Vestier de hombres', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),

  // --- SEGUNDO PISO ---
  Room(id: 'cyt-p2-biblioteca', number: 'Biblioteca P2', name: 'Biblioteca (General)', floor: 'Piso 2', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p2-biblioteca-prestamo-devolucion', number: 'Préstamo y Devolución P2', name: 'Biblioteca - Préstamo y Devolución', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p2-biblioteca-catalogo-linea', number: 'Catálogo en Línea P2', name: 'Biblioteca - Catálogo en Línea', floor: 'Piso 2', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p2-biblioteca-consulta-individual', number: 'Consulta Individual P2', name: 'Biblioteca - Consulta Individual', floor: 'Piso 2', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p2-biblioteca-consulta-grupo', number: 'Consulta en Grupo P2', name: 'Biblioteca - Consulta en Grupo', floor: 'Piso 2', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p2-biblioteca-colecciones-matematicas', number: 'Colección Matemáticas', name: 'Biblioteca - Colección Matemáticas', floor: 'Piso 2', isServiceRoom: false, category: 'Centro de Documentación'), // Specialized collection within library
  Room(id: 'cyt-p2-biblioteca-colecciones-fisica', number: 'Colección Física', name: 'Biblioteca - Colección Física', floor: 'Piso 2', isServiceRoom: false, category: 'Centro de Documentación'), // Specialized collection within library
  Room(id: 'cyt-p2-biblioteca-colecciones-estadistica', number: 'Colección Estadística', name: 'Biblioteca - Colección Estadística', floor: 'Piso 2', isServiceRoom: false, category: 'Centro de Documentación'), // Specialized collection within library
  Room(id: 'cyt-p2-consulta-internet-recepcion', number: 'Recepción Internet P2', name: 'Consulta en Internet - Recepción', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p2-consulta-internet-impresiones', number: 'Impresiones P2', name: 'Consulta en Internet - Impresiones', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p2-aulas-estudio', number: 'Aulas de Estudio P2', name: 'Aulas de Estudio', floor: 'Piso 2', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p2-ascensor', number: 'Ascensor P2', name: 'Ascensor', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p2-banos', number: 'Baños P2', name: 'Baños', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p2-ct-201', number: 'CT 201', name: 'Aula CT 201 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-202', number: 'CT 202', name: 'Aula CT 202 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-203', number: 'CT 203', name: 'Aula CT 203 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-204', number: 'CT 204', name: 'Aula CT 204 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-205', number: 'CT 205', name: 'Aula CT 205 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-206', number: 'CT 206', name: 'Aula CT 206 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-207', number: 'CT 207', name: 'Aula CT 207 (24 estudiantes, 1 profesor)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p2-ct-208', number: 'CT 208', name: 'Aula CT 208 (un poco más grande)', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),

  // --- TERCER PISO ---
  Room(id: 'cyt-p3-biblioteca', number: 'Biblioteca P3', name: 'Biblioteca (General)', floor: 'Piso 3', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p3-biblioteca-prestamo-devolucion', number: 'Préstamo y Devolución P3', name: 'Biblioteca - Préstamo y Devolución', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p3-biblioteca-catalogo-linea', number: 'Catálogo en Línea P3', name: 'Biblioteca - Catálogo en Línea', floor: 'Piso 3', isServiceRoom: false, category: 'Centro de Documentación'),
  Room(id: 'cyt-p3-biblioteca-consulta-individual', number: 'Consulta Individual P3', name: 'Biblioteca - Consulta Individual', floor: 'Piso 3', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p3-biblioteca-consulta-grupo', number: 'Consulta en Grupo P3', name: 'Biblioteca - Consulta en Grupo', floor: 'Piso 3', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p3-biblioteca-colecciones-biologia', number: 'Colección Biología', name: 'Biblioteca - Colección Biología', floor: 'Piso 3', isServiceRoom: false, category: 'Centro de Documentación'), // Specialized collection within library
  Room(id: 'cyt-p3-biblioteca-colecciones-quimica', number: 'Colección Química', name: 'Biblioteca - Colección Química', floor: 'Piso 3', isServiceRoom: false, category: 'Centro de Documentación'), // Specialized collection within library
  Room(id: 'cyt-p3-consulta-internet-recepcion', number: 'Recepción Internet P3', name: 'Consulta en Internet - Recepción', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p3-consulta-internet-impresiones', number: 'Impresiones P3', name: 'Consulta en Internet - Impresiones', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p3-aulas-estudio', number: 'Aulas de Estudio P3', name: 'Aulas de Estudio', floor: 'Piso 3', isServiceRoom: false, category: 'Salas de Estudio'),
  Room(id: 'cyt-p3-ascensor', number: 'Ascensor P3', name: 'Ascensor', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p3-banos', number: 'Baños P3', name: 'Baños', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p3-ct-301', number: 'CT 301', name: 'Aula CT 301 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-302', number: 'CT 302', name: 'Aula CT 302 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-303', number: 'CT 303', name: 'Aula CT 303 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-304', number: 'CT 304', name: 'Aula CT 304 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-305', number: 'CT 305', name: 'Aula CT 305 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-306', number: 'CT 306', name: 'Aula CT 306 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-307', number: 'CT 307', name: 'Aula CT 307 (24 estudiantes, 1 profesor)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-ct-308', number: 'CT 308', name: 'Aula CT 308 (un poco más grande)', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: 'cyt-p3-bano-hombres-fondo', number: 'Baño Hombres P3 Fondo', name: 'Baño hombres (al fondo)', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),

  // --- CUARTO PISO ---
  Room(id: 'cyt-p4-biblioteca', number: 'Biblioteca P4', name: 'Biblioteca (General)', floor: 'Piso 4', isServiceRoom: false, category: 'Centro de Documentación'), // Implied by "TODOS LOS PISOS CON BIBLIOTECA DE 1-4"
  Room(id: 'cyt-p4-ct-401', number: 'CT 401', name: 'Aula CT 401 (con computadores y protectores)', floor: 'Piso 4', isServiceRoom: false, category: 'Aulas Especializadas'), // Assuming "con computadores" makes it specialized
  Room(id: 'cyt-p4-ct-402', number: 'CT 402', name: 'Aula CT 402 (con computadores y protectores)', floor: 'Piso 4', isServiceRoom: false, category: 'Aulas Especializadas'),
  Room(id: 'cyt-p4-ct-403', number: 'CT 403', name: 'Aula CT 403 (con computadores y protectores)', floor: 'Piso 4', isServiceRoom: false, category: 'Aulas Especializadas'),
  Room(id: 'cyt-p4-ct-404', number: 'CT 404', name: 'Aula CT 404 (con computadores y protectores)', floor: 'Piso 4', isServiceRoom: false, category: 'Aulas Especializadas'),
  Room(id: 'cyt-p4-laboratorio-redes-comunicaciones', number: 'Laboratorio de Redes y Comunicaciones', name: 'Laboratorio de redes y comunicaciones', floor: 'Piso 4', isServiceRoom: false, category: 'Laboratorios'),
  Room(id: 'cyt-p4-bano-mujeres-fondo', number: 'Baño Mujeres P4 Fondo', name: 'Baño mujeres (al fondo)', floor: 'Piso 4', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p4-ascensor', number: 'Ascensor P4', name: 'Ascensor', floor: 'Piso 4', isServiceRoom: true, category: 'Servicios'),

  // --- QUINTO PISO ---
  Room(id: 'cyt-p5-terraza-cafeteria-construccion', number: 'Terraza-Cafetería (en construcción)', name: 'Terraza - Cafetería (en construcción)', floor: 'Piso 5', isServiceRoom: true, category: 'Servicios'), // Treat cafeteria as a service
  Room(id: 'cyt-p5-comedores-profesores', number: 'Comedores de Profesores', name: 'Comedores de profesores', floor: 'Piso 5', isServiceRoom: true, category: 'Servicios'), // Comedores are services
  Room(id: 'cyt-p5-comedores-estudiantes', number: 'Comedores de Estudiantes', name: 'Comedores de estudiantes', floor: 'Piso 5', isServiceRoom: true, category: 'Servicios'), // Comedores are services
  Room(id: 'cyt-p5-ascensor', number: 'Ascensor P5', name: 'Ascensor', floor: 'Piso 5', isServiceRoom: true, category: 'Servicios'),
  Room(id: 'cyt-p5-banos', number: 'Baños P5', name: 'Baños', floor: 'Piso 5', isServiceRoom: true, category: 'Servicios'),
];

final List<Room> specialServicesCYT = [
  // Any services that are notable but not tied to a specific room, or are building-wide.
  // Most were covered as rooms.
];