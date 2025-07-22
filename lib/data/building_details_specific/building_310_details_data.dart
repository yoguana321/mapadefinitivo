// lib/data/building_details_specific/building_310_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info310 = 'El Edificio 310 es la sede de la Facultad de Ciencias Económicas. Alberga aulas, auditorios, salas de estudio, oficinas administrativas y académicas clave para los programas de Economía, Contaduría Pública y Administración. Cuenta con servicios como fotocopiadoras y restaurante universitario.';
const String history310 = 'Historia pendiente. Se necesita información sobre la construcción y evolución del edificio 310 de la Facultad de Economía.'; // Puedes añadir más historia si la encuentras.
const Map<String, String> hours310 = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
  'Feriado': 'Cerrado', // Considera un manejo para días feriados
};
const String contactInfo310 = 'Contacto: Decanatura de la Facultad de Ciencias Económicas. \n\nPrograma de Internacionalización: ori_fcebog@unal.edu.co\nPrácticas y Pasantías: pasancon_fcebog@unal.edu.co\nPrograma de Egresados: egresados_fcebog@unal.edu.co\nTeléfono: 3165000 Ext. 12434';


final List<Room> rooms310 = [
  // --- PRIMER PISO ---
  Room(
    id: '310-1-fotocopiadora-1-derecha',
    number: 'Fotocopiadora 1 (Derecha)',
    name: 'Fotocopiadora 1 con préstamos de juegos',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-fotocopiadora-2',
    number: 'Fotocopiadora 2',
    name: 'Fotocopiadora',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-cuarto-cableado-1',
    number: 'Cuarto de Cableado 1',
    name: 'Cuarto de Cableado',
    floor: 'Piso 1',
    category: 'Infraestructura', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-cuarto-cableado-2',
    number: 'Cuarto de Cableado 2',
    name: 'Cuarto de Cableado',
    floor: 'Piso 1',
    category: 'Infraestructura', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-bano-mujeres',
    number: 'Baño Mujeres',
    name: 'Baño de Mujeres (Piso 1)',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-bano-hombres',
    number: 'Baño Hombres',
    name: 'Baño de Hombres (Piso 1)',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-sala-estudio-1',
    number: 'Sala de Estudio 1',
    name: 'Sala de Estudio (Piso 1)',
    floor: 'Piso 1',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-estudio-2',
    number: 'Sala de Estudio 2',
    name: 'Sala de Estudio (Piso 1)',
    floor: 'Piso 1',
    category: 'Salas de Estudio', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-restaurante-u',
    number: 'Restaurante U',
    name: 'Restaurante Universitario',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-aulas-primer-piso', // Generalizar si no hay números específicos
    number: 'Aulas (Piso 1)',
    name: 'Aulas de Clase (Piso 1)',
    floor: 'Piso 1',
    category: 'Aulas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-auditorio-1',
    number: 'Auditorio 1',
    name: 'Auditorio 1',
    floor: 'Piso 1',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-auditorio-2',
    number: 'Auditorio 2',
    name: 'Auditorio 2',
    floor: 'Piso 1',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-auditorio-3',
    number: 'Auditorio 3',
    name: 'Auditorio 3',
    floor: 'Piso 1',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-auditorio-4',
    number: 'Auditorio 4',
    name: 'Auditorio 4',
    floor: 'Piso 1',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-soporte-tecnico',
    number: 'Soporte Técnico',
    name: 'Soporte Técnico',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-juntas',
    number: 'Sala de Juntas',
    name: 'Sala de Juntas',
    floor: 'Piso 1',
    category: 'Salones Especiales', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-direccion-bienestar',
    number: 'Dirección de Bienestar',
    name: 'Dirección de Bienestar',
    floor: 'Piso 1',
    category: 'Oficinas de Bienestar', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-bano-mujeres-b',
    number: 'Baño Mujeres (segundo)',
    name: 'Baño de Mujeres (Piso 1)',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-bano-hombres-b',
    number: 'Baño Hombres (segundo)',
    name: 'Baño de Hombres (Piso 1)',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-cocina-servicios',
    number: 'Cocina de Servicios',
    name: 'Cocina de Servicios 310',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),
  Room(
    id: '310-1-auditorio-manuel-trujillo-rueda',
    number: 'Auditorio Manuel Trujillo Rueda',
    name: 'Auditorio Manuel Trujillo Rueda',
    floor: 'Piso 1',
    category: 'Auditorios', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-videoconferencias',
    number: 'Sala de Videoconferencias',
    name: 'Sala de Videoconferencias',
    floor: 'Piso 1',
    category: 'Salones Especiales', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-unidad-informatica-ufce',
    number: 'Unidad de Informática - UFCE',
    name: 'Unidad de Informática - UFCE',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Assuming this is an administrative IT unit
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-informatica-1',
    number: 'Sala de Informática 1',
    name: 'Sala de Informática 1',
    floor: 'Piso 1',
    category: 'Aulas Especializadas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-informatica-2',
    number: 'Sala de Informática 2',
    name: 'Sala de Informática 2',
    floor: 'Piso 1',
    category: 'Aulas Especializadas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-sala-informatica-3',
    number: 'Sala de Informática 3',
    name: 'Sala de Informática 3',
    floor: 'Piso 1',
    category: 'Aulas Especializadas', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-equipo-apoyo-gestion-fce',
    number: 'Equipo de Apoyo a la Gestión - FCE',
    name: 'Equipo de Apoyo a la Gestión - FCE - Decanatura y Vicedecanatura',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Added category
    isServiceRoom: false,
  ),
  Room(
      id: '310-1-oficina-programa-ori',
      number: 'Oficina ORI',
      name: 'Oficina de Programa ORI (Internacionalización)',
      floor: 'Piso 1',
      category: 'Oficinas Administrativas', // Added category
      isServiceRoom: false,
      contact: 'Correo: ori_fcebog@unal.edu.co' // Citado de la imagen proporcionada
  ),
  Room(
    id: '310-1-area-curricular-economia-desarrollo',
    number: 'Área Curricular Economía y Desarrollo',
    name: 'Área Curricular de Economía y Desarrollo',
    floor: 'Piso 1',
    category: 'Oficinas Académicas', // Added category
    professors: [
      Professor(id: 'mario_garcia_molina', name: 'Mario García Molina', department: 'Economía', role: 'Director')
    ],
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-area-curricular-contabilidad-finanzas',
    number: 'Área Curricular Contabilidad y Finanzas',
    name: 'Área Curricular de Contabilidad y Finanzas',
    floor: 'Piso 1',
    category: 'Oficinas Académicas', // Added category
    professors: [
      Professor(id: 'paula_andrea_navarro_perez', name: 'Paula Andrea Navarro Pérez', department: 'Contabilidad y Finanzas', role: 'Directora')
    ],
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-area-curricular-gestion-organizaciones',
    number: 'Área Curricular Gestión y Organizaciones',
    name: 'Área Curricular de Gestión y Organizaciones',
    floor: 'Piso 1',
    category: 'Oficinas Académicas', // Added category
    professors: [
      Professor(id: 'carlos_alberto_rodriguez', name: 'Carlos Alberto Rodríguez', department: 'Gestión y Organizaciones', role: 'Director')
    ],
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-escuela-economia',
    number: 'Escuela de Economía',
    name: 'Escuela de Economía',
    floor: 'Piso 1',
    category: 'Oficinas Académicas', // Added category
    professors: [
      Professor(id: 'oscart_arturo_benavides_gonzalez', name: 'Oscar Arturo Benavides González', department: 'Economía', role: 'Director')
    ],
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-escuela-administracion-contaduria-publica',
    number: 'Escuela de Administración y Contaduría Pública',
    name: 'Escuela de Administración y Contaduría Pública',
    floor: 'Piso 1',
    category: 'Oficinas Académicas', // Added category
    professors: [
      Professor(id: 'sandra_patricia_rojas_berrio', name: 'Sandra Patricia Rojas Berrio', department: 'Administración y Contaduría Pública', role: 'Directora')
    ],
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-cade-fce',
    number: 'CADE - FCE',
    name: 'CADE - Facultad de Ciencias Económicas',
    floor: 'Piso 1',
    category: 'Servicios', // Added category - CADE often functions as a student support service
    isServiceRoom: false,
  ),
  Room(
    id: '310-1-maquinas-expendedoras',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras de Alimentos y Bebidas',
    floor: 'Piso 1',
    category: 'Servicios', // Added category
    isServiceRoom: true,
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '310-2-salon-bienestar-estudiantes-201',
    number: 'Salón 201',
    name: 'Salón de Bienestar para Estudiantes - 201',
    floor: 'Piso 2',
    category: 'Oficinas de Bienestar', // Added category
    isServiceRoom: false,
  ),
  Room(
    id: '310-2-sala-unidad-analisis-ciencias-economicas',
    number: 'Sala Unidad de Análisis',
    name: 'Sala Unidad de Análisis en Ciencias Económicas',
    floor: 'Piso 2',
    category: 'Salas de Estudio', // Added category - often used for specialized analysis work/study
    isServiceRoom: false,
  ),
  Room(
    id: '310-2-paredes-tiza',
    number: 'Paredes para Rayar con Tiza',
    name: 'Paredes Interactivas para Rayar con Tiza',
    floor: 'Piso 2',
    category: 'Salas de Estudio', // Added category - as it promotes collaborative study
    isServiceRoom: true, // Considered an interactive service/resource for study
  ),
];