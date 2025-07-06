// lib/screens/map_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapadefinitivo/screens/favorites_screen.dart';
import '../models/building.dart';
import '../data/building_data.dart';
import '../widgets/app_drawer.dart';
import '../services/building_info_sheet.dart';
import '../widgets/map_markers.dart';
import '../widgets/search_and_filter_bar.dart';
import '../widgets/search_results_list.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  final Building? initialBuilding;

  const MapScreen({super.key, this.initialBuilding});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
  late StreamSubscription<Position>? _positionStream;
  @override
  void initState() {
    super.initState();
    _listenToLocation();
    if (widget.initialBuilding != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mapController.move(widget.initialBuilding!.coords, 18);
        showBuildingInfo(context, widget.initialBuilding!);
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

  void _listenToLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    });
  }
  @override
  void dispose() {
    _positionStream?.cancel();
    mapController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _positionStream?.cancel();
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

  void _onMarkerTapped(Building building) {
    _clearSearchState();
    _clearRouteAndInstructions();
    mapController.move(building.coords, 20); // Zoom in on the building
    showBuildingInfo(context, building); // Open the detailed info sheet
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
  void _navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
    );
  }

  void _clearRouteAndInstructions() {
    setState(() {
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
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    final currentLatLng = LatLng(position.latitude, position.longitude);
    setState(() {
      _currentCenter = currentLatLng;
    });

    mapController.move(currentLatLng, 18);
    mapController.rotate(0);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ubicación actual')),
    );

    _clearRouteAndInstructions();
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
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
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: FloatingActionButton(
              heroTag: 'menuButton',
              mini: true,
              backgroundColor: Colors.white,
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              child: const Icon(Icons.menu, color: Colors.black),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: FloatingActionButton(
              heroTag: 'searchButton',
              mini: true,
              backgroundColor: Colors.white,
              onPressed: _toggleSearchVisibility,
              child: Icon(_isSearchVisible ? Icons.close : Icons.search, color: Colors.black),
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
                    backgroundColor: Colors.white,
                    onPressed: _onMyLocationButtonPressed,
                    child: const Icon(Icons.gps_fixed, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    heroTag: 'backButton',
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.map, color: Colors.black),
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

          Align( // BRUJULA - SE MANTIENE EXACTAMENTE IGUAL, NO NECESITA CAMBIOS
            //⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⢉⢉⠉⠉⠻⣿⣿⣿⣿⣿⣿
            //⣿⣿⣿⣿⡿⠁⠄⣳⢷⣿⣿⣿⣿⡿⣝⠖⠄⣿⣿⣿⣿⣿
            //⣿⣿⣿⣿⡿⠁⠄⣳⢷⣿⣿⣿⣿⡿⣝⠖⠄⣿⣿⣿⣿⣿
            //⣿⣿⠄⢜⢾⣾⣿⣿⣟⣗⢯⡪⡳⡀⢸⣿⣿⣿⣿⣿⣿⣿
            //⣿⣿⡇⢀⢗⣿⣿⣿⣿⡿⣞⡵⡣⣊⢸⣿⣿⣿⣿⣿⣿⣿
            //⣿⣿⣿⣿⡆⢘⡺⣽⢿⣻⣿⣗⡷⣹⢩⢃⢿⣿⣿⣿⣿⣿
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 80.0, bottom: 20.0),
              child: StreamBuilder<MapEvent>(
                stream: mapController.mapEventStream,
                builder: (context, snapshot) {
                  final rotationDegrees = snapshot.data?.camera.rotation ?? 0.0;
                  final rotationRadians = -rotationDegrees * (3.1415926535 / 180); // convertir a radianes y negar

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/cruceta.png', width: 148),
                      Positioned(
                        right: 8,
                        child: Transform.rotate(
                          angle: rotationRadians,
                          child: Image.asset('assets/images/señalador.png', width: 126),
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
                      showBuildingInfo(context, building);
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