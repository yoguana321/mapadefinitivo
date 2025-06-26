// lib/utils/category_utils.dart
import 'package:flutter/material.dart';

Color getCategoryColor(String category) {
  switch (category) {
    case 'Cafeterías':
      return Colors.brown;
    case 'Bibliotecas':
      return Colors.deepPurple;
    case 'Auditorios':
      return Colors.red;
    case 'Comedor':
      return Colors.orange;
    case 'Facultad':
      return Colors.blue;
    case 'Oficinas':
      return Colors.grey;
    case 'Aulas y Oficinas':
      return Colors.teal;
    case 'Servicios':
      return Colors.green;
    default:
      return Colors.black; // Color por defecto
  }
}

IconData getCategoryIcon(String category) {
  switch (category) {
    case 'Cafeterías':
      return Icons.local_cafe;
    case 'Bibliotecas':
      return Icons.menu_book;
    case 'Auditorios':
      return Icons.mic;
    case 'Comedor':
      return Icons.restaurant;
    case 'Facultad':
      return Icons.school;
    case 'Oficinas':
      return Icons.business;
    case 'Aulas y Oficinas':
      return Icons.meeting_room;
    case 'Servicios':
      return Icons.local_hospital;
    default:
      return Icons.location_on; // Icono por defecto
  }
}