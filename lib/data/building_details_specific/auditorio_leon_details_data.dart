// lib/data/building_details_specific/auditorio_leon_details_data.dart

import '/models/room.dart';

// Información General del Auditorio León de Greiff
const String infoAuditorioLeon = '''
El Auditorio León de Greiff UNAL, con capacidad para 1604 espectadores, es el principal escenario de la Dirección de Patrimonio Cultural de la Universidad Nacional de Colombia. Reconocido por su excepcional acústica y diseño arquitectónico, es un espacio clave para eventos musicales, académicos y culturales de gran magnitud en Latinoamérica. Es la casa habitual de la Orquesta Filarmónica de Bogotá y de la Asociación Sinfónica Nacional de Colombia.
''';

// Información Detallada de Historia, Eventos y Restauración del Auditorio León de Greiff
const String historyAuditorioLeon = '''
**Creación y Reconocimientos:**
Concebido por la arquitecta Eugenia Mantilla de Cardoso, el Auditorio León de Greiff UNAL fue inaugurado a mediados del siglo XX. Su diseño le mereció el Premio Nacional de Arquitectura en 1974 y fue declarado Monumento Nacional en 1996. La creación del Auditorio fue impulsada por la visión del Doctor José Félix Patiño Restrepo durante su rectoría, marcando la Universidad Nacional como una unidad integrada de espacios, academia y cultura.

**Actividad Cultural y Académica:**
Este reconocido escenario desarrolla programas académicos que enriquecen las artes y la cultura, brindando acceso a diversos públicos. Ha conquistado nuevas audiencias a través de conciertos masivos con célebres artistas como Plácido Domingo, Kraken, Medrano y Aterciopelados. Actualmente, impulsa programas de formación para músicos jóvenes y un Proyecto Educativo que beneficia a más de 26 mil niños y adolescentes con formación filarmónica. La Orquesta Filarmónica de Bogotá (OFB) se destaca por interpretar obras de gran magnitud aquí.

**Artistas Destacados (Desde 2008):**
En su tarima se han presentado importantes artistas nacionales e internacionales tales como: Quatuor Diotima, James Ehnesv, Andrew Armstrong, Medeski, Martin and Wood, Manu Dibango, Ojos de brujo, Brad Mehldau, Kenny Garret, Jean Geoffroy, Fermín Bernetxea, Ryoji Ikeda, Compañía Tangokinesis, Jane Rigler, Pauline Oliveros, Chris Mann, David Watson, Ellen Fullman, Blick Bassy, Bojan Zulfikarpasic, Erik Truffaz Quartet, Ron Carter, Jacques Loussier, Joan Albert Amargós Altisent, Juan Conrado García Alonso, Daniel García, Maria Jesús Crespo, Raimon Garriga Moreno, Diego Franco, así como la mayoría de orquestas sinfónicas del país, numerosas agrupaciones sinfónicas internacionales, grupos de cámara y compañías circenses.

**Proyecto de Restauración y Modernización:**
La Universidad Nacional de Colombia desarrolló y entregó hacia el año 2015 los estudios y diseños para la intervención de reforzamiento estructural, modernización y mantenimiento del edificio. Este proyecto contó con la participación de profesionales clave como la arquitecta Eugenia Mantilla de Cardoso y el ingeniero Luis Guillermo Aycardi.

En noviembre de 2023, el Auditorio fue reabierto tras un significativo trabajo de restauración integral y modernización, con el apoyo de la Orquesta Filarmónica de Bogotá y la Secretaría de Cultura, Recreación y Deporte de la Alcaldía Mayor de Bogotá. Las obras iniciaron en diciembre de 2019 y finalizaron en septiembre de 2023.

* **PRIMERA FASE:** Construcción de tanque subterráneo de agua, cuarto de bombas, cuarto eléctrico (subestación y planta), restitución de espacio público y red contra incendios. Ejecutada bajo convenio con la SCRD, con aportes de la Ley del Espectáculo Público 2019.
* **SEGUNDA FASE:** Reforzamiento estructural y actualización de redes eléctricas, hidráulicas, ventilación mecánica, detección y seguridad, y restauración de silletería, con aportes de la Ley del Espectáculo Público 2019.
* **TERCERA FASE:** Dotación de equipos audiovisuales, mecánica teatral, iluminación escénica y señalización general del edificio. Se estima que estas intervenciones terminen en noviembre de 2025.

En 2024, el Auditorio abrió sus puertas al público para una nueva temporada de conciertos orquestales y corales, con la participación de la Orquesta Filarmónica de Bogotá, la Orquesta Sinfónica Nacional de Colombia, el Coro Nacional de Colombia, las orquestas del Conservatorio de Música UNAL, y numerosos artistas solistas y grupales.
''';

