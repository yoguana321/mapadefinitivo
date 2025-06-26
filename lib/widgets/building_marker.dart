// lib/widgets/building_marker.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
// Asegúrate de que las rutas sean correctas si getCategoryColor y getCategoryIcon
// están en un archivo de utilidades separado. Si no, puedes definirlas aquí.

// Estas funciones pueden estar en un archivo como utils/category_utils.dart
// Si no lo tienes, puedes copiarlas aquí por simplicidad.
Color getCategoryColor(String category) {
  switch (category) {
    case 'Facultad': return Colors.brown;
    case 'Aulas y Oficinas': return Colors.blue;
    case 'Auditorio': return Colors.red;
    case 'Biblioteca': return Colors.purple;
    case 'Comedor': return Colors.orange;
    case 'Oficinas': return Colors.grey;
    case 'Servicios': return Colors.green;
    case 'Cafeterías': return Colors.brown[600]!; // Color más oscuro para cafeterías
    default: return Colors.black;
  }
}

IconData getCategoryIcon(String category) {
  switch (category) {
    case 'Facultad': return Icons.school;
    case 'Aulas y Oficinas': return Icons.business;
    case 'Auditorio': return Icons.music_note;
    case 'Biblioteca': return Icons.local_library;
    case 'Comedor': return Icons.restaurant;
    case 'Oficinas': return Icons.business_center;
    case 'Servicios': return Icons.medical_services;
    case 'Cafeterías': return Icons.local_cafe;
    default: return Icons.location_on;
  }
}


class BuildingMarker extends StatefulWidget {
  final Building building;
  final VoidCallback onTap;
  final double currentZoom;

  const BuildingMarker({
    super.key,
    required this.building,
    required this.onTap,
    required this.currentZoom,
  });

  @override
  State<BuildingMarker> createState() => _BuildingMarkerState();
}

class _BuildingMarkerState extends State<BuildingMarker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  static const double _zoomThresholdForText = 17.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(_fadeAnimation);

    if (widget.currentZoom >= _zoomThresholdForText) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant BuildingMarker oldWidget) {
    super.didUpdateWidget(oldWidget);
    final bool oldShowText = oldWidget.currentZoom >= _zoomThresholdForText;
    final bool newShowText = widget.currentZoom >= _zoomThresholdForText;

    if (newShowText && !oldShowText) {
      _controller.forward();
    } else if (!newShowText && oldShowText) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = getCategoryColor(widget.building.category);
    final IconData icon = getCategoryIcon(widget.building.category);
    final bool showText = widget.currentZoom >= _zoomThresholdForText;

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Por defecto, Column alinea sus hijos en el top-center si no se especifica alignment.
        // Esto significa que el punto del marcador estará abajo, y el chip arriba.
        children: [
          if (showText)
            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 16, color: Colors.white),
                      const SizedBox(width: 6),
                      Text(
                        widget.building.shortName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(height: 4),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}