import 'package:latlong2/latlong.dart';
import '../models/building.dart';

final List<Building> allBuildings = [
  Building(
    name: '401 - El Viejo',
    info: 'Auditorio Juan Bautista, Cafetería Minka, Sala Oasis. Edificio histórico de Ingeniería.',
    coords: LatLng(4.637138, -74.083005), // Coordenadas reales desde OSM ✔️
    category: 'Cafeterías',
  ),
  Building(
    name: 'Biblioteca Central Gabriel García Márquez',
    info: 'Principal biblioteca del campus, con amplias salas de estudio y recursos.',
    coords: LatLng(4.635586, -74.083288), // Wikipedia OSM :contentReference[oaicite:2]{index=2}
    category: 'Bibliotecas',
  ),
  Building(
    name: 'Auditorio León de Greiff',
    info: 'Principal auditorio para eventos y conciertos dentro de la Ciudad Universitaria.',
    coords: LatLng(4.635692, -74.082237), // Kartographer OSM :contentReference[oaicite:3]{index=3}
    category: 'Auditorios',
  ),
  Building(
    name: 'Comedor Central',
    info: 'Comedor principal del campus, ofrece desayunos y almuerzos para estudiantes.',
    coords: LatLng(4.634900, -74.082900), // Estimado desde OSM vista visual
    category: 'Comedor',
  ),
  Building(
    name: 'Facultad de Medicina',
    info: 'Edificio de la Facultad de Medicina, incluye aulas y laboratorios.',
    coords: LatLng(4.636000, -74.083500), // Estimado desde vista OSM
    category: 'Facultad',
  ),
  Building(
    name: 'Oficina de Registro',
    info: 'Gestión de matrículas, certificados y trámites académicos.',
    coords: LatLng(4.637500, -74.081500), // Confirmada previamente
    category: 'Oficinas',
  ),
  Building(
    name: '453 - GUILLERMINA URIBE BONE',
    info: 'Nombrado en honor a Guillermina Uribe Bone. Edificio de aulas y oficinas.',
    coords: LatLng(4.638462, -74.084000), // Coordenadas reales desde OSM ✔️
    category: 'Aulas y Oficinas',
  ),
  Building(
    name: 'Enfermería',
    info: 'Servicios de salud y primeros auxilios dentro del campus.',
    coords: LatLng(4.635750, -74.083700), // Estimado desde OSM
    category: 'Servicios',
  ),
];

final List<String> buildingCategories = [
  'Todos',
  'Cafeterías',
  'Bibliotecas',
  'Auditorios',
  'Comedor',
  'Facultad',
  'Oficinas',
  'Aulas y Oficinas',
  'Servicios',
];

