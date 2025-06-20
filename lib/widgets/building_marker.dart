import 'package:flutter/material.dart';
import '../models/building.dart';
import 'dart:ui'; // Para Offset si Material no lo incluye

class BuildingMarker extends StatefulWidget {
  final Building building;
  final Function(Building) onTap;
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

class _BuildingMarkerState extends State<BuildingMarker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Map<String, Object> _getCategoryIconAndColor(String category) {
    switch (category) {
      case 'Cafeterías':
        return {'icon': Icons.local_cafe, 'color': Colors.brown.shade600};
      case 'Bibliotecas':
        return {'icon': Icons.book, 'color': Colors.deepPurple};
      case 'Auditorios':
        return {'icon': Icons.mic, 'color': Colors.red.shade700};
      case 'Comedor':
        return {'icon': Icons.restaurant, 'color': Colors.orange.shade700};
      case 'Facultad':
        return {'icon': Icons.school, 'color': Colors.blue.shade700};
      case 'Oficinas':
        return {'icon': Icons.business, 'color': Colors.grey.shade700};
      case 'Aulas y Oficinas':
        return {'icon': Icons.meeting_room, 'color': Colors.teal.shade700};
      case 'Servicios':
        return {'icon': Icons.medical_services, 'color': Colors.green.shade700};
      default:
        return {'icon': Icons.location_on, 'color': Colors.blue};
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = _getCategoryIconAndColor(widget.building.category);
    final icon = categoryData['icon'] as IconData;
    final color = categoryData['color'] as Color;

    double iconSize = 30 + (widget.currentZoom - 15) * 2;
    iconSize = iconSize.clamp(24, 48);

    double fontSize = 10 + (widget.currentZoom - 15) * 0.8;
    fontSize = fontSize.clamp(8, 16);

    return GestureDetector(
      onTap: () => widget.onTap(widget.building),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: Transform.scale(
              scale: _animation.value,
              alignment: Alignment.bottomCenter,
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Flecha apuntando al punto exacto
                    Transform.translate(
                      offset: const Offset(0, 5),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: iconSize * 0.6,
                        color: color,
                      ),
                    ),
                    // Ícono de categoría
                    Icon(
                      icon,
                      size: iconSize,
                      color: color,
                      shadows: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    // Nombre del edificio
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        widget.building.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                          shadows: const [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
