import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  bool _showSearch = false;

  final List<Map<String, dynamic>> buildings = [
    {
      'name': '401 - El Viejo',
      'info': 'auditorio juan bautista, cafetería minka, sala oasis',
      'coords': LatLng(4.637040, -74.082983),
    },
    // Aquí puedes añadir más edificios fácilmente
  ];

  List<Map<String, dynamic>> _searchResults = [];

  void _updateSearchResults(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _searchResults = buildings.where((b) =>
      b['name'].toLowerCase().contains(lowerQuery) ||
          b['info'].toLowerCase().contains(lowerQuery)).toList();
    });
  }

  void _goToBuilding(Map<String, dynamic> building) {
    setState(() {
      _showSearch = false;
      _searchController.clear();
      _searchResults = [];
    });
    mapController.move(building['coords'], 20);
    _showBuildingInfo(context, building);
  }

  void _showBuildingInfo(BuildContext context, Map<String, dynamic> building) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => ElViejoInfo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(4.637040, -74.082983),
              initialZoom: 18,
              minZoom: 12,
              maxZoom: 25,
              interactionOptions: const InteractionOptions(flags: InteractiveFlag.all),
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  LatLng(4.6310, -74.0895),
                  LatLng(4.6425, -74.0770),
                ),
              ),
              onTap: (_, __) => Navigator.of(context).pop(),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.mapadefinitivo',
              ),
              MarkerLayer(
                markers: buildings.map((building) {
                  return Marker(
                    point: building['coords'],
                    width: 30,
                    height: 30,
                    child: GestureDetector(
                      onTap: () => _showBuildingInfo(context, building),
                      child: const Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => setState(() => _showSearch = !_showSearch),
              child: const Icon(Icons.search, color: Colors.black),
            ),
          ),
          if (_showSearch)
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(12),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _updateSearchResults,
                      decoration: const InputDecoration(
                        hintText: 'Buscar edificio o sitio...',
                        contentPadding: EdgeInsets.all(12),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (_searchResults.isNotEmpty)
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final result = _searchResults[index];
                          return ListTile(
                            title: Text(result['name']),
                            subtitle: Text(result['info']),
                            onTap: () => _goToBuilding(result),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class ElViejoInfo extends StatelessWidget {
  const ElViejoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (_, controller) => SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/401.jpg", fit: BoxFit.cover)),
              const SizedBox(height: 12),
              const Text("401 - El Viejo - Julio Garavito", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Edificio histórico de Ingeniería declarado Bien de Interés Cultural en 1995."),
              const SizedBox(height: 16),
              const ExpansionTile(
                title: Text("Historia del edificio"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Construido en 1945 por Leopoldo Rother, integrado al plan urbanístico de Karl Brunner de 1932. El diseño prioriza la naturaleza y la funcionalidad académica.",
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text("Primer Piso"),
                children: [
                  ListTile(title: Text("Auditorios Juan Bautista Gómez y Carlos Barbieri")),
                  ListTile(title: Text("Cafetería Minka y dispensadores")),
                  ListTile(title: Text("Préstamos, baños, cargadores, dispensador de condones")),
                  ListTile(title: Text("Oficina de apoyo a bienestar")),
                ],
              ),
              const ExpansionTile(
                title: Text("Segundo Piso"),
                children: [
                  ListTile(title: Text("Vicedecanatura académica e investigación")),
                  ListTile(title: Text("Oficinas PYP, Secretaría de decanatura, salón de consejo")),
                  ListTile(title: Text("Baños hombres y mujeres")),
                ],
              ),
              const ExpansionTile(
                title: Text("Tercer Piso"),
                children: [
                  ListTile(title: Text("Centro de impresión y salones de estudio")),
                  ListTile(title: Text("Sala oasis y aula insignia")),
                  ListTile(title: Text("Vicedecanatura de bienestar")),
                ],
              ),
              const ExpansionTile(
                title: Text("Contacto"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text("Oficina de Bienestar, primer piso."),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
