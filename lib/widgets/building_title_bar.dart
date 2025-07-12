// lib/widgets/building_title_bar.dart
import 'package:flutter/material.dart';

class BuildingTitleBar extends StatelessWidget {
  final String buildingName;
  final VoidCallback onClose;

  const BuildingTitleBar({
    Key? key,
    required this.buildingName,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 0), // Ajustar padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              buildingName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface, // Color de texto normal
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 24),
            onPressed: onClose,
            color: theme.iconTheme.color, // Color del icono según el tema
            tooltip: 'Cerrar',
          ),
        ],
      ),
    );
  }
}