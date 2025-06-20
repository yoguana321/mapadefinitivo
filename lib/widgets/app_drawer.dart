import 'package:flutter/material.dart';

// Definición de callbacks para la navegación y el filtro
typedef FilterCategorySelected = void Function(String category);
typedef NavigateToMap = void Function();
typedef NavigateToHome = void Function();

// Widget para el cajón de navegación (Drawer) de la aplicación
class AppDrawer extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final FilterCategorySelected onCategorySelected;
  final NavigateToMap onNavigateToMap;
  final NavigateToHome onNavigateToHome;

  const AppDrawer({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategorySelected,
    required this.onNavigateToMap,
    required this.onNavigateToHome,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text(
              'Menú Mi UNAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Pantalla de Inicio'),
            onTap: () {
              Navigator.pop(context);
              onNavigateToHome(); // Llama al callback para navegar a Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Ver Mapa'),
            onTap: () {
              Navigator.pop(context);
              onNavigateToMap(); // Llama al callback para navegar al Mapa
            },
          ),
          const Divider(), // Separador visual
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Filtrar por Categoría',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          // Mapea las categorías a ListTiles con Radio buttons
          ...categories.map((category) {
            return ListTile(
              title: Text(category),
              leading: Radio<String>(
                value: category,
                groupValue: selectedCategory,
                onChanged: (String? value) {
                  Navigator.pop(context); // Cierra el drawer después de seleccionar
                  if (value != null) {
                    onCategorySelected(value); // Notifica al padre sobre la categoría seleccionada
                  }
                },
              ),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                onCategorySelected(category); // Notifica al padre
              },
            );
          }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Acerca de'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidad "Acerca de" (próximamente)')),
              );
            },
          ),
        ],
      ),
    );
  }
}