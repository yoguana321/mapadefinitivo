// lib/services/building_info_sheet.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart';
import '../services/routing_service.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

// Importa los nuevos widgets
import '../widgets/building_title_bar.dart';
import '../widgets/building_image_gallery.dart';
import '../widgets/building_general_info_tab.dart';
import '../widgets/building_rooms_tab.dart';
import '../widgets/building_special_services_tab.dart';
import '../services/favorites_service.dart';
import '../utils/schedule_utils.dart';

void showBuildingInfo(
    BuildContext context,
    Building building, {
      required LatLng currentLocation,
      required Function(List<LatLng>) onRouteCalculated,
      required Function(Building) onBuildingUpdated,
    }) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return _BuildingInfoSheetContent(
        building: building,
        currentLocation: currentLocation,
        onRouteCalculated: onRouteCalculated,
        onBuildingUpdated: onBuildingUpdated,
      );
    },
  );
}

void _calculateRoute(
    BuildContext context,
    LatLng currentLocation,
    Building building,
    Function(List<LatLng>) onRouteCalculated,
    ) async {
  try {
    print('Calculando ruta desde $currentLocation hacia ${building.name}');
    final route = await fetchRouteFromOSRM(
      currentLocation,
      LatLng(building.latitude, building.longitude),
    );
    if (route.isEmpty) {
      print('Ruta vacía, usando línea recta');
      onRouteCalculated([currentLocation, LatLng(building.latitude, building.longitude)]);
    } else {
      print('Ruta encontrada con ${route.length} puntos');
      onRouteCalculated(route);
    }
  } catch (e) {
    print('Error al calcular ruta: $e');
    onRouteCalculated([currentLocation, LatLng(building.latitude, building.longitude)]);
  } finally {
    Navigator.pop(context);
  }
}

class _BuildingInfoSheetContent extends StatefulWidget {
  final Building building;
  final LatLng currentLocation;
  final Function(List<LatLng>) onRouteCalculated;
  final Function(Building) onBuildingUpdated;

  const _BuildingInfoSheetContent({
    Key? key,
    required this.building,
    required this.currentLocation,
    required this.onRouteCalculated,
    required this.onBuildingUpdated,
  }) : super(key: key);

  @override
  State<_BuildingInfoSheetContent> createState() => _BuildingInfoSheetContentState();
}

