import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Importaciones locales
import '../models/building.dart';
import '../data/building_data.dart';
import '../widgets/app_drawer.dart';
import '../services/building_info_sheet.dart';
import '../widgets/map_markers.dart';
import '../widgets/search_and_filter_bar.dart';
import '../widgets/search_results_list.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchVisible = false;
  double _currentZoom = 18;
  List<Building> _filteredBuildings = [];
  String? _selectedCategory = 'Todos';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<LatLng> _routePoints = [];

  @override
  void initState() {
    super.initState();

    mapController.mapEventStream.listen((event) {
      if (event is MapEventMove || event is MapEventMoveEnd) {
        setState(() {
          _currentZoom = mapController.camera.zoom;
        });
      }
    });
    _updateFilteredBuildings();
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && _searchController.text.isEmpty && _isSearchVisible) {}
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _updateFilteredBuildings() {
    final lowerQuery = _searchController.text.toLowerCase();
    setState(() {
      _filteredBuildings = allBuildings.where((b) {
        bool matchesQuery = b.name.toLowerCase().contains(lowerQuery) || b.info.toLowerCase().contains(lowerQuery);
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
    mapController.move(building.coords, 20);
    showBuildingInfo(context, building);
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

  void _clearRouteAndInstructions() {
    setState(() {
      _routePoints = [];
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

  void _onMyLocationButtonPressed() {
    mapController.move(LatLng(4.637040, -74.082983), 18);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Centrando mapa en la Universidad Nacional.')),
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
              interactionOptions: const InteractionOptions(flags: InteractiveFlag.all),
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
              PolylineLayer(
                polylines: [
                  if (_routePoints.isNotEmpty)
                    Polyline(
                      points: _routePoints,
                      color: Colors.blue,
                      strokeWidth: 6.0,
                      borderStrokeWidth: 2.0,
                      borderColor: Colors.black,
                    ),
                ],
              ),
              MarkerLayer(
                markers: [],
              ),
              MapBuildingMarkers(
                buildings: _filteredBuildings,
                currentZoom: _currentZoom,
                onMarkerTap: _onMarkerTapped,
              ),
            ],
          ),

          // Botones menú y búsqueda
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

          // Botones abajo a la derecha
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

          // === BRÚJULA DINÁMICA ===
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 80.0, bottom:20.0),
              child: StreamBuilder<MapEvent>(
                stream: mapController.mapEventStream,
                builder: (context, snapshot) {
                  final rotation = snapshot.data?.camera.rotation ?? 0.0;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/cruceta.png', width: 148),
                      Positioned(
                        right: 8,
                        child: Transform.rotate(
                          angle: -rotation,
                          child: Image.asset('assets/images/señalador.png', width: 126),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          // Barra de búsqueda
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
