// lib/services/favorites_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart'; // Para debugPrint

class FavoritesService {
  static final FavoritesService _instance = FavoritesService._internal();

  factory FavoritesService() {
    return _instance;
  }

  FavoritesService._internal();

  static const String _favoritesKey = 'favorite_building_ids'; // Usaremos esta clave

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<bool> isBuildingFavorite(String buildingId) async {
    final favorites = await getFavorites();
    return favorites.contains(buildingId);
  }

  Future<void> toggleFavorite(String buildingId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];

    if (favorites.contains(buildingId)) {
      favorites.remove(buildingId);
      debugPrint('Removed $buildingId from favorites.');
    } else {
      favorites.add(buildingId);
      debugPrint('Added $buildingId to favorites.');
    }
    await prefs.setStringList(_favoritesKey, favorites);
  }
}