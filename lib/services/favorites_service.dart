// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/building_data.dart'; // Ajusta esto según donde esté tu lista de edificios
import '../models/building.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Building> _favoriteBuildings = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = <Building>[];

    for (var building in allBuildings) {
      final isFav = prefs.getBool('fav_${building.id}') ?? false;
      if (isFav) {
        favs.add(building);
      }
    }

    setState(() {
      _favoriteBuildings = favs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos')),
      body: _favoriteBuildings.isEmpty
          ? const Center(child: Text('No tienes favoritos aún.'))
          : ListView.builder(
        itemCount: _favoriteBuildings.length,
        itemBuilder: (context, index) {
          final building = _favoriteBuildings[index];
          return ListTile(
            leading: Icon(building.icon, color: building.markerColor),
            title: Text(building.name),
            subtitle: Text(building.category),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navega al edificio en el mapa o muestra info
              Navigator.pop(context); // Vuelve al mapa
              // Implementa navegación si lo deseas
            },
          );
        },
      ),
    );
  }
}
