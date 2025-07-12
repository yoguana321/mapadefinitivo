// lib/screens/map_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapadefinitivo/screens/favorites_screen.dart';
import '../models/building.dart';
import '../data/building_data.dart'; // Asegúrate de que allBuildings sea mutable si planeas editarlo
import '../widgets/app_drawer.dart';
import '../services/building_info_sheet.dart'; // Importa la función showBuildingInfo
import '../widgets/map_markers.dart';
import '../widgets/search_and_filter_bar.dart';
import '../widgets/search_results_list.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import '../services/routing_service.dart';

class MapScreen extends StatefulWidget {
  final Building? initialBuilding;

  const MapScreen({super.key, this.initialBuilding});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> _routeLine = [];
  LatLng? _currentLocation;
  final MapController mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchVisible = false;
  double _currentZoom = 18;
  LatLng _currentCenter = LatLng(4.637040, -74.082983);
  List<Building> _filteredBuildings = [];
  String? _selectedCategory = 'Todos';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // NUEVO: Variable para almacenar la rotación actual del mapa
  double _currentMapRotation = 0.0;
  StreamSubscription<Position>? _positionStream;

  @override
  void initState() {
    super.initState();
    _listenToLocation();
    // Manejo del edificio inicial
    if (widget.initialBuilding != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // Asegurarse de que _currentLocation esté disponible antes de mostrar info
        // o pasar un valor por defecto si la ubicación no es crítica para la primera carga.
        // Aquí esperamos un poco o pasamos (0,0) si no es crucial para la primera vista.
        if (_currentLocation == null) {
          // Opcional: Esperar un segundo o dos a que se obtenga la ubicación inicial
          // o pedirla una vez si es indispensable para la hoja.
          // Por simplicidad, si es nulo, pasaremos (0,0) al callback de ruta.
        }
        mapController.move(widget.initialBuilding!.coords, 18);
        showBuildingInfo(
          context,
          widget.initialBuilding!,
          currentLocation: _currentLocation ?? LatLng(0, 0), // Proporciona un valor por defecto si es nulo
          onRouteCalculated: (route) {
            setState(() {
              _routeLine = route;
            });
          },
          // !!! AÑADIDO: onBuildingUpdated callback !!!
          onBuildingUpdated: (updatedBuilding) {
            _updateBuildingInLists(updatedBuilding);
          },
        );
      });
    }

    mapController.mapEventStream.listen((event) {
      if (event is MapEventMove || event is MapEventMoveEnd || event is MapEventRotate || event is MapEventRotateEnd) {
        setState(() {
          _currentZoom = mapController.camera.zoom;
          _currentCenter = mapController.camera.center;
          _currentMapRotation = mapController.camera.rotation; // ¡AQUÍ SE ACTUALIZA LA ROTACIÓN!
        });
      }
    });
    _updateFilteredBuildings();
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && _searchController.text.isEmpty && _isSearchVisible) {
        // Puedes agregar lógica aquí si quieres hacer algo cuando el campo de búsqueda pierde el foco y está vacío
      }
    });
  }

  Future<void> _checkAndRestartLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    // Si llega hasta aquí, entonces tiene permisos y GPS activo
    // Reinicia el stream
    _positionStream?.cancel(); // Cancela el anterior si existía
    _listenToLocation();
  }

  void _handleRouteUpdate(List<LatLng> route) {
    setState(() {
      _routeLine = route;
    });
  }

  void _listenToLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Manejar el caso de que el servicio de ubicación no esté habilitado
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permiso denegado
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permiso denegado permanentemente
      return;
    }

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5, // Actualizar cada 5 metros
      ),
    ).listen((Position position) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    }, onError: (error) {
      // Manejar errores del stream de ubicación
      debugPrint('Error en el stream de ubicación: $error');
    });
  }

  // Nuevo método para actualizar un edificio en las listas locales
  void _updateBuildingInLists(Building updatedBuilding) {
    setState(() {
      // Actualiza en _filteredBuildings
      final indexFiltered = _filteredBuildings.indexWhere((b) => b.id == updatedBuilding.id);
      if (indexFiltered != -1) {
        _filteredBuildings[indexFiltered] = updatedBuilding;
      }

      // Si allBuildings es mutable y quieres que los cambios persistan en los datos de la app
      // (lo cual es complejo si los datos están hardcodeados o no tienen un sistema de persistencia)
      // tendrías que encontrar y reemplazar el edificio en allBuildings también.
      // Por ejemplo:
      final indexAll = allBuildings.indexWhere((b) => b.id == updatedBuilding.id);
      if (indexAll != -1) {
        // Esto solo funcionaría si allBuildings NO fuera final y fuera un List<Building> mutable.
        // Si allBuildings es 'final', necesitarías un mecanismo para recargar todos los edificios
        // o pasar un callback al padre de MapScreen para que actualice la fuente de datos.
        // Para esta configuración, solo actualizar _filteredBuildings es suficiente para la UI.
        // (allBuildings as List<Building>)[indexAll] = updatedBuilding; // Esto causaría un error si allBuildings es final
      }
      _updateFilteredBuildings(); // Re-filtra por si la edición afecta la búsqueda/categoría
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    mapController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _updateFilteredBuildings() {
    final lowerQuery = _searchController.text.toLowerCase();
    setState(() {
      _filteredBuildings = allBuildings.where((b) {
        bool matchesQuery = b.searchableContent.contains(lowerQuery);
        bool matchesCategory = true;
        if (_selectedCategory != null && _selectedCategory != 'Todos') {
          matchesCategory = b.category.toLowerCase() == _selectedCategory!.toLowerCase();
        }
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  void _onSearchQueryChanged(String query) {
    _searchController.text = query;
    _updateFilteredBuildings();
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _updateFilteredBuildings();
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        _selectedCategory = 'Todos';
        _searchFocusNode.unfocus();
        _updateFilteredBuildings();
      } else {
        _searchFocusNode.requestFocus();
      }
      _clearRouteAndInstructions();
    });
  }

  Future<void> _onMarkerTapped(Building building) async {
    _clearSearchState();
    _clearRouteAndInstructions();
    mapController.move(building.coords, 20);
    showBuildingInfo(
      context,
      building,
      currentLocation: _currentLocation ?? LatLng(0, 0),
      onRouteCalculated: (route) {
        setState(() {
          _routeLine = route;
        });
      },
      // !!! AÑADIDO: onBuildingUpdated callback !!!
      onBuildingUpdated: (updatedBuilding) {
        _updateBuildingInLists(updatedBuilding);
      },
    );
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _navigateToMap() {
    _clearSearchState();
    _clearRouteAndInstructions();
    mapController.move(LatLng(4.637040, -74.082983), 18);
    _scaffoldKey.currentState?.closeDrawer();
  }

  void _navigateToFavorites() async {
    final selectedBuilding = await Navigator.push<Building?>(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
    );

    if (selectedBuilding != null) {
      // Mueve el mapa al edificio seleccionado
      mapController.move(selectedBuilding.coords, 18);

      // Muestra la hoja de información
      if (_currentLocation != null) {
        showBuildingInfo(
          context,
          selectedBuilding,
          currentLocation: _currentLocation!,
          onRouteCalculated: (route) {
            setState(() {
              _routeLine = route;
            });
          },
          // !!! AÑADIDO: onBuildingUpdated callback !!!
          onBuildingUpdated: (updatedBuilding) {
            _updateBuildingInLists(updatedBuilding);
          },
        );
      }
    }
  }

  void _clearRouteAndInstructions() {
    setState(() {
      _routeLine.clear(); // Limpiar la ruta visual
      // Si tienes un widget o variable para instrucciones, también limpíalo aquí
    });
  }

  void _clearSearchState() {
    setState(() {
      _isSearchVisible = false;
      _searchController.clear();
      _selectedCategory = 'Todos';
      _searchFocusNode.unfocus();
      _updateFilteredBuildings();
    });
  }

  Future<void> _onMyLocationButtonPressed() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activa los servicios de ubicación.')),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Usuario denegó permisos
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permisos de ubicación denegados.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permisos denegados permanentemente
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permisos de ubicación denegados permanentemente. Habilítalos desde la configuración de la aplicación.')),
      );
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final currentLatLng = LatLng(position.latitude, position.longitude);
      setState(() {
        _currentCenter = currentLatLng;
        _currentLocation = currentLatLng; // También actualiza _currentLocation
      });

      mapController.move(currentLatLng, 18);
      mapController.rotate(0); // Restablece la rotación a 0 al centrar en la ubicación actual

      _clearRouteAndInstructions();
      // Si hay un BottomSheet abierto, ciérralo
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo obtener la ubicación: $e')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        selectedCategory: _selectedCategory,
        categories: buildingCategories,
        onCategorySelected: _onCategorySelected,
        onNavigateToMap: _navigateToMap,
        onNavigateToHome: _navigateToHome,
        onNavigateToFavorites: _navigateToFavorites,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(4.637040, -74.082983),
              initialZoom: 18,
              minZoom: 9,
              maxZoom: 20,
              // Lógica para bloquear la rotación en zoom alto
              interactionOptions: InteractionOptions(
                flags: (_currentZoom >= 19.5 && mapController.camera.rotation != 0.0)
                    ? InteractiveFlag.drag | InteractiveFlag.pinchZoom // Permite drag y zoom, pero bloquea rotación si muy cerca y rotado
                    : InteractiveFlag.all, // Permite todo en otros zooms o si el mapa está sin rotar
              ),
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  LatLng(4.4, -74.25),
                  LatLng(4.8, -74.00),
                ),
              ),
              onTap: (tapPosition, latLng) {
                _clearRouteAndInstructions();
                // Si hay un BottomSheet abierto, ciérralo.
                // Es importante comprobar si se puede hacer pop, para no generar errores.
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
                if (_isSearchVisible) {
                  _toggleSearchVisibility();
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.mapadefinitivo',
              ),
              if (_routeLine.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routeLine,
                      color: Colors.blue,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  if (_currentLocation != null)
                    Marker(
                      point: _currentLocation!,
                      width: 20,
                      height: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue.withOpacity(0.8),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              MapBuildingMarkers(
                buildings: _filteredBuildings,
                currentZoom: _currentZoom,
                onMarkerTap: _onMarkerTapped,
                center: _currentCenter,
                mapRotation: _currentMapRotation, // ¡AQUÍ SE PASA LA ROTACIÓN AL WIDGET DE MARCADORES!
              ),
            ],
          ),
          if (_routeLine.isNotEmpty)
            Positioned(
              bottom: 20,
              left: 20,
              child: FloatingActionButton(
                heroTag: 'cancelRouteButton',
                mini: true,
                backgroundColor: Colors.redAccent,
                tooltip: 'Cancelar ruta',
                onPressed: () {
                  setState(() {
                    _routeLine.clear();
                  });
                  if (Navigator.of(context).canPop()) { // Cierra el bottom sheet si está abierto
                    Navigator.of(context).pop();
                  }
                },
                child: const Icon(Icons.close),
              ),
            ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: FloatingActionButton(
              heroTag: 'menuButton',
              mini: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              child:  Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: FloatingActionButton(
              heroTag: 'searchButton',
              mini: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              onPressed: _toggleSearchVisibility,
              child: Icon(_isSearchVisible ? Icons.close : Icons.search, color: Theme.of(context).iconTheme.color),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: 'myLocationButton',
                    mini: true,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    onPressed: () async {
                      await _checkAndRestartLocation(); // Asegura permisos y reinicia stream si es necesario
                      await _onMyLocationButtonPressed(); // Mueve el mapa y gestiona UI
                    },
                    child: Icon(Icons.gps_fixed, color: Theme.of(context).iconTheme.color),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    heroTag: 'backButton',
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(Icons.map, color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop(); // Intenta cerrar el bottom sheet si está abierto
                      } else {
                        Navigator.pushReplacementNamed(context, '/'); // Navega a la ruta inicial si no hay sheets
                      }
                      _clearRouteAndInstructions();
                    },
                  ),
                ],
              ),
            ),
          ),

          Align( // BRUJULA
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 0, bottom: 140.0),
              child: StreamBuilder<MapEvent>(
                stream: mapController.mapEventStream,
                builder: (context, snapshot) {
                  final rotationDegrees = mapController.camera.rotation; // Obtener la rotación directamente
                  final rotationRadians = -rotationDegrees * (3.1415926535 / 180); // convertir a radianes y negar

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/cruceta.png', width: 100),
                      Positioned(
                        right: 23,
                        child: Transform.rotate(
                          angle: rotationRadians,
                          child: Image.asset('assets/images/señalador.png', width: 52.5,),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          if (_isSearchVisible)
            Positioned(
              top: MediaQuery.of(context).padding.top + 60,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  SearchAndFilterBar(
                    searchController: _searchController,
                    searchFocusNode: _searchFocusNode,
                    categories: buildingCategories,
                    selectedCategory: _selectedCategory,
                    onSearchChanged: _onSearchQueryChanged,
                    onCategorySelected: _onCategorySelected,
                  ),
                  SearchResultsList(
                    filteredBuildings: _filteredBuildings,
                    onBuildingSelected: (building) {
                      mapController.move(building.coords, 19);
                      _clearSearchState();
                      if (_currentLocation != null) {
                        showBuildingInfo(
                          context,
                          building,
                          currentLocation: _currentLocation!,
                          onRouteCalculated: (route) {
                            setState(() {
                              _routeLine = route;
                            });
                          },
                          // !!! AÑADIDO: onBuildingUpdated callback !!!
                          onBuildingUpdated: (updatedBuilding) {
                            _updateBuildingInLists(updatedBuilding);
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}