// Información del Equipo de Trabajo del Auditorio León de Greiff
const String teamAuditorioLeon = '''
**EQUIPO DE TRABAJO**

**VICERRECTORÍA DE SEDE**
* Vicerrectora: Carolina Jiménez Martín

**DIRECCIÓN DE PATRIMONIO CULTURAL**
* Dirección: María Belén Sáez de Ibarra
* Jefatura División de Museos: Alejandro Burgos
* Colecciones Patrimoniales: Carolina Consuegra

**ÁREA ADMINISTRATIVA Y FINANCIERA**
* Jefatura de grupo: Martha Rugeles
* Mensajería: José Baracaldo

**ÁREA DE COMUNICACIONES**
* Jefatura de grupo: Dora Rodríguez
* Diseño gráfico y página web: Javıer Truȷılllo
* Registro fotográfico: Johnson Montoya
* Equipo de gestión: Karen Garzón

**ÁREA DE PRODUCCIÓN**
* Equipo técnico y operativo: Moisés Romero, Gabriel Castillo, John Herrera, Wilson Javier Gómez, Héctor Rozo, Nicolás Rodríguez, Lady Contreras, Wilson Humberto Guevara, Johan Martínez
''';

const String contactInfoAuditorioLeon = 'Carrera 30 No, 45-03 Ed. 104 – Auditorio León de Greiff UNAL, Bogotá. Teléfonos: 3165000. Correo: dircultura@unal.edu.co';

// NOTA: El auditorio es también el "Edificio 104" en su ubicación.
// Si deseas reflejar esto en el ID o shortName del Building,
// deberías modificar la constante 'auditorioLeonDeGreiff' en building_data.dart.

final List<Room> roomsAuditorioLeon = [
  // --- Áreas Generales ---
  Room(
    id: 'leon-ACCESO',
    number: 'Acceso Principal',
    name: 'Acceso y Hall Principal',
    floor: 'Áreas Generales', // Keeping floor as 'Áreas Generales' for grouping
    category: 'Servicios', // Assigning a category
    isServiceRoom: true,
    description: 'Punto de entrada principal al auditorio y espacio de recepción.',
  ),
  Room(
    id: 'leon-TAQUILLA',
    number: 'Taquilla',
    name: 'Taquilla de Boletas',
    floor: 'Áreas Generales',
    category: 'Servicios',
    isServiceRoom: true,
    description: 'Lugar de compra y recogida de entradas para eventos.',
  ),
  Room(
    id: 'leon-CAFETERIA',
    number: 'Cafetería',
    name: 'Cafetería del Auditorio',
    floor: 'Áreas Generales',
    category: 'Servicios',
    isServiceRoom: true,
    description: 'Espacio para refrigerios y bebidas.',
  ),
  Room(
    id: 'leon-BANOS_GENERAL',
    number: 'Baños Generales',
    name: 'Baños Públicos (Hombres/Mujeres)',
    floor: 'Áreas Generales',
    category: 'Servicios',
    isServiceRoom: true,
    description: 'Servicios sanitarios disponibles para el público en general.',
  ),
  Room(
    id: 'leon-ASCENSORES',
    number: 'Ascensores',
    name: 'Ascensores',
    floor: 'Áreas Generales',
    category: 'Servicios',
    isServiceRoom: true,
    description: 'Ascensores para facilitar la movilidad entre los niveles del auditorio.',
    isAccessible: true, // Asumimos accesibilidad para ascensores
  ),

  // --- Sala Principal y Escenario ---
  Room(
    id: 'leon-SALA_PPAL',
    number: 'Sala Principal',
    name: 'Sala Principal de Espectadores',
    floor: 'Sala Principal y Escenario', // Keeping floor as 'Sala Principal y Escenario' for grouping
    category: 'Auditorios', // Assigning 'Auditorios' category
    capacity: 1604,
    description: 'Con 1604 butacas, es el corazón del auditorio, diseñado para conciertos y grandes eventos. Destaca por su excepcional acústica.',
    isAccessible: true, // Asumimos que la sala principal tiene espacios accesibles
  ),
  Room(
    id: 'leon-ESCENARIO',
    number: 'Escenario',
    name: 'Escenario Principal',
    floor: 'Sala Principal y Escenario',
    category: 'Servicios', // Stage is a service/support area
    isServiceRoom: true, // Es un espacio de soporte para los artistas
    description: 'El área donde se realizan las presentaciones artísticas y académicas.',
  ),
  Room(
    id: 'leon-ORQUESTA',
    number: 'Foso Orquesta',
    name: 'Foso de Orquesta',
    floor: 'Sala Principal y Escenario', // Relacionado con el escenario
    category: 'Servicios', // Orchestra pit is also a service/support area
    isServiceRoom: true,
    description: 'Espacio bajo el escenario diseñado para albergar a la orquesta en presentaciones.',
  ),

  // --- Áreas de Soporte ---
  Room(
    id: 'leon-CAMERINOS',
    number: 'Camerinos',
    name: 'Camerinos de Artistas',
    floor: 'Áreas de Soporte', // Keeping floor
    category: 'Servicios', // Service for artists
    isServiceRoom: true,
    description: 'Vestidores y áreas de preparación para los artistas antes y después de las funciones.',
  ),
  Room(
    id: 'leon-SALAS_ENSAYO',
    number: 'Salas de Ensayo',
    name: 'Salas de Ensayo para Músicos',
    floor: 'Áreas de Soporte',
    category: 'Salones Especiales', // These are specialized rooms for practice
    isServiceRoom: true,
    description: 'Espacios equipados para que los músicos y artistas puedan ensayar.',
  ),
  Room(
    id: 'leon-AREA_TECNICA',
    number: 'Área Técnica',
    name: 'Área Técnica',
    floor: 'Áreas de Soporte',
    category: 'Servicios', // Technical support
    isServiceRoom: true,
    description: 'Control de sonido, iluminación y equipos de mecánica teatral.',
    equipment: ['Consola de sonido', 'Luces robóticas', 'Sistema de proyección'],
  ),
  Room(
    id: 'leon-ALMACEN',
    number: 'Almacén',
    name: 'Almacén de Utilería y Equipos',
    floor: 'Áreas de Soporte',
    category: 'Servicios', // Storage is a service function
    isServiceRoom: true,
    description: 'Zona de almacenamiento para escenografía, utilería y equipos del auditorio.',
  ),

  // --- Oficinas Administrativas ---
  Room(
    id: 'leon-OFICINAS_ADMIN',
    number: 'Oficinas Adm.',
    name: 'Oficinas Administrativas del Auditorio',
    floor: 'Oficinas Administrativas', // Keeping floor
    category: 'Oficinas Administrativas', // Specific office category
    description: 'Oficinas donde se gestiona la operación y programación del auditorio.',
    contact: 'dircultura@unal.edu.co', // Contacto específico si lo hubiera
  ),
];