// lib/widgets/map_controls.dart
// lib/widgets/map_controls.dart
import 'package:flutter/material.dart';

class MapControls extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;
  final bool isSearchVisible;
  final VoidCallback onMyLocationPressed; // <-- Mantenemos el callback, pero su acción será diferente en MapScreen
  final VoidCallback onBackButtonPressed;

  const MapControls({
    super.key,
    required this.onMenuPressed,
    required this.onSearchPressed,
    required this.isSearchVisible,
    required this.onMyLocationPressed,
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Fila Superior de botones
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: FloatingActionButton(
                    heroTag: 'menuButton',
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: onMenuPressed,
                    child: const Icon(Icons.menu, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: FloatingActionButton(
                    heroTag: 'searchButton',
                    mini: true,
                    backgroundColor: Colors.white,
                    onPressed: onSearchPressed,
                    child: Icon(isSearchVisible ? Icons.close : Icons.search, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(), // Empuja los de abajo hacia el final
        // Fila Inferior de botones
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'myLocationButton',
                  mini: true,
                  backgroundColor: Colors.white,
                  onPressed: onMyLocationPressed, // <-- El botón sigue ahí, su acción cambia
                  child: const Icon(Icons.gps_fixed, color: Colors.black),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'backButton',
                  backgroundColor: Colors.white,
                  onPressed: onBackButtonPressed,
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}