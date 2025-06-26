// lib/widgets/animated_building_marker.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../utils/category_utils.dart'; // Asegúrate de que esta ruta sea correcta para getCategoryColor

class AnimatedBuildingMarker extends StatefulWidget {
  final Building building;
  final double currentZoom;
  final VoidCallback onTap; // Usaremos VoidCallback para simplificar el tap

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

  // Umbral de zoom para mostrar el texto del marcador (ajusta si es necesario)
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

    // Si el zoom inicial ya es suficiente, animar la aparición del texto
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
      _controller.forward(); // Animación para mostrar texto
    } else if (!newShowText && oldShowText) {
      _controller.reverse(); // Animación para ocultar texto
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color markerColor = getCategoryColor(widget.building.category);
    final IconData markerIcon = widget.building.icon; // El icono del building model
    final bool showText = widget.currentZoom >= _zoomThresholdForText;

    return GestureDetector(
      onTap: widget.onTap, // Conecta el tap al callback proporcionado
      child: SizedBox(
        width: 150, // Ancho suficiente para el texto más largo
        height: 100, // Alto suficiente para el texto + pin
        child: Stack(
          alignment: Alignment.bottomCenter, // Alinea el contenido a la parte inferior central
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
                      color: markerColor,
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
                    color: markerColor,
                  ),
                ],
              ),
            ),
            // La etiqueta de texto flotante (animada)
            if (showText)
              Positioned(
                // Posiciona la etiqueta por encima del pin
                bottom: 40, // Ajusta esta altura si el texto se superpone demasiado con otros elementos
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: markerColor.withOpacity(0.9),
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
                        constraints: const BoxConstraints(maxWidth: 100), // Limita el ancho del texto
                        child: Text(
                          widget.building.name, // Muestra el nombre completo del edificio
                          textAlign: TextAlign.center,
                          maxLines: 2, // Permite hasta 2 líneas de texto
                          overflow: TextOverflow.ellipsis, // Si excede, pone "..."
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