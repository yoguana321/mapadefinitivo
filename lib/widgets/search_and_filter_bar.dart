// lib/widgets/search_and_filter_bar.dart
import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onCategorySelected;

  const SearchAndFilterBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.categories,
    required this.selectedCategory,
    required this.onSearchChanged,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de Búsqueda
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: searchController,
              focusNode: searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Buscar edificio o aula...', // Actualizado el hint
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    onSearchChanged(''); // Notifica que la búsqueda se ha limpiado
                    searchFocusNode.requestFocus(); // Mantener el foco
                  },
                )
                    : null,
                border: InputBorder.none,
              ),
              onChanged: onSearchChanged,
            ),
          ),
        ),
        const SizedBox(height: 8), // Espacio entre la barra de búsqueda y el filtro

        // Filtro de categoría con Chips
        SizedBox(
          height: 40, // Altura fija para los chips
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  onSelected: (bool selected) {
                    if (selected) {
                      onCategorySelected(category);
                    }
                  },
                  selectedColor: Theme.of(context).primaryColor.withOpacity(0.2), // Color cuando está seleccionado
                  // backgroundColor: Colors.white, // Puedes definir un color de fondo si lo deseas
                  // shadowColor: Colors.black, // Color de sombra
                  elevation: 2, // Sombra para que se vean como "cuadros"
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}