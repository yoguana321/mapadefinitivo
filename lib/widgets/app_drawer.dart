// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import 'dart:ui'; // Importante para BackdropFilter
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Asegúrate de que la ruta sea correcta

// Definición de callbacks para la navegación y el filtro
// MODIFICADO: El callback de filtro ahora acepta un parámetro subCategory opcional.
typedef FilterCategorySelected = void Function(String category, {String? subCategory});
typedef NavigateToMap = void Function();
typedef NavigateToHome = void Function();
typedef NavigateToFavorites = void Function();

class AppDrawer extends StatelessWidget {
  final String? selectedCategory;
  // NUEVO: Añadir selectedSubCategory y facultySubcategories
  final String? selectedSubCategory;
  final List<String> categories; // Estas son ahora las mainBuildingCategories
  final Map<String, List<String>> facultySubcategories; // NUEVO: Para las subcategorías de Facultades
  final FilterCategorySelected onCategorySelected; // MODIFICADO: El tipo de callback
  final NavigateToMap onNavigateToMap;
  final NavigateToHome onNavigateToHome;
  final NavigateToFavorites onNavigateToFavorites;

  const AppDrawer({
    super.key,
    required this.selectedCategory,
    this.selectedSubCategory, // NUEVO: Debe ser opcional o con valor por defecto si no siempre se usa
    required this.categories,
    required this.facultySubcategories, // NUEVO: Requerido para pasar las subcategorías
    required this.onCategorySelected,
    required this.onNavigateToMap,
    required this.onNavigateToHome,
    required this.onNavigateToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/CAMPUS_SLIDEBAR.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withAlpha(77),
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
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Favoritos'),
            onTap: () {
              Navigator.pop(context);
              onNavigateToFavorites();
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
          // MODIFICADO: Lógica de categorías y subcategorías
          ...categories.map((category) {
            // Manejo especial para la categoría "Facultades"
            if (category == 'Facultades') {
              return ExpansionTile(
                leading: _getCategoryIcon(category), // Icono para facultades
                title: Text(
                  category,
                  style: TextStyle(
                    fontWeight: selectedCategory == category ? FontWeight.bold : FontWeight.normal,
                    color: selectedCategory == category ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                initiallyExpanded: selectedCategory == 'Facultades', // Expande si ya está seleccionada
                children: [
                  // Asegurarse de que 'Facultades' exista como clave en facultySubcategories
                  ...(facultySubcategories[category] ?? []).map((subCategory) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(left: 32.0), // Indentación para subcategorías
                        child: Text(
                          subCategory,
                          style: TextStyle(
                            fontWeight: selectedSubCategory == subCategory && selectedCategory == category ? FontWeight.bold : FontWeight.normal,
                            color: selectedSubCategory == subCategory && selectedCategory == category ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.bodyLarge?.color,
                          ),
                        ),
                      ),
                      onTap: () {
                        onCategorySelected(category, subCategory: subCategory); // Pasar la subcategoría
                        Navigator.pop(context); // Cierra el drawer
                      },
                    );
                  }).toList(),
                ],
              );
            } else {
              // Para el resto de categorías
              return ListTile(
                leading: _getCategoryIcon(category), // Función auxiliar para iconos
                title: Text(
                  category,
                  style: TextStyle(
                    fontWeight: selectedCategory == category ? FontWeight.bold : FontWeight.normal,
                    color: selectedCategory == category ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                onTap: () {
                  onCategorySelected(category); // Solo pasar la categoría principal, sin subcategoría
                  Navigator.pop(context); // Cierra el drawer
                },
              );
            }
          }).toList(),
          const Divider(),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              final isDark = themeProvider.themeMode == ThemeMode.dark;
              return SwitchListTile(
                secondary: const Icon(Icons.brightness_6),
                title: const Text('Modo oscuro'),
                value: isDark,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),
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

  // Función auxiliar para obtener un icono basado en la categoría
  Icon _getCategoryIcon(String category) {
    switch (category) {
      case 'Todos':
        return const Icon(Icons.select_all);
      case 'Facultades': // Icono para la categoría principal "Facultades"
        return const Icon(Icons.school);
      case 'Aulas y Oficinas':
        return const Icon(Icons.meeting_room);
      case 'Auditorios':
        return const Icon(Icons.theater_comedy);
      case 'Bibliotecas':
        return const Icon(Icons.local_library);
      case 'Comedores':
        return const Icon(Icons.restaurant);
      case 'Oficinas':
        return const Icon(Icons.business);
      case 'Servicios':
        return const Icon(Icons.info_outline);
      case 'Bienestar y Deportes':
        return const Icon(Icons.sports_gymnastics);
      case 'Laboratorios':
        return const Icon(Icons.science);
      case 'Ciencia y Tecnología':
        return const Icon(Icons.laptop_mac);
      case 'Acceso al Campus':
        return const Icon(Icons.login);
      default:
        return const Icon(Icons.category);
    }
  }
}