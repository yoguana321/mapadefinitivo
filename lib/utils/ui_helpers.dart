// lib/utils/ui_helpers.dart

import 'package:flutter/material.dart';

// Título para secciones como "Historia" o "Distribución"
Widget buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}

// Subtítulos para agrupaciones dentro de ExpansionTile (ej. "Aulas del Primer Piso")
Widget buildSubtitle(String subtitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Text(
      subtitle,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
    ),
  );
}

// Construye un ListTile genérico con ícono, título y subtítulo
ListTile buildListTile(IconData icon, String title, [String? subtitle]) {
  return ListTile(
    leading: Icon(icon, color: Colors.blueAccent[700], size: 28),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    ),
    subtitle: subtitle != null
        ? Text(
      subtitle,
      style: TextStyle(color: Colors.grey[700], fontSize: 14),
    )
        : null,
    onTap: () {
      print('Tapped on: $title');
      // TODO: Implementar navegación o acción detallada
    },
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
  );
}

// Construye un ExpansionTile para cada piso
ExpansionTile buildFloorExpansionTile(BuildContext context, {required int floorNumber, required String title, required List<Widget> items}) {
  IconData leadingIcon = getFloorIcon(floorNumber);
  return ExpansionTile(
    leading: Icon(leadingIcon, color: Theme.of(context).primaryColor, size: 30),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
    collapsedIconColor: Colors.grey[600],
    iconColor: Theme.of(context).primaryColor,
    childrenPadding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
    children: items,
  );
}

// Helper para obtener el icono del piso
IconData getFloorIcon(int floorNumber) {
  switch (floorNumber) {
    case 0: return Icons.info_outline; // Para "Servicios Generales"
    case 1: return Icons.filter_1;
    case 2: return Icons.filter_2;
    case 3: return Icons.filter_3;
    case 4: return Icons.filter_4;
    case 5: return Icons.filter_5;
  // Puedes añadir más casos según sea necesario
    default: return Icons.layers;
  }
}

// Construye ListTiles para las aulas (reutilizable para 453)
List<Widget> buildAulaListTiles(Map<String, String?> aulas, {IconData? Function(String aula)? hasCustomIcon}) {
  return aulas.entries.map((entry) {
    final aulaNumber = entry.key;
    final aulaSubtitle = entry.value;
    final customIcon = hasCustomIcon != null ? hasCustomIcon(aulaNumber) : null;
    return buildListTile(customIcon ?? Icons.room, 'Aula $aulaNumber', aulaSubtitle);
  }).toList();
}