class _BuildingInfoSheetContentState extends State<_BuildingInfoSheetContent> {
  late Building _currentBuilding;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _currentBuilding = widget.building;
    _loadFavoriteStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final fav = prefs.getBool('fav_${widget.building.id}') ?? false;
    setState(() {
      isFavorite = fav;
    });
  }

  Future<void> _toggleFavorite(String buildingId) async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !isFavorite;
    await prefs.setBool('fav_$buildingId', newValue);
    setState(() {
      isFavorite = newValue;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          newValue
              ? '${widget.building.shortName} fue agregado a favoritos'
              : '${widget.building.shortName} fue eliminado de favoritos',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _updateRoomInBuilding(Room updatedRoom) {
    setState(() {
      List<Room> updatedRoomsList = [];
      if (_currentBuilding.rooms != null) {
        updatedRoomsList = _currentBuilding.rooms!.map((r) => r.id == updatedRoom.id ? updatedRoom : r).toList();
      }
      _currentBuilding = _currentBuilding.copyWith(
        rooms: updatedRoomsList,
        specialServices: _currentBuilding.specialServices,
      );
    });
    widget.onBuildingUpdated(_currentBuilding);
  }

  void _updateSpecialServiceInBuilding(Room updatedService) {
    setState(() {
      List<Room> updatedServicesList = [];
      if (_currentBuilding.specialServices != null) {
        updatedServicesList = _currentBuilding.specialServices!.map((s) => s.id == updatedService.id ? updatedService : s).toList();
      }
      _currentBuilding = _currentBuilding.copyWith(
        specialServices: updatedServicesList,
        rooms: _currentBuilding.rooms,
      );
    });
    widget.onBuildingUpdated(_currentBuilding);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color accentColor = _currentBuilding.markerColor ?? theme.colorScheme.primary;

    final List<String> distinctFloors = _currentBuilding.rooms
        ?.where((room) => room.floor != 'General' && room.floor.isNotEmpty && !(room.isServiceRoom ?? false))
        .map((room) => room.floor)
        .toSet()
        .toList() ?? [];

    distinctFloors.sort((a, b) {
      final numA = int.tryParse(a.replaceAll(RegExp(r'[^0-9]'), ''));
      final numB = int.tryParse(b.replaceAll(RegExp(r'[^0-9]'), ''));
      if (numA != null && numB != null) {
        return numA.compareTo(numB);
      }
      return a.compareTo(b);
    });

    final List<Tab> tabLabels = [
      const Tab(text: 'Información'),
      ...distinctFloors.map((floor) => Tab(text: floor)),
      if (_currentBuilding.specialServices != null && _currentBuilding.specialServices!.isNotEmpty)
        const Tab(text: 'Servicios Especiales'),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.2,
      maxChildSize: 1.0, // Ya lo habíamos cambiado a 1.0 para solucionar el overflow de las pestañas
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Container(
            color: theme.cardColor,
            // ANTES: Column directamente aquí
            // AHORA: Usamos un ListView para que TODO el contenido de la hoja sea scrollable
            child: ListView( // <-- CAMBIO CLAVE AQUÍ: ListView para hacer todo scrollable
              controller: scrollController, // <-- Pasar el scrollController a este ListView
              padding: EdgeInsets.zero, // Importante para evitar paddings extras
              children: [
                BuildingTitleBar(
                  buildingName: _currentBuilding.name,
                  onClose: () => Navigator.pop(context),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Mantener min para que el Column no tome espacio extra innecesario
                    children: [
                      Text(
                        _currentBuilding.category,
                        style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  if (widget.currentLocation.latitude == 0 && widget.currentLocation.longitude == 0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Activa la ubicación para calcular la ruta.')),
                                    );
                                    return;
                                  }
                                  _calculateRoute(context, widget.currentLocation, _currentBuilding, widget.onRouteCalculated);
                                },
                                icon: Icon(Icons.directions, color: theme.colorScheme.onPrimary),
                                label: Text(
                                  'Cómo llegar',
                                  style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimary),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: accentColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: OutlinedButton.icon(
                                onPressed: () => _toggleFavorite(_currentBuilding.id),
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : theme.colorScheme.onSurface,
                                ),
                                label: Text(
                                  isFavorite ? 'Favorito' : 'Favoritos',
                                  style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurface),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: isFavorite ? Colors.red : theme.colorScheme.onSurface.withOpacity(0.5),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                BuildingImageGallery(
                  imageUrls: _currentBuilding.imageUrls,
                  onImageTap: (index) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Imagen ${index + 1} clickeada!')),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Este Expanded ya está dentro del ListView, por lo que su altura se ajustará.
                // No necesitas mainAxisSize.min en el Column de aquí, ya que Expanded
                // le dará la altura que necesite dentro del ListView.
                DefaultTabController(
                  length: tabLabels.length,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min, // <-- SE ELIMINA ESTE mainAxisSize.min
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: accentColor,
                        unselectedLabelColor: theme.textTheme.bodyLarge?.color,
                        indicatorColor: accentColor,
                        tabs: tabLabels,
                      ),
                      // El Expanded aquí es crucial para que el TabBarView ocupe el resto del espacio vertical
                      // disponible y permita el scroll interno de las pestañas.
                      SizedBox(
                        height: 400, // <--- AJUSTA ESTA ALTURA. Esto es crucial para el scroll de las pestañas
                        // O bien, si quieres que ocupe todo el espacio restante del padre (ListView),
                        // entonces esta parte de la arquitectura del TabBarView debe ser revisada.
                        // Generalmente, TabBarView se usa dentro de un Expanded en un Column,
                        // o con una altura fija si el padre es scrollable.
                        // Si el ListView padre es scrollable, y quieres que el TabBarView
                        // sea scrollable, tienes que darle una altura CONCRETA o un Flexible/Expanded
                        // dentro de un Column con altura definida.
                        // La forma más sencilla para que el TabBarView funcione dentro de un ListView
                        // es darle una altura fija, o si el padre es un Column/Expanded,
                        // que el TabBarView esté dentro de un Expanded.
                        // Dado que el Column ahora está dentro de un ListView,
                        // este Column ya no está en un Expanded directamente del DraggableScrollableSheet.
                        // Por lo tanto, el Expanded del TabBarView no tiene un padre con altura infinita.
                        // Necesitamos darle una altura fija para que el TabBarView sepa cuánto espacio tomar.
                        // O si no, tendríamos que reestructurar el Column padre.
                        // Para resolver el 10px overflow en las tabs, una altura fija para el SizedBox que envuelve
                        // el TabBarView es a menudo la solución más simple dentro de un ListView.
                        child: TabBarView(
                          children: tabLabels.map((tab) {
                            final String tabText = tab.text ?? '';
                            if (tabText == 'Información') {
                              return BuildingGeneralInfoTab(
                                building: _currentBuilding,
                                scrollController: scrollController, // ScrollController del padre
                                accentColor: accentColor,
                              );
                            } else if (tabText == 'Servicios Especiales') {
                              final List<Room> serviceRooms = _currentBuilding.specialServices ?? [];
                              return BuildingSpecialServicesTab(
                                building: _currentBuilding,
                                scrollController: scrollController, // ScrollController del padre
                                accentColor: accentColor,
                                onRoomUpdated: _updateSpecialServiceInBuilding,
                              );
                            } else {
                              final List<Room> floorRooms = _currentBuilding.rooms
                                  ?.where((room) =>
                              room.floor == tabText &&
                                  (room.isServiceRoom == null || room.isServiceRoom == false))
                                  .toList() ?? [];
                              return BuildingRoomsTab(
                                building: _currentBuilding,
                                rooms: floorRooms,
                                scrollController: scrollController, // ScrollController del padre
                                accentColor: accentColor,
                                onRoomUpdated: _updateRoomInBuilding,
                              );
                            }
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}