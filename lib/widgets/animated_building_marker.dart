// lib/widgets/animated_building_marker.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
// Quita esta importación si getCategoryColor no se usa más aquí
// import '../utils/category_utils.dart'; // Asegúrate de que esta ruta sea correcta para getCategoryColor


class AnimatedBuildingMarker extends StatefulWidget {
  final Building building;
  final double currentZoom;
  final VoidCallback onTap;

  const AnimatedBuildingMarker({
    super.key,
    required this.building,
    required this.currentZoom,
    required this.onTap,
  });

  @override
  State<AnimatedBuildingMarker> createState() => _AnimatedBuildingMarkerState();
}

class _AnimatedBuildingMarkerState extends State<AnimatedBuildingMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  static const double _zoomThresholdForText = 16.5;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    if (widget.currentZoom >= _zoomThresholdForText) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedBuildingMarker oldWidget) {
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
  Widget build(BuildContext context) {
    // CAMBIO AQUÍ: Usamos directamente el markerColor del objeto Building
    final Color markerColor = widget.building.markerColor ?? Colors.black; // Asegurarse de un color por defecto si es nulo

    final IconData markerIcon = widget.building.icon;
    final bool showText = widget.currentZoom >= _zoomThresholdForText;

    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 150,
        height: 100,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // El "pin" inferior (el círculo y la línea)
            Positioned(
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: markerColor, // Ahora usará Colors.red.shade700, Colors.teal.shade700, etc.
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      markerIcon,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 3,
                    height: 12,
                    color: markerColor, // Usará el color del edificio
                  ),
                ],
              ),
            ),
            // La etiqueta de texto flotante (animada)
            if (showText)
              Positioned(
                bottom: 40,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: markerColor.withOpacity(0.9), // Usará el color del edificio
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 100),
                        child: Text(
                          widget.building.shortName, // Cambié a shortName porque parece más apropiado para la etiqueta del marcador
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}