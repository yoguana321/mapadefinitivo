import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../models/professor.dart'; // Asegúrate de importar el modelo Professor
import 'package:shared_preferences/shared_preferences.dart';

// Importar para la galería de imágenes
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Importar para formatear la fecha y hora y para URL Launcher
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// Importar el nuevo widget para editar la sala
import '../widgets/edit_room_sheet.dart'; // <<-- NUEVA IMPORTACIÓN

// La función principal para mostrar el bottom sheet
Future<void> showBuildingInfo(BuildContext context, Building building) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      final Color primaryTabColor = building.markerColor ?? Theme.of(context).primaryColor;
      return _BuildingInfoSheetContent(
        building: building,
        primaryTabColor: primaryTabColor,
      );
    },
  );
}

// StatefulWidget para manejar el estado interno (como la expansión de historia)
class _BuildingInfoSheetContent extends StatefulWidget {
  final Building building;
  final Color primaryTabColor;

  const _BuildingInfoSheetContent({
    required this.building,
    required this.primaryTabColor,
  });

  @override
  State<_BuildingInfoSheetContent> createState() => _BuildingInfoSheetContentState();
}

class _BuildingInfoSheetContentState extends State<_BuildingInfoSheetContent> {
  bool _isHistoryExpanded = false;
  // Usamos una copia mutable del building para poder actualizar las rooms
  late Building _currentBuilding;

  @override
  void initState() {
    super.initState();
    _currentBuilding = widget.building; // Inicializar con el building original
  }

