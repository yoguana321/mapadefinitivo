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
import 'dart:async';
import 'dart:io';

Timer? locationSender;
void _sendOriginToESP(LatLng origin) async {
  try {
    final socket = await Socket.connect('192.168.0.13', 1234, timeout: const Duration(seconds: 2));
    final message = '${origin.latitude},${origin.longitude}';
    socket.write(message);
    await socket.flush();
    await socket.close();
  } catch (e) {
    print("Error al enviar a ESP32: $e");
  }
}

void startSendingLocationContinuously(LatLng? currentLocation) {
  if (currentLocation == null) return;

  Timer.periodic(const Duration(seconds: 2), (timer) async {
    try {
      final socket = await Socket.connect('192.168.0.13', 1234, timeout: Duration(seconds: 2));
      final message = '${currentLocation.latitude},${currentLocation.longitude},0.0,0.0';
      socket.write(message);
      await socket.flush();
      await socket.close();
      print('Ubicación enviada: $message');
    } catch (e) {
      print("Error al enviar ubicación: $e");
    }
  });
}



class MapScreen extends StatefulWidget {
  final LatLng? currentLocation;
  final Building? initialBuilding;

  const MapScreen({
    super.key,
    required this.currentLocation,
    this.initialBuilding,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Timer? _locationSenderTimer;
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
  // NUEVO: Agregamos la subcategoría seleccionada
  String? _selectedSubCategory = 'Todos'; // Por defecto, mostrará "Todos" en la subcategoría de facultades
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // NUEVO: Variable para almacenar la rotación actual del mapa
  double _currentMapRotation = 0.0;
  StreamSubscription<Position>? _positionStream;

  @override
  void initState() {
    super.initState();

    // 1. Escucha la ubicación del usuario
    _listenToLocation();

    // 2. Si hay un edificio inicial, muévelo y abre la hoja de información
    if (widget.initialBuilding != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (_currentLocation == null) {
          // Si la ubicación aún no está disponible, se usa LatLng(0,0) como fallback
        }

        mapController.move(widget.initialBuilding!.coords, 18);

        showBuildingInfo(
          context,
          widget.initialBuilding!,
          currentLocation: _currentLocation ?? LatLng(0, 0),
          onRouteCalculated: (route) {
            setState(() {
              _routeLine = route;
            });
          },
          onBuildingUpdated: (updatedBuilding) {
            _updateBuildingInLists(updatedBuilding);
          },
        );
      });
    }

    // 3. ENVÍA la coordenada de ORIGEN cada segundo al ESP32
    _locationSenderTimer = Timer.periodic(Duration(seconds: 1), (_) async {
      if (_currentLocation != null) {
        final lat = _currentLocation!.latitude;
        final lon = _currentLocation!.longitude;

        if (lat != 0 && lon != 0) {
          final success = await sendOriginOnlyToESP32(
            currentLat: lat,
            currentLon: lon,
          );
          if (!success) {
            print("Fallo al enviar coordenadas al ESP32");
          }
        }
      }
    });

    // 4. Escucha eventos del mapa (zoom, rotación, movimiento)
    mapController.mapEventStream.listen((event) {
      if (event is MapEventMove || event is MapEventMoveEnd || event is MapEventRotate || event is MapEventRotateEnd) {
        setState(() {
          _currentZoom = mapController.camera.zoom;
          _currentCenter = mapController.camera.center;
          _currentMapRotation = mapController.camera.rotation;
        });
      }
    });

    // 5. Actualiza la lista de edificios visibles/filtrados
    _updateFilteredBuildings();

    // 6. Maneja el foco del campo de búsqueda
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus &&
          _searchController.text.isEmpty &&
          _isSearchVisible) {
        // Puedes agregar lógica aquí si deseas ocultar la búsqueda automáticamente
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

    _positionStream?.cancel();
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
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    }, onError: (error) {
      debugPrint('Error en el stream de ubicación: $error');
    });
  }

  void _updateBuildingInLists(Building updatedBuilding) {
    setState(() {
      final indexFiltered = _filteredBuildings.indexWhere((b) => b.id == updatedBuilding.id);
      if (indexFiltered != -1) {
        _filteredBuildings[indexFiltered] = updatedBuilding;
      }
      _updateFilteredBuildings();
    });
  }

  @override
  void dispose() {
    _locationSenderTimer?.cancel();
    _positionStream?.cancel();
    mapController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  // MODIFICADO: Lógica de filtrado para usar categorías principales y subcategorías
  void _updateFilteredBuildings() {
    final lowerQuery = _searchController.text.toLowerCase();
    setState(() {
      _filteredBuildings = allBuildings.where((b) {
        bool matchesQuery = b.searchableContent.contains(lowerQuery);
        bool matchesCategory = true;

        if (_selectedCategory != null && _selectedCategory != 'Todos') {
          if (_selectedCategory == 'Facultades') {
            // Si la categoría principal es 'Facultades'
            if (_selectedSubCategory != null && _selectedSubCategory != 'Todos') {
              // Y hay una subcategoría seleccionada (ej. 'Ingeniería')
              // Comprobamos si el tag del edificio contiene la subcategoría
              matchesCategory = b.tags.any((tag) => tag.toLowerCase().contains(_selectedSubCategory!.toLowerCase()));
            } else {
              // Si la subcategoría es 'Todos', mostramos todas las facultades
              // Buscamos edificios cuya categoría sea 'Facultad' o tengan un tag relacionado con 'Facultad'
              matchesCategory = b.category.toLowerCase() == 'facultad' ||
                  b.tags.any((tag) => tag.toLowerCase().contains('facultad'));
            }
          } else {
            // Para otras categorías principales (no 'Facultades')
            matchesCategory = b.category.toLowerCase() == _selectedCategory!.toLowerCase();
          }
        }
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  void _onSearchQueryChanged(String query) {
    _searchController.text = query;
    _updateFilteredBuildings();
  }

  // MODIFICADO: Manejo de la selección de categoría, ahora también la subcategoría
  void _onCategorySelected(String category, {String? subCategory}) {
    setState(() {
      _selectedCategory = category;
      _selectedSubCategory = subCategory ?? 'Todos'; // Si no se pasa subcategoría, por defecto es 'Todos'
      _updateFilteredBuildings();
    });
  }

  void _toggleSearchVisibility() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        _selectedCategory = 'Todos';
        _selectedSubCategory = 'Todos'; // Reiniciar subcategoría también
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
      mapController.move(selectedBuilding.coords, 18);
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
          onBuildingUpdated: (updatedBuilding) {
            _updateBuildingInLists(updatedBuilding);
          },
        );
      }
    }
  }

  void _clearRouteAndInstructions() {
    setState(() {
      _routeLine.clear();
    });
  }

  void _clearSearchState() {
    setState(() {
      _isSearchVisible = false;
      _searchController.clear();
      _selectedCategory = 'Todos';
      _selectedSubCategory = 'Todos'; // También limpiar la subcategoría
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permisos de ubicación denegados.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
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
        _currentLocation = currentLatLng;
      });

      mapController.move(currentLatLng, 18);
      mapController.rotate(0);

      _clearRouteAndInstructions();
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
        selectedSubCategory: _selectedSubCategory, // PASAR LA SUBCATEGORÍA
        categories: mainBuildingCategories, // USAR LAS CATEGORÍAS PRINCIPALES
        facultySubcategories: facultySubcategories, // PASAR LAS SUBCATEGORÍAS DE FACULTADES
        onCategorySelected: _onCategorySelected, // El callback ahora acepta subCategoría
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
              interactionOptions: InteractionOptions(
                flags: (_currentZoom >= 19.5 && mapController.camera.rotation != 0.0)
                    ? InteractiveFlag.drag | InteractiveFlag.pinchZoom
                    : InteractiveFlag.all,
              ),
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  LatLng(4.4, -74.25),
                  LatLng(4.8, -74.00),
                ),
              ),
              onTap: (tapPosition, latLng) {
                _clearRouteAndInstructions();
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
                mapRotation: _currentMapRotation,
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
                  if (Navigator.of(context).canPop()) {
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
                      await _checkAndRestartLocation();
                      await _onMyLocationButtonPressed();
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
                        Navigator.of(context).pop();
                      } else {
                        Navigator.pushReplacementNamed(context, '/');
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
                  final rotationDegrees = mapController.camera.rotation;
                  final rotationRadians = -rotationDegrees * (3.1415926535 / 180);

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
                    categories: mainBuildingCategories, // USAR LAS CATEGORÍAS PRINCIPALES
                    facultySubcategories: facultySubcategories, // PASAR LAS SUBCATEGORÍAS DE FACULTADES
                    selectedCategory: _selectedCategory,
                    selectedSubCategory: _selectedSubCategory, // PASAR LA SUBCATEGORÍA SELECCIONADA
                    onSearchChanged: _onSearchQueryChanged,
                    onCategorySelected: _onCategorySelected, // El callback ahora acepta subCategoría
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