// lib/data/building_details_specific/auditorio_leon_details_data.dart

import '/models/room.dart';
// Mantener si el modelo Room lo requiere, aunque no se usen profesores directamente aquí.

// Información General y de Historia del Auditorio León de Greiff
const String infoAuditorioLeon = 'El Auditorio León de Greiff UNAL, con capacidad para 1604 espectadores, es el principal escenario de la Dirección de Patrimonio Cultural de la Universidad Nacional de Colombia. Reconocido por su excepcional acústica y diseño arquitectónico, es un espacio clave para eventos musicales, académicos y culturales de gran magnitud en Latinoamérica.';
const String historyAuditorioLeon = '''
El Auditorio León de Greiff UNAL, concebido por la arquitecta Eugenia Mantilla de Cardoso, fue inaugurado en [Año de Inauguración Real, si lo tienes, sino puedes omitirlo o poner 'a mediados del siglo XX']. Su diseño le mereció el Premio Nacional de Arquitectura en 1974 y fue declarado Monumento Nacional en 1996. Es la casa habitual de la Orquesta Filarmónica de Bogotá desde hace 40 años y de la Asociación Sinfónica Nacional de Colombia.

Su creación fue impulsada por la visión del Doctor José Félix Patiño Restrepo durante su rectoría. Ha sido escenario de innumerables conciertos con artistas célebres como Plácido Domingo, Kraken, Medrano y Aterciopelados. Además, impulsa programas de formación para músicos jóvenes y proyectos educativos que benefician a miles de niños y adolescentes.

Desde 2008, ha recibido a importantes artistas nacionales e internacionales. En noviembre de 2023, fue reabierto tras un significativo trabajo de restauración integral y modernización, con apoyo de la Orquesta Filarmónica de Bogotá y la Secretaría de Cultura. En 2024, inició su temporada de conciertos orquestales y corales.
''';
const Map<String, String> hoursAuditorioLeon = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
  'Feriado': 'Cerrado', // Considera un manejo para días feriados
};
const String contactInfoAuditorioLeon = 'Contacto: Dirección de Patrimonio Cultural UNAL. [Número de contacto real si lo tienes], Correo: [Correo real si lo tienes]';

final List<Room> roomsAuditorioLeon = [
  // --- Áreas Generales/Servicios ---
  Room(
    id: 'leon-ACCESO',
    number: 'Acceso Principal',
    name: 'Acceso y Hall Principal',
    floor: 'General', // O planta baja si aplica un concepto de pisos
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-TAQUILLA',
    number: 'Taquilla',
    name: 'Taquilla de Boletas',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-CAFETERIA',
    number: 'Cafetería',
    name: 'Cafetería del Auditorio',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-BANOS_GENERAL',
    number: 'Baños Generales',
    name: 'Baños Públicos (Hombres/Mujeres)',
    floor: 'General',
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-ASCENSORES',
    number: 'Ascensores',
    name: 'Ascensores',
    floor: 'General',
    isServiceRoom: true,
  ),

  // --- Nivel de Sala Principal ---
  Room(
    id: 'leon-SALA_PPAL',
    number: 'Sala Principal',
    name: 'Sala Principal de Espectadores (1604 butacas)',
    floor: 'Nivel Principal', // Puedes usar 'Piso 1' si así lo manejas consistentemente
    // No es isServiceRoom: false, es el espacio principal
  ),
  Room(
    id: 'leon-ESCENARIO',
    number: 'Escenario',
    name: 'Escenario Principal',
    floor: 'Nivel Principal',
    // No es isServiceRoom: false
  ),
  Room(
    id: 'leon-ORQUESTA',
    number: 'Foso Orquesta',
    name: 'Foso de Orquesta',
    floor: 'Nivel Principal', // Puede considerarse en este nivel o un nivel inferior
    isServiceRoom: true, // Es un espacio de soporte para espectáculos
  ),

  // --- Áreas de Soporte / Camerinos (Pueden estar en un sótano o en diferentes niveles) ---
  Room(
    id: 'leon-CAMERINOS',
    number: 'Camerinos',
    name: 'Camerinos de Artistas',
    floor: 'Nivel de Soporte', // O 'Sótano 1' si aplica
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-SALAS_ENSAYO',
    number: 'Salas de Ensayo',
    name: 'Salas de Ensayo para Músicos',
    floor: 'Nivel de Soporte',
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-AREA_TECNICA',
    number: 'Área Técnica',
    name: 'Área Técnica (Sonido, Iluminación, Mecánica Teatral)',
    floor: 'Nivel de Soporte',
    isServiceRoom: true,
  ),
  Room(
    id: 'leon-OFICINAS_ADMIN',
    number: 'Oficinas Adm.',
    name: 'Oficinas Administrativas del Auditorio',
    floor: 'Nivel Administrativo', // O un piso específico si lo tiene
    // No es isServiceRoom: false
  ),
  Room(
    id: 'leon-ALMACEN',
    number: 'Almacén',
    name: 'Almacén de Utilería y Equipos',
    floor: 'Nivel de Soporte',
    isServiceRoom: true,
  ),
];