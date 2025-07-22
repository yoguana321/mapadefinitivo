import '/models/room.dart';
import '/models/professor.dart'; // Keep if Professor model is used elsewhere

const String info103 = 'El Edificio 103, conocido como el Polideportivo, es un centro clave para las actividades deportivas y de bienestar universitario. Alberga el Comedor Central, el Centro de Recursos y diversas oficinas de apoyo estudiantil, como la de Acompañamiento Integral.';
const String history103 = 'Historia pendiente. Se necesita información sobre la construcción y evolución del Edificio 103.';
const Map<String, String> hours103 = {
  'Lunes': '06:00 - 22:00',
  'Martes': '06:00 - 22:00',
  'Miércoles': '06:00 - 22:00',
  'Jueves': '06:00 - 22:00',
  'Viernes': '06:00 - 22:00',
  'Sábado': '07:00 - 14:00',
  'Domingo': 'Cerrado',
};
const String contactInfo103 = 'Contacto: Oficina de Acompañamiento Integral: aaintegral@unal.edu.co';

final List<Room> rooms103 = [
  // --- OFICINAS Y OTROS ESPACIOS ---
  Room(
    id: '103-oficina-102',
    number: 'Oficina 102',
    name: 'Proyecto de Equidad de Género',
    floor: 'Piso 1', // Asumimos Piso 1
    category: 'Oficinas Administrativas', // Assign category
    isServiceRoom: false,
    description: 'Oficina del proyecto de equidad de género.',
  ),
  Room(
    id: '103-oficina-103',
    number: 'Oficina 103',
    name: 'Promotores de Convivencia',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Assign category
    isServiceRoom: false,
  ),
  Room(
    id: '103-oficina-brigada',
    number: 'Brigada',
    name: 'Oficina de la Brigada',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Assign category
    isServiceRoom: false,
  ),
  Room(
    id: '103-oficina-cprae',
    number: 'CPRAE',
    name: 'Oficina de la CPRAE',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Assign category
    isServiceRoom: false,
  ),
  Room(
    id: '103-oficina-jefatura-acompanamiento',
    number: 'Jefatura de Acompañamiento',
    name: 'Oficina de la Jefatura de Acompañamiento',
    floor: 'Piso 1',
    category: 'Oficinas Administrativas', // Assign category
    isServiceRoom: false,
  ),
  Room(
    id: '103-oficina-trabajo-social',
    number: 'Trabajo Social',
    name: 'Oficina de Trabajo Social',
    floor: 'Piso 1',
    category: 'Oficinas de Bienestar', // More specific category for student support
    isServiceRoom: false,
  ),
  Room(
    id: '103-oficina-acompanamiento-integral',
    number: 'Acompañamiento Integral',
    name: 'Oficina de Acompañamiento Integral (Principal)',
    floor: 'Piso 1',
    category: 'Oficinas de Bienestar', // Specific category for student support
    isServiceRoom: false,
    contact: 'aaintegral@unal.edu.co',
  ),
  Room(
    id: '103-centro-recursos',
    number: 'Centro de Recursos',
    name: 'Centro de Recursos',
    floor: 'Piso 1',
    category: 'Servicios', // Could also be 'Salas de Estudio' if used for study, but 'Servicios' for a general resource center
    isServiceRoom: false, // Could be true if it's primarily a service point
  ),

  // --- ÁREAS DE SERVICIO Y OCIO ---
  Room(
    id: '103-comedor-central',
    number: 'Comedor Central',
    name: 'Comedor Central',
    floor: 'Piso 1',
    category: 'Servicios', // Category for dining
    isServiceRoom: true,
  ),
  Room(
    id: '103-pared-escalar',
    number: 'Pared para Escalar',
    name: 'Pared para escalar',
    floor: 'Piso 1',
    category: 'Salones Especiales', // This is a specialized recreational space
    isServiceRoom: true,
  ),
  Room(
    id: '103-cafeteria-1',
    number: 'Cafetería 1',
    name: 'Cafetería',
    floor: 'Piso 1',
    category: 'Servicios', // Category for food service
    isServiceRoom: true,
  ),
  Room(
    id: '103-cafeteria-2',
    number: 'Cafetería 2',
    name: 'Cafetería',
    floor: 'Piso 1',
    category: 'Servicios', // Category for food service
    isServiceRoom: true,
  ),
  Room(
    id: '103-bebederos',
    number: 'Bebederos',
    name: 'Bebederos',
    floor: 'General',
    category: 'Servicios', // Utility service
    isServiceRoom: true,
  ),
  Room(
    id: '103-microondas',
    number: 'Microondas',
    name: 'Microondas (Comedor Central)',
    floor: 'Piso 1',
    category: 'Servicios', // Service amenity
    isServiceRoom: true,
  ),
  Room(
    id: '103-maquinas-expendedoras',
    number: 'Máquinas Expendedoras',
    name: 'Máquinas Expendedoras de Alimentos y Bebidas',
    floor: 'Piso 1',
    category: 'Servicios', // Service amenity
    isServiceRoom: true,
  ),
];

final List<Room> specialServices103 = [
  Room(
    id: '103-dispensador-condones',
    number: 'Dispensadores de Condones',
    name: 'Dispensadores de Condones',
    floor: 'General',
    category: 'Servicios', // Health-related service
    isServiceRoom: true,
    isAccessible: true, // Asumimos que son accesibles
  ),
];