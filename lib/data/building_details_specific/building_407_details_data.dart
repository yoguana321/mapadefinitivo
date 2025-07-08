// lib/data/building_details_specific/building_407_details_data.dart

import '/models/room.dart';
import '/models/professor.dart';

const String info407 = 'El Edificio 407 de la Facultad de Ingeniería alberga programas de posgrado en Materiales. Cuenta con aulas, laboratorios especializados y oficinas para docencia e investigación, siendo un pilar para la formación avanzada.';
const String history407 = '''
El Edificio 407 de la Universidad Nacional de Colombia, sede Bogotá, es una infraestructura clave para la Facultad de Ingeniería. Fue construido durante las décadas de 1960 y 1970, en un periodo de expansión y consolidación del campus universitario.

Desde su creación, el edificio 407 ha sido fundamental para el desarrollo académico y la investigación, albergando específicamente programas de posgrado en el área de Materiales. Cuenta con aulas modernas, laboratorios de vanguardia y oficinas destinadas a la docencia y la investigación de alto nivel.

En el año 2019, el edificio fue sometido a una significativa renovación, que incluyó importantes mejoras en su infraestructura y sistemas de ventilación, asegurando un ambiente óptimo para la comunidad académica.
''';
const Map<String, String> hours407 = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 18:00',
  'Domingo': 'Cerrado', // O puedes omitir los días cerrados si lo prefieres
  'Feriado': 'Cerrado', // Considera un manejo para días feriados
};
const String contactInfo407 = 'Contacto: Secretaría de Posgrados de Materiales - Facultad de Ingeniería.'; // Puedes añadir un correo o teléfono real si lo tienes.

final List<Room> rooms407 = [
  // --- PRIMER PISO ---
  Room(
    id: '407-1-lab-tratamientos-termicos-106',
    number: 'Laboratorio 106',
    name: 'Laboratorio 106 Tratamientos Térmicos',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-lab-ensayos-no-destructivos-104',
    number: 'Laboratorio 104',
    name: 'Laboratorio 104 Ensayos No Destructivos / Soldadura / Fundición y Pulvimetalurgia',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-lab-ensayos-mecanicos-deformacion-plastica-102',
    number: 'Laboratorio 102',
    name: 'Laboratorio 102 Ensayos Mecánicos y Deformación Plástica',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-lab-interfacultades-ensayos-mecanicos-103',
    number: 'Laboratorio 103',
    name: 'Laboratorio Interfacultades Ensayos Mecánicos 103',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-sala-cam-101',
    number: 'Sala Cam 101',
    name: 'Sala Cam 101',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-salon-101',
    number: 'Salón 101',
    name: 'Salón 101 (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-salon-102',
    number: 'Salón 102',
    name: 'Salón 102 (Piso 1)',
    floor: 'Piso 1',
    isServiceRoom: false,
  ),
  Room(
    id: '407-1-prof-jose-manuel-arroyo-juan-hernando-reyes-103',
    number: 'Salón 103',
    name: 'Oficina / Salón 103',
    floor: 'Piso 1',
    professors: [
      Professor(id: 'jose_manuel_arroyo', name: 'José Manuel Arroyo', department: 'Ingeniería de Materiales'),
      Professor(id: 'juan_hernando_reyes', name: 'Juan Hernando Reyes', department: 'Ingeniería de Materiales'),
    ],
  ),

  // --- SEGUNDO PISO ---
  Room(
    id: '407-2-auditorio-abel-morales-gilede-200',
    number: 'Auditorio 200',
    name: 'Auditorio Abel Morales Gilede (Salón 200)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '407-2-salon-201',
    number: 'Salón 201',
    name: 'Salón 201',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '407-2-salon-202',
    number: 'Salón 202',
    name: 'Salón 202',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '407-2-secretaria-ing-mecanica-mecatronica-203',
    number: 'Secretaría 203',
    name: 'Secretaría de Ingeniería Mecánica y Mecatrónica (Salón 203)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '407-2-metalurgia-coordinacion-204',
    number: 'Metalurgia Coordinación 204',
    name: 'Coordinación de Metalurgia (Salón 204)',
    floor: 'Piso 2',
    isServiceRoom: false,
  ),
  Room(
    id: '407-2-prof-edgar-espejo-mora-205',
    number: 'Salón 205',
    name: 'Oficina 205',
    floor: 'Piso 2',
    professors: [Professor(id: 'edgar_espejo_mora', name: 'Edgar Espejo Mora', department: 'Ingeniería de Materiales')],
  ),
  Room(
    id: '407-2-prof-monica-monsalve-arias-206',
    number: 'Salón 206',
    name: 'Oficina 206',
    floor: 'Piso 2',
    professors: [Professor(id: 'monica_monsalve_arias', name: 'Mónica Monsalve Arias', department: 'Ingeniería de Materiales')],
  ),
  Room(
    id: '407-2-prof-jhon-jairo-olaya-207',
    number: 'Salón 207',
    name: 'Oficina 207',
    floor: 'Piso 2',
    professors: [Professor(id: 'jhon_jairo_olaya', name: 'Jhon Jairo Olaya', department: 'Ingeniería de Materiales')],
  ),
  Room(
    id: '407-2-prof-rodolfo-rodriguez-baracaldo-208',
    number: 'Salón 208',
    name: 'Oficina 208',
    floor: 'Piso 2',
    professors: [Professor(id: 'rodolfo_rodriguez_baracaldo', name: 'Rodolfo Rodríguez Baracaldo', department: 'Ingeniería de Materiales')],
  ),
  Room(
    id: '407-2-prof-irma-angarita-moncaleano-209',
    number: 'Salón 209',
    name: 'Oficina 209',
    floor: 'Piso 2',
    professors: [Professor(id: 'irma_angarita_moncaleano', name: 'Irma Angarita Moncaleano', department: 'Ingeniería de Materiales')],
  ),
  Room(
    id: '407-2-prof-carlos-julio-cortes-210',
    number: 'Salón 210',
    name: 'Oficina 210',
    floor: 'Piso 2',
    professors: [Professor(id: 'carlos_julio_cortes', name: 'Carlos Julio Cortés', department: 'Ingeniería de Materiales')],
  ),
];