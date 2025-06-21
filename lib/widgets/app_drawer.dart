import 'package:flutter/material.dart';
import 'dart:ui'; // Importante para BackdropFilter

// CONTROL DE LA BARRA LATERAL (SIDEBARD)

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
          Container(
            height: 180, // Ajusta la altura que desees
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/CAMPUS_SLIDEBAR.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Puedes agregar más elementos encima si deseas
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: const Text(
                            'M.I UNAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 3.0,
                                  color: Colors.black,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
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
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Pantalla de Inicio'),
            onTap: () {
              Navigator.pop(context);
              onNavigateToHome();
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Ver Mapa'),
            onTap: () {
              Navigator.pop(context);
              onNavigateToMap();
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Filtrar por Categoría',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ...categories.map((category) {
            return ListTile(
              title: Text(category),
              leading: Radio<String>(
                value: category,
                groupValue: selectedCategory,
                onChanged: (String? value) {
                  Navigator.pop(context);
                  if (value != null) {
                    onCategorySelected(value);
                  }
                },
              ),
              onTap: () {
                Navigator.pop(context);
                onCategorySelected(category);
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
