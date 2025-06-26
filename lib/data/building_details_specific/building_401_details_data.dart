// lib/data/building_details_specific/building_401_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

// Información General y de Historia del 401
const String info401 = 'El Edificio Julio Garavito Armero (401), conocido como "El Viejo" de Ingeniería, es un edificio histórico que alberga aulas, laboratorios y oficinas clave. Cuenta con la Cafetería Minka, Salas de Estudio y el Auditorio Juan Bautista Gómez.';
const String history401 = 'El Edificio 401 de Ingeniería de la Universidad Nacional de Colombia, también conocido como el Edificio Julio Garavito Armero, fue construido en 1945 por el arquitecto Leopoldo Rother. Su diseño se integró en el plan urbanístico de la ciudad universitaria, concebido por Karl Brunner en 1932, que buscaba una estructura organizada con la naturaleza como elemento central. En 1995, fue declarado Bien de Interés Cultural, reconociendo su valor histórico y arquitectónico.';
const String hours401 = 'Horario del edificio: Lunes a Viernes 6:00 - 22:00, Sábados 7:00 - 18:00';
const String contactInfo401 = 'Contacto de Bienestar Oficina Principal: [Número Real Aquí]';

final List<Room> rooms401 = [
  // --- PISO 1 ---
  Room(
    id: '401-BanoMujeresDerP1',
    number: 'Baño Mujeres Derecha',
    name: 'Baño Mujeres Derecha',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-Aud-JuanBautista',
    number: 'Auditorio Juan Bautista',
    name: 'Auditorio Juan Bautista Gómez Rodríguez',
    floor: 'Piso 1',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false si no es un servicio "común"
  ),
  Room(
    id: '401-Aud-CarlosBarberi',
    number: 'Auditorio Carlos Barberi',
    name: 'Auditorio Carlos Alberto Barberi Perdomo',
    floor: 'Piso 1',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false
  ),
  Room(
    id: '401-CT101',
    number: 'Cuarto Técnico 101',
    name: 'Cuarto Técnico 101',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-CT102',
    number: 'Cuarto Técnico 102',
    name: 'Cuarto Técnico 102',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-Aseo',
    number: 'Cuarto Aseo',
    name: 'Cuarto de Aseo',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-PrestamosJuegosCargadores',
    number: 'Préstamos: Juegos y Cargadores',
    name: 'Préstamos: Juegos y Cargadores',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-Bebedero',
    number: 'Bebedero',
    name: 'Bebedero',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-Vending',
    number: 'Máquinas Dispensadoras',
    name: '3 Máquinas Dispensadoras',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-CafeteriaMinka',
    number: 'Cafetería Minka',
    name: 'Cafetería "Café de "El Viejo" Minka"',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-OfiApoyoBienestarP1',
    number: 'Oficina Apoyo Bienestar',
    name: 'Oficina de Apoyo a Bienestar',
    floor: 'Piso 1',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo para aparecer en el piso
  ),
  Room(
    id: '401-BanoMixtoIzqP1',
    number: 'Baño Mixto Izquierda',
    name: 'Baño Mixto Izquierda',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-DispensadorCondones',
    number: 'Dispensador Condones',
    name: 'Dispensador de Condones',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-PuntosCargaP1',
    number: 'Puntos de Carga',
    name: 'Puntos de Carga (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),


  // --- PISO 2 ---
  Room(
    id: '401-BanoMujeresIzqP2',
    number: 'Baño Mujeres Izq.',
    name: 'Baño Mujeres Izquierda',
    floor: 'Piso 2',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-BanoHombresDerP2',
    number: 'Baño Hombres Der.',
    name: 'Baño Hombres Derecha',
    floor: 'Piso 2',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-VicedecInvExt',
    number: 'Ofi. Vicedec. Inv. y Ext.',
    name: 'Oficina Vicedecanatura de Investigación y Extensión',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-OfiVicedecInv1',
    number: 'Ofi. Vicedec. Inv. 1',
    name: 'Oficina Vicedecanatura de Investigación (Ofi. 1)',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
    professors: [
      Professor(id: 'prof_viviana_c', name: 'Prof. Viviana Andrea Claro Gómez', department: 'Investigación', email: 'viviana.claro@unal.edu.co'),
    ],
  ),
  Room(
    id: '401-OfiVicedecInv2',
    number: 'Ofi. Vicedec. Inv. 2',
    name: 'Oficina Vicedecanatura de Investigación (Ofi. 2)',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
    professors: [
      Professor(id: 'prof_francy_p', name: 'Prof. Francy Nayely Prieto Novoa', department: 'Investigación', email: 'francy.prieto@unal.edu.co'),
      Professor(id: 'prof_jhon_a', name: 'Prof. Jhon Jairo Arévalo Vargas', department: 'Investigación', email: 'jhon.arevalo@unal.edu.co'),
    ],
  ),
  Room(
    id: '401-CT201',
    number: 'Cuarto Técnico 201',
    name: 'Cuarto Técnico 201',
    floor: 'Piso 2',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-CT202',
    number: 'Cuarto Técnico 202',
    name: 'Cuarto Técnico 202',
    floor: 'Piso 2',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-Decanatura',
    number: 'Decanatura',
    name: 'Decanatura de Ingeniería',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-SalonConsejo',
    number: 'Salón de Consejo',
    name: 'Salón de Consejo',
    floor: 'Piso 2',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false
  ),
  Room(
    id: '401-SecretariaDec',
    number: 'Secretaría Decanatura',
    name: 'Secretaría de Decanatura',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-VicedecAcad',
    number: 'Vicedecanatura Académica',
    name: 'Vicedecanatura Académica',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-OfiPyp',
    number: 'Oficina PyP',
    name: 'Oficina de Prácticas y Pasantías (PyP)',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-OfiApoyoVicedecAcad',
    number: 'Oficina Apoyo Vicedec. Acad.',
    name: 'Oficina de Apoyo Vicedecanatura Académica',
    floor: 'Piso 2',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),

  // --- PISO 3 ---
  Room(
    id: '401-CentroImpresion',
    number: 'Centro Impresión',
    name: 'Centro de Impresión y Copiado',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-SE-B',
    number: 'SE-B',
    name: 'Salón de Estudio B',
    floor: 'Piso 3',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false
  ),
  Room(
    id: '401-SE-A',
    number: 'SE-@/A',
    name: 'Salón de Estudio @/A',
    floor: 'Piso 3',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false
  ),
  Room(
    id: '401-BanoMujeresSur',
    number: 'Baño Mujeres Sur',
    name: 'Baño Mujeres Sur',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-BanoHombresMujeresSur',
    number: 'Baño Hombres y Mujeres Sur',
    name: 'Baño Hombres y Mujeres Sur',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-BanoHombresNorte',
    number: 'Baño Hombres Norte',
    name: 'Baño Hombres Norte',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-OFIPROFI',
    number: 'Oficina ProFi',
    name: 'Oficina ProFi',
    floor: 'Piso 3',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
    professors: [
      Professor(
          id: 'prof_coordprofi',
          name: 'Coordinación ProFi',
          department: 'Bienestar',
          email: 'profi@unal.edu.co',
          roomNumber: 'Oficina ProFi')
    ],
  ),
  Room(
    id: '401-SalaOasis',
    number: 'Sala Oasis',
    name: 'Sala Oasis (Sala para dormir y descansar)',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-CT301',
    number: 'Cuarto Técnico 301',
    name: 'Cuarto Técnico 301',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-CT302',
    number: 'Cuarto Técnico 302',
    name: 'Cuarto Técnico 302',
    floor: 'Piso 3',
    isServiceRoom: true, // Esto es un servicio, se mantiene TRUE
  ),
  Room(
    id: '401-AULAIN',
    number: 'Aula Insignia',
    name: 'Aula Insignia',
    floor: 'Piso 3',
    // isServiceRoom: false, // <--- CAMBIO AQUÍ: Omitir o poner false
  ),
  Room(
    id: '401-VICEDEC',
    number: 'Vicedecanatura Bienestar',
    name: 'Vicedecanatura de Bienestar',
    floor: 'Piso 3',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-OfiApoyoVicedecBienestar1',
    number: 'Ofi. Apoyo Vicedec. Bienestar 1',
    name: 'Oficina de Apoyo Vicedecanatura de Bienestar (Ofi. 1)',
    floor: 'Piso 3',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
  Room(
    id: '401-OfiApoyoVicedecBienestar2',
    number: 'Ofi. Apoyo Vicedec. Bienestar 2',
    name: 'Oficina de Apoyo Vicedecanatura de Bienestar (Ofi. 2)',
    floor: 'Piso 3',
    isServiceRoom: false, // <--- CAMBIO AQUÍ: Debería ser false o nulo
  ),
];