  // Método para manejar la actualización de una Room desde el formulario de edición
  void _onRoomUpdated(Room updatedRoom) {
    setState(() {
      final List<Room> updatedRoomsList = _currentBuilding.rooms!.map((room) {
        return room.id == updatedRoom.id ? updatedRoom : room; // Reemplazar la sala si el ID coincide
      }).toList();
      _currentBuilding = _currentBuilding.copyWith(rooms: updatedRoomsList);
      // Opcional: Si tienes un sistema de persistencia, guarda los cambios aquí
      // saveBuilding(_currentBuilding);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ordenar los pisos numéricamente
    final List<String> floors = _currentBuilding.rooms // Usa _currentBuilding
        ?.map((room) => room.floor)
        .where((floor) => floor != 'General' && floor != 'Servicios Especiales' && floor.isNotEmpty)
        .toSet()
        .toList() ?? [];
    floors.sort((a, b) {
      final numA = int.tryParse(a.replaceAll('Piso ', ''));
      final numB = int.tryParse(b.replaceAll('Piso ', ''));
      if (numA != null && numB != null) {
        return numA.compareTo(numB);
      }
      return a.compareTo(b);
    });

    final List<String> tabs = ['General', 'Servicios Especiales', ...floors];
    final Color primaryTabColor = widget.primaryTabColor;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.2,
      maxChildSize: 0.95,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return DefaultTabController(
          length: tabs.length,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: Column(
              children: [
                // Drag handle
                Container(
                  height: 16,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      // Sliver para la imagen de encabezado con overlay de texto y galería horizontal
                      SliverAppBar(
                        expandedHeight: 280.0,
                        floating: false,
                        pinned: false,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: FlexibleSpaceBar(
                          background: _buildHeaderContent(context, _currentBuilding), // Usa _currentBuilding
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Detalles y Ubicaciones',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        delegate: _SliverAppBarDelegate(
                          TabBar(
                            isScrollable: true,
                            tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                            labelColor: primaryTabColor,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: primaryTabColor,
                            indicatorWeight: 3,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ),
                        pinned: true,
                      ),
                      SliverFillRemaining(
                        child: TabBarView(
                          children: tabs.map((tab) {
                            if (tab == 'General') {
                              return _buildGeneralInfoTab(
                                _currentBuilding, // Usa _currentBuilding
                                scrollController,
                                _isHistoryExpanded,
                                    () {
                                  setState(() {
                                    _isHistoryExpanded = !_isHistoryExpanded;
                                  });
                                },
                                primaryTabColor,
                              );
                            } else if (tab == 'Servicios Especiales') {
                              return _buildSpecialServicesTab(_currentBuilding, scrollController, primaryTabColor); // Usa _currentBuilding
                            } else {
                              final roomsOnFloor = _currentBuilding.rooms // Usa _currentBuilding
                                  ?.where((room) => room.floor == tab && (room.isServiceRoom ?? false) == false)
                                  .toList() ?? [];
                              return _buildRoomsList(roomsOnFloor, scrollController, primaryTabColor);
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

  // --- FUNCIÓN: _buildHeaderContent (SIN CAMBIOS FUNCIONALES MAYORES, USA _currentBuilding) ---
  Widget _buildHeaderContent(BuildContext context, Building building) {
    final List<String> displayImageUrls = building.imageUrls.isNotEmpty
        ? building.imageUrls
        : ['assets/images/placeholder.jpg'];
    final String initialImageUrl = displayImageUrls.first;

    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        final prefs = snapshot.data;
        final bool isFavorite = prefs?.getBool('fav_${building.id}') ?? false;

        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: Image.asset(
                    initialImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                          Colors.black.withOpacity(0.4),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Cerrar',
                  ),
                ),
              ),
              Positioned(
                bottom: 110,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      building.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: (building.markerColor ?? Theme.of(context).primaryColor).withOpacity(0.85),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                building.category,
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (building.isAccessible == true)
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Accesibilidad'),
                                        content: const Text(
                                          'Este edificio cuenta con facilidades de acceso para personas con movilidad reducida (ej. ascensores, rampas).',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text('Entendido'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.accessible_forward, color: Colors.white, size: 22),
                              ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 30,
                          ),
                          onPressed: () async {
                            if (prefs != null) {
                              final newValue = !isFavorite;
                              await prefs.setBool('fav_${building.id}', newValue);
                              setState(() {});
                            }
                          },
                          tooltip: isFavorite ? 'Remover de favoritos' : 'Añadir a favoritos',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildHorizontalImageGallery(context, displayImageUrls),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- FUNCIÓN: _buildHorizontalImageGallery (SIN CAMBIOS) ---
  Widget _buildHorizontalImageGallery(BuildContext context, List<String> imageUrls) {
    if (imageUrls.length <= 1) {
      return const SizedBox.shrink();
    }

    final List<String> galleryThumbnails = imageUrls.sublist(1);

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: galleryThumbnails.length,
        itemBuilder: (context, index) {
          final String imageUrl = galleryThumbnails[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                _showImageGallery(context, imageUrls, initialIndex: index + 1);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(
                        width: 120,
                        height: 80,
                        color: Colors.grey[300],
                        child: Icon(Icons.broken_image, color: Colors.grey[600]),
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- MODIFICADA FUNCIÓN: _showImageGallery (SIN CAMBIOS FUNCIONALES) ---
  void _showImageGallery(BuildContext context, List<String> imageUrls, {int initialIndex = 0}) {
    if (imageUrls.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay imágenes para mostrar en la galería.')),
      );
      return;
    }

    print('DEBUG: Abriendo galería con ${imageUrls.length} imágenes, iniciando en índice: $initialIndex');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewGallery.builder(
          itemCount: imageUrls.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(imageUrls[index]),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: PageController(initialPage: initialIndex),
          onPageChanged: (index) {
            print('DEBUG: Cambiando a imagen: $index');
          },
          enableRotation: true,
        ),
      ),
    );
  }

  // --- FUNCIÓN _buildGeneralInfoTab (USA _currentBuilding) ---
  Widget _buildGeneralInfoTab(
      Building building,
      ScrollController scrollController,
      bool isHistoryExpanded,
      VoidCallback toggleHistory,
      Color accentColor,
      ) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuickAccessButtons(building, accentColor),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.info_outline, color: accentColor),
              const SizedBox(width: 8),
              Text(
                'Información general',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            building.info,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          if (building.history != null && building.history!.isNotEmpty) ...[
            Row(
              children: [
                Icon(Icons.history, color: accentColor),
                const SizedBox(width: 8),
                Text(
                  'Historia del edificio',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                building.history!,
                maxLines: isHistoryExpanded ? null : 4,
                overflow: isHistoryExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (building.history!.length > 200)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: toggleHistory,
                  style: TextButton.styleFrom(
                    foregroundColor: accentColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(isHistoryExpanded ? 'Ver menos...' : 'Ver más...'),
                ),
              ),
            const SizedBox(height: 20),
          ],
          if (building.hours != null && building.hours is Map<String, String> && (building.hours as Map).isNotEmpty)
            _buildHoursSection(building.hours as Map<String, String>, accentColor),
          if (building.hours != null && building.hours is Map<String, String> && (building.hours as Map).isNotEmpty)
            const SizedBox(height: 20),
          if (building.contactInfo != null && building.contactInfo!.isNotEmpty)
            _buildContactSection(building.contactInfo!, accentColor),
          if (building.contactInfo != null && building.contactInfo!.isNotEmpty)
            const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- FUNCIÓN: _buildQuickAccessButtons (SIN CAMBIOS) ---
  Widget _buildQuickAccessButtons(Building building, Color accentColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Servicios Destacados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Esta sección no mostrará servicios destacados por ahora.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // --- FUNCIÓN: _buildHoursSection (SIN CAMBIOS) ---
  Widget _buildHoursSection(Map<String, String> hoursMap, Color accentColor) {
    final DateTime now = DateTime.now();
    final String currentDay = DateFormat('EEEE', 'es').format(now);
    final String currentDayCapitalized = currentDay.substring(0, 1).toUpperCase() + currentDay.substring(1);

    String todayHours = hoursMap[currentDayCapitalized] ?? 'Horario no disponible';
    String statusText = '';
    Color statusColor = Colors.grey;

    if (todayHours.toLowerCase() == 'cerrado') {
      statusText = 'Cerrado';
      statusColor = Colors.red.shade700;
    } else if (todayHours.contains('-')) {
      try {
        final parts = todayHours.split(' - ');
        final String openTimeStr = parts[0];
        final String closeTimeStr = parts[1];

        final openHour = int.parse(openTimeStr.split(':')[0]);
        final openMinute = int.parse(openTimeStr.split(':')[1]);
        final closeHour = int.parse(closeTimeStr.split(':')[0]);
        final closeMinute = int.parse(closeTimeStr.split(':')[1]);

        final DateTime openTime = DateTime(now.year, now.month, now.day, openHour, openMinute);
        final DateTime closeTime = DateTime(now.year, now.month, now.day, closeHour, closeMinute);

        if (now.isAfter(openTime) && now.isBefore(closeTime)) {
          statusText = 'Abierto ahora';
          statusColor = Colors.green.shade700;
          final timeUntilClose = closeTime.difference(now);
          final hoursRemaining = timeUntilClose.inHours;
          final minutesRemaining = timeUntilClose.inMinutes.remainder(60);
          statusText += ' - Cierra en ${hoursRemaining}h ${minutesRemaining}m';
        } else if (now.isBefore(openTime)) {
          statusText = 'Cerrado - Abre a las $openTimeStr';
          statusColor = Colors.red.shade700;
        } else {
          statusText = 'Cerrado - Abrió a las $openTimeStr';
          statusColor = Colors.red.shade700;
        }
      } catch (e) {
        statusText = 'Error al procesar horario';
        statusColor = Colors.grey;
        todayHours = 'Formato inválido';
      }
    } else {
      statusText = 'Horario no especificado';
      statusColor = Colors.grey;
    }

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, color: accentColor),
                const SizedBox(width: 8),
                Text(
                  'Horario',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Hoy: $todayHours',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                _showFullScheduleDialog(context, hoursMap, accentColor);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Ver horario completo', style: TextStyle(color: accentColor)),
                  Icon(Icons.keyboard_arrow_right, color: accentColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- FUNCIÓN: _showFullScheduleDialog (SIN CAMBIOS) ---
  void _showFullScheduleDialog(BuildContext context, Map<String, String> hoursMap, Color accentColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Horario Completo',
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: hoursMap.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(entry.value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cerrar', style: TextStyle(color: accentColor)),
            ),
          ],
        );
      },
    );
  }

  // --- FUNCIÓN: _buildContactSection (SIN CAMBIOS) ---
  Widget _buildContactSection(String contactInfo, Color accentColor) {
    bool isPhoneNumber = RegExp(r'^\+?[0-9\s\-\(\)]+$').hasMatch(contactInfo.replaceAll(RegExp(r'\s|-|\(|\)'), ''));
    bool isEmail = contactInfo.contains('@') && contactInfo.contains('.');

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.phone, color: accentColor),
                const SizedBox(width: 8),
                Text(
                  'Contacto',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              contactInfo,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (isPhoneNumber || isEmail)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () async {
                    if (isPhoneNumber) {
                      final url = 'tel:${contactInfo.replaceAll(RegExp(r'\s|-|\(|\)'), '')}';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No se puede abrir el marcador para llamar a $contactInfo')),
                        );
                      }
                    } else if (isEmail) {
                      final url = 'mailto:$contactInfo';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No se puede abrir el cliente de correo para $contactInfo')),
                        );
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: accentColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isPhoneNumber ? Icons.call : Icons.email, size: 18),
                      const SizedBox(width: 4),
                      Text(isPhoneNumber ? 'Llamar' : 'Enviar correo'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // --- FUNCIÓN: _buildSpecialServicesTab (USA _currentBuilding) ---
  Widget _buildSpecialServicesTab(Building building, ScrollController scrollController, Color accentColor) {
    final List<Room> specialServices = building.rooms
        ?.where((room) =>
    (room.isServiceRoom ?? false) &&
        (room.floor == 'General' || room.floor == 'Servicios Especiales' || room.floor.isEmpty)
    )
        .toList() ?? [];

    if (specialServices.isEmpty) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No hay servicios especiales listados para este edificio en esta sección.'),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Servicios Generales y Especiales',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...specialServices.map((room) => _buildRoomTile(room, accentColor)).toList(), // Conviértelo a lista explícitamente
        ],
      ),
    );
  }

  // --- FUNCIÓN: _buildRoomsList (USA _buildRoomTile modificado) ---
  Widget _buildRoomsList(List<Room> rooms, ScrollController scrollController, Color accentColor) {
    if (rooms.isEmpty) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No hay aulas o servicios específicos listados para este piso.'),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rooms.map((room) => _buildRoomTile(room, accentColor)).toList(),
      ),
    );
  }

  // --- FUNCIÓN: _buildRoomTile (MODIFICADA PARA SER CLICKEABLE) ---
  Widget _buildRoomTile(Room room, Color accentColor) {
    IconData icon;
    if (room.isServiceRoom ?? false) {
      if (room.name?.toLowerCase().contains('cuarto técnico') ?? false) {
        icon = Icons.handyman;
      } else if (room.name!.toLowerCase().contains('aseo') || room.name!.toLowerCase().contains('baño') || room.name!.toLowerCase().contains('wc')) {
        icon = Icons.wc;
      } else if (room.name?.toLowerCase().contains('préstamos') ?? false) {
        icon = Icons.gamepad;
      } else if (room.name?.toLowerCase().contains('bebedero') ?? false) {
        icon = Icons.local_drink;
      } else if (room.name?.toLowerCase().contains('máquinas dispensadoras') ?? false) {
        icon = Icons.local_cafe;
      } else if (room.name?.toLowerCase().contains('cafetería') ?? false) {
        icon = Icons.restaurant;
      } else if (room.name?.toLowerCase().contains('dispensador de condones') ?? false) {
        icon = Icons.medical_services;
      } else if (room.name?.toLowerCase().contains('puntos de carga') ?? false) {
        icon = Icons.battery_charging_full;
      } else if (room.name?.toLowerCase().contains('sala oasis') ?? false) {
        icon = Icons.bed;
      } else if (room.name?.toLowerCase().contains('centro de impresión') ?? false) {
        icon = Icons.print;
      } else if (room.name?.toLowerCase().contains('enfermería') ?? false) {
        icon = Icons.local_hospital;
      } else {
        icon = Icons.info_outline;
      }
    } else {
      if (room.name?.toLowerCase().contains('laboratorio') ?? false) {
        icon = Icons.science;
      } else if ((room.name?.toLowerCase().contains('oficina') ?? false) || room.number.toLowerCase().startsWith('of')) {
        icon = Icons.business;
      } else if (room.name?.toLowerCase().contains('auditorio') ?? false) {
        icon = Icons.theater_comedy;
      } else if (room.name?.toLowerCase().contains('sala de estudio') ?? false) {
        icon = Icons.menu_book;
      } else if ((room.name?.toLowerCase().contains('cómputo') ?? false) || (room.name?.toLowerCase().contains('computo') ?? false) || (room.name?.toLowerCase().contains('unidad de informática') ?? false)) {
        icon = Icons.computer;
      } else if (room.name?.toLowerCase().contains('aula') ?? false) {
        icon = Icons.class_;
      } else {
        icon = Icons.bookmark_outline;
      }
    }

    List<Widget> subtitleWidgets = [];
    if (room.description != null && room.description!.isNotEmpty) {
      subtitleWidgets.add(Text(room.description!));
    } else if (room.name != null && room.name != room.number) {
      subtitleWidgets.add(Text(room.name!));
    }
    if (room.number.isNotEmpty && (room.name == null || room.name == room.number)) {
      subtitleWidgets.add(Text('Número: ${room.number}'));
    }

    // Aquí no se muestra la lista de profesores completa, solo la referencia a ellos
    if (room.professors != null && room.professors!.isNotEmpty) {
      if (subtitleWidgets.isNotEmpty) {
        subtitleWidgets.add(const SizedBox(height: 4));
      }
      subtitleWidgets.add(Text(
        'Profesores: ${room.professors!.map((p) => p.name).join(', ')}',
        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
      ));
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell( // <<-- USA InkWell para hacerlo clickeable con efecto de tinta
        onTap: () {
          // Muestra el BottomSheet de edición cuando se toca el tile
          showModalBottomSheet(
            context: context,
            isScrollControlled: true, // Permite que ocupe casi toda la pantalla
            backgroundColor: Colors.transparent,
            builder: (context) => EditRoomSheet(
              room: room,
              accentColor: accentColor,
              onRoomUpdated: _onRoomUpdated, // Pasa el callback para actualizar la Room
            ),
          );
        },
        child: Padding( // <<-- Envuelve el contenido en Padding para el espacio
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: accentColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.name ?? room.number,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    if (subtitleWidgets.isNotEmpty) ...subtitleWidgets,
                  ],
                ),
              ),
              const Icon(Icons.edit, color: Colors.grey), // Un pequeño icono para indicar que es editable
            ],
          ),
        ),
      ),
    );
  }
}

// Delegate para la SliverPersistentHeader para mantener la TabBar pegada (SIN CAMBIOS)
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}