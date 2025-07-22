import '/models/room.dart';
import '/models/professor.dart';

const String info564 = 'El Edificio Aulas de Ciencias Gloria Galeano Garcés, diseñado por el arquitecto Guillermo Fisher, fue concebido para ampliar los espacios de instrucción académica, específicamente para clases magistrales de la Facultad de Ciencias de la Universidad Nacional. Su diseño arquitectónico circular fomenta la interacción y colaboración grupal, y destaca por su impronta sostenible y gestión eficiente que permitió un notable ahorro de presupuesto y entrega anticipada.';
const String history564 = 'Nombrado en honor a Gloria Galeano Garcés. Fue construido con un diseño que prioriza la interacción académica y la sostenibilidad, logrando ser entregado un mes antes de lo estipulado gracias a una eficiente gestión.';
const Map<String, String> hours564 = {}; // No specific hours provided in the text
const String contactInfo564 = 'Facultad de Ciencias UNAL Sede Bogotá'; // Inferred from the text


final List<Room> rooms564 = [
  // --- INFORMACIÓN GENERAL/SERVICIOS ---
  Room(id: '564-bebederos-parque', number: 'General', name: 'Bebederos (Parque aledaño)', floor: 'Exterior', isServiceRoom: true, category: 'Servicios'),

  // --- SÓTANO (PISO -1) ---
  Room(id: '564-s1-auditorio-1', number: 'Auditorio 1', name: 'Auditorio Dora Türk de García Banús', floor: 'Sótano', isServiceRoom: false, category: 'Auditorios'),
  Room(id: '564-s1-auditorio-2', number: 'Auditorio 2', name: 'Auditorio Stella Torres de Young', floor: 'Sótano', isServiceRoom: false, category: 'Auditorios'),
  Room(id: '564-s1-bano-hombres', number: 'Baño Hombres', name: 'Baño Hombres', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-s1-bano-mujeres', number: 'Baño Mujeres', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-s1-ascensor', number: 'Ascensor', name: 'Ascensor', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-s1-deposito-1', number: 'Depósito 1', name: 'Depósito', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-s1-deposito-2', number: 'Depósito 2', name: 'Depósito', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-s1-planta-electrica', number: 'Planta Eléctrica', name: 'Planta Eléctrica', floor: 'Sótano', isServiceRoom: true, category: 'Servicios'),

  // --- PISO 1 ---
  Room(id: '564-p1-salon-101', number: '101', name: 'Salón 101', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-102', number: '102', name: 'Salón 102', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-103', number: '103', name: 'Salón 103', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-104', number: '104', name: 'Salón 104', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-105', number: '105', name: 'Salón 105', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-106', number: '106', name: 'Salón 106', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-salon-107', number: '107', name: 'Salón 107', floor: 'Piso 1', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p1-cafeteria', number: 'Cafetería', name: 'Cafetería', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'), // Using 'Servicios' for now, could be 'Cafetería' if added to switch
  Room(id: '564-p1-bano-unisex', number: 'Baño Unisex', name: 'Baño Unisex', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p1-bano-accesible', number: 'Baño Accesible', name: 'Baño Accesible', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p1-maquinas-expendedoras', number: 'Máquinas Expendedoras', name: 'Máquinas Expendedoras', floor: 'Piso 1', isServiceRoom: true, category: 'Servicios'),

  // --- PISO 2 ---
  Room(id: '564-p2-salon-201', number: '201', name: 'Salón 201', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-202', number: '202', name: 'Salón 202', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-203', number: '203', name: 'Salón 203', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-204', number: '204', name: 'Salón 204', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-205', number: '205', name: 'Salón 205', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-206', number: '206', name: 'Salón 206', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-salon-207', number: '207', name: 'Salón 207', floor: 'Piso 2', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p2-maquinas-expendedoras', number: 'Máquinas Expendedoras', name: 'Máquinas Expendedoras', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p2-bano-hombres', number: 'Baño Hombres', name: 'Baño Hombres', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p2-bano-mujeres', number: 'Baño Mujeres', floor: 'Piso 2', isServiceRoom: true, category: 'Servicios'),

  // --- PISO 3 ---
  Room(id: '564-p3-salon-301', number: '301', name: 'Salón 301', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-302', number: '302', name: 'Salón 302', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-303', number: '303', name: 'Salón 303', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-304', number: '304', name: 'Salón 304', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-305', number: '305', name: 'Salón 305', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-306', number: '306', name: 'Salón 306', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-salon-307', number: '307', name: 'Salón 307', floor: 'Piso 3', isServiceRoom: false, category: 'Aulas'),
  Room(id: '564-p3-maquinas-expendedoras', number: 'Máquinas Expendedoras', name: 'Máquinas Expendedoras', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p3-bano-hombres', number: 'Baño Hombres', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),
  Room(id: '564-p3-bano-mujeres', number: 'Baño Mujeres', floor: 'Piso 3', isServiceRoom: true, category: 'Servicios'),

  // --- PISO 4 (Cubierta/Terraza) ---
  Room(id: '564-p4-cubierta', number: 'Cubierta', name: 'Cubierta/Roof', floor: 'Piso 4', isServiceRoom: true, category: 'Salones Especiales'), // Changed to Salones Especiales to fit existing categories
  Room(id: '564-p4-terraza', number: 'Terraza', name: 'Terraza', floor: 'Piso 4', isServiceRoom: true, category: 'Salones Especiales'), // Changed to Salones Especiales
];

final List<Room> specialServices564 = [];