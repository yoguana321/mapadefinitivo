import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/building.dart';
import '../data/building_data.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Building> favoriteBuildings = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<Building> favs = [];

    for (var building in allBuildings) {
      final isFav = prefs.getBool('fav_${building.id}') ?? false;
      if (isFav) {
        favs.add(building);
      }
    }

    setState(() {
      favoriteBuildings = favs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: favoriteBuildings.isEmpty
          ? const Center(child: Text('No hay favoritos aún.'))
      :ListView.builder(
        itemCount: favoriteBuildings.length,
        itemBuilder: (context, index) {
          final building = favoriteBuildings[index];
          return ListTile(
            leading: Icon(building.icon, color: Theme.of(context).primaryColor),
            title: Text(building.name),
            trailing: IconButton(
              icon: const Icon(Icons.star, color: Colors.amber),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('fav_${building.id}', false);

                  setState(() {
                    favoriteBuildings.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${building.shortName} fue eliminado de favoritos'),
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
            ),
            onTap: () {
              Navigator.pop(context, building); // Volver al mapa con el edificio seleccionado
            },
          );
        },
      ),
    );
  }
}
