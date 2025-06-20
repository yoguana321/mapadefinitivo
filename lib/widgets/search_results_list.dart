// lib/widgets/search_results_list.dart
import 'package:flutter/material.dart';
import '../models/building.dart'; // Asegúrate de importar tu modelo Building

class SearchResultsList extends StatelessWidget {
  final List<Building> filteredBuildings;
  final ValueChanged<Building> onBuildingSelected; // Callback para cuando se selecciona un edificio

  const SearchResultsList({
    super.key,
    required this.filteredBuildings,
    required this.onBuildingSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (filteredBuildings.isEmpty) {
      return const SizedBox.shrink(); // No mostrar nada si no hay resultados
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.4, // Limita la altura
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredBuildings.length,
            itemBuilder: (context, index) {
              final result = filteredBuildings[index];
              return ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(result.name),
                subtitle: Text(result.info),
                // onBuildingSelected(result) ahora solo informará a MapScreen que se seleccionó
                onTap: () => onBuildingSelected(result),
              );
            },
          ),
        ),
      ),
    );
  }
}