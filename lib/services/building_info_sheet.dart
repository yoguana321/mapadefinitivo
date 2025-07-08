// lib/services/building_info_sheet.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import 'package:shared_preferences/shared_preferences.dart';

// NUEVO: Importar para la galería de imágenes
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// Importar para formatear la fecha y hora y para URL Launcher
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


// La función principal para mostrar el bottom sheet
Future<void> showBuildingInfo(BuildContext context, Building building) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return _BuildingInfoSheetContent(building: building);
    },
  );
}

// StatefulWidget para manejar el estado interno (como la expansión de historia)
class _BuildingInfoSheetContent extends StatefulWidget {
  final Building building;

  const _BuildingInfoSheetContent({
    required this.building,
  });

  @override
  State<_BuildingInfoSheetContent> createState() => _BuildingInfoSheetContentState();
}

class _BuildingInfoSheetContentState extends State<_BuildingInfoSheetContent> {
  bool _isHistoryExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<String> floors = widget.building.rooms
        ?.map((room) => room.floor)
        .where((floor) => floor != 'General' && floor.isNotEmpty)
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
    final Color primaryTabColor = widget.building.markerColor ?? Theme.of(context).primaryColor;

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
                // --- ENCABEZADO MEJORADO (Ahora con múltiples imágenes y funcionalidad de galería) ---
                _buildHeader(context, widget.building, primaryTabColor),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detalles y Ubicaciones',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                  ),
                ),
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
                Expanded(
                  child: TabBarView(
                    children: tabs.map((tab) {
                      if (tab == 'General') {
                        return _buildGeneralInfoTab(
                          widget.building,
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
                        return _buildSpecialServicesTab(widget.building, scrollController, primaryTabColor);
                      } else {
                        final roomsOnFloor = widget.building.rooms
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
        );
      },
    );
  }

  // --- FUNCIÓN DE ENCABEZADO MEJORADA (MÉTODO DE LA CLASE) ---
  Widget _buildHeader(BuildContext context, Building building, Color primaryTabColor) {
    // Usamos la primera imagen de la lista para mostrarla en el encabezado
    final String displayImageUrl = building.imageUrls.isNotEmpty
        ? building.imageUrls.first
        : 'assets/images/placeholder.jpg'; // Imagen por defecto si no hay URLs

    return Stack(
      children: [
        // Imagen de fondo con GestureDetector para la galería
        GestureDetector(
          onTap: () {
            if (building.imageUrls.isNotEmpty) {
              _showImageGallery(context, building.imageUrls);
            }
          },
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              displayImageUrl, // Muestra la primera imagen
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
            ),
          ),
        ),
        // Capa de degradado doble
        Positioned.fill(
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
        // Botón de cerrar flotante
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
        // Contenido textual superpuesto
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: primaryTabColor.withOpacity(0.85),
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
                  FutureBuilder<SharedPreferences>(
                    future: SharedPreferences.getInstance(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox.shrink();
                      final prefs = snapshot.data!;
                      final isFavorite = prefs.getBool('fav_${building.id}') ?? false;

                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        onPressed: () async {
                          final newValue = !isFavorite;
                          await prefs.setBool('fav_${building.id}', newValue);
                          // For simplicity, we'll just trigger a rebuild by setting state
                          setState(() {}); // Rebuild to update the favorite icon
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  // --- NUEVA FUNCIÓN: _showImageGallery ---
  void _showImageGallery(BuildContext context, List<String> imageUrls) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoViewGallery.builder(
          itemCount: imageUrls.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(imageUrls[index]), // Usamos AssetImage para imágenes locales
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: PageController(), // Se puede inicializar con un índice inicial si se desea
          onPageChanged: (index) {
            // Puedes añadir lógica aquí para saber qué imagen se está viendo
          },
          enableRotation: true, // Permite rotar la imagen
        ),
      ),
    );
  }

  // --- FUNCIÓN _buildGeneralInfoTab SIMPLIFICADA (SOLO HORARIO MAP) ---
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

          // Sección de Información General
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

          // Sección de Historia
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

          // --- SECCIÓN DE HORARIO (SOLO NUEVA VERSIÓN - MAP) ---
          // Solo muestra la sección si 'hours' es un Map<String, String> y no está vacío.
          // Si no es un Map o está vacío, simplemente no se muestra.
          if (building.hours is Map<String, String> && (building.hours as Map).isNotEmpty)
            _buildHoursSection(building.hours as Map<String, String>, accentColor),
          const SizedBox(height: 20), // Este SizedBox se mostrará si la sección de horario se mostró

          // --- SECCIÓN DE CONTACTO (NUEVA VERSIÓN) ---
          if (building.contactInfo != null && building.contactInfo!.isNotEmpty)
            _buildContactSection(building.contactInfo!, accentColor),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

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

  // --- NUEVA FUNCIÓN: _buildHoursSection (para Horario Interactivo) ---
  Widget _buildHoursSection(Map<String, String> hoursMap, Color accentColor) {
    // Obtener el día de la semana actual
    // Usamos el locale 'es' para asegurarnos de que el día esté en español (Lunes, Martes, etc.)
    final DateTime now = DateTime.now();
    final String currentDay = DateFormat('EEEE', 'es').format(now); // 'es' para español
    final String currentDayCapitalized = currentDay.substring(0, 1).toUpperCase() + currentDay.substring(1);

    String todayHours = hoursMap[currentDayCapitalized] ?? 'Horario no disponible';
    bool isOpen = false;
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

        // Parsear horas y minutos del string
        final openHour = int.parse(openTimeStr.split(':')[0]);
        final openMinute = int.parse(openTimeStr.split(':')[1]);
        final closeHour = int.parse(closeTimeStr.split(':')[0]);
        final closeMinute = int.parse(closeTimeStr.split(':')[1]);

        final DateTime openTime = DateTime(now.year, now.month, now.day, openHour, openMinute);
        final DateTime closeTime = DateTime(now.year, now.month, now.day, closeHour, closeMinute);

        if (now.isAfter(openTime) && now.isBefore(closeTime)) {
          isOpen = true;
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
      margin: EdgeInsets.zero, // Eliminar margen de Card si el Column ya lo tiene
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
                // Mostrar el horario de hoy con un estilo normal
                Text(
                  'Hoy: $todayHours',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Botón para ver horario completo
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

  // --- NUEVA FUNCIÓN: _showFullScheduleDialog (para mostrar el horario detallado) ---
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

  // --- NUEVA FUNCIÓN: _buildContactSection (para Contacto con acciones) ---
  Widget _buildContactSection(String contactInfo, Color accentColor) {
    // Intentar determinar si es un número de teléfono o un email
    // Implementación simple, puedes hacerla más robusta si es necesario
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
                      final url = 'tel:${contactInfo.replaceAll(RegExp(r'\s|-|\(|\)'), '')}'; // Limpia el número para el URL
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

  Widget _buildSpecialServicesTab(Building building, ScrollController scrollController, Color accentColor) {
    final List<Room> specialServices = building.rooms
        ?.where((room) => (room.isServiceRoom ?? false) && (room.floor == 'General' || room.floor.isEmpty))
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
          ...specialServices.map((room) => _buildRoomTile(room, accentColor)),
        ],
      ),
    );
  }

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

  // Widget auxiliar para mostrar una Room (Aula, Oficina, Servicio) de forma unificada (MÉTODO DE LA CLASE)
  // AHORA ES CLICKEABLE PARA VER MÁS DETALLES
  Widget _buildRoomTile(Room room, Color accentColor) {
    IconData icon;
    if (room.isServiceRoom ?? false) {
      if (room.name?.toLowerCase().contains('cuarto técnico') ?? false) {
        icon = Icons.handyman;
      } else if (room.name!.toLowerCase().contains('aseo') || room.name!.toLowerCase().contains('baño')) {
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
    } else if (room.number.isNotEmpty) {
      subtitleWidgets.add(Text('Número: ${room.number}'));
    }

    if (room.professors != null && room.professors!.isNotEmpty) {
      if (subtitleWidgets.isNotEmpty) {
        subtitleWidgets.add(const SizedBox(height: 8));
      }
      subtitleWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Profesores:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 4),
            ...room.professors!.map((professor) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0.5,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  leading: CircleAvatar(
                    backgroundColor: accentColor.withAlpha((255 * 0.7).round()),
                    child: Text(professor.name.isNotEmpty ? professor.name[0].toUpperCase() : '?', style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(professor.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  subtitle: Text(professor.roomNumber ?? 'Sin aula asignada', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                ),
              );
            }),
          ],
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Icon(icon, color: accentColor),
        title: Text(
          room.name ?? room.number,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: subtitleWidgets.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subtitleWidgets,
        )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // --- AÑADIDO: HACE EL TILE CLICKEABLE ---
        onTap: () => _showRoomDetailsDialog(context, room, accentColor),
      ),
    );
  }

  // --- NUEVA FUNCIÓN: _showRoomDetailsDialog para mostrar detalles de la habitación ---
  void _showRoomDetailsDialog(BuildContext context, Room room, Color accentColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            room.name ?? room.number,
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (room.number.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Número: ${room.number}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                if (room.description != null && room.description!.isNotEmpty) ...[
                  const Text('Descripción:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room.description!),
                  const SizedBox(height: 10),
                ],
                if (room.capacity != null && room.capacity!.isNotEmpty) ...[
                  const Text('Capacidad:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room.capacity!),
                  const SizedBox(height: 10),
                ],
                if (room.equipment != null && room.equipment!.isNotEmpty) ...[
                  const Text('Equipamiento:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room.equipment!),
                  const SizedBox(height: 10),
                ],
                if (room.contactInfo != null && room.contactInfo!.isNotEmpty) ...[
                  const Text('Contacto de la sala:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(room.contactInfo!),
                  const SizedBox(height: 10),
                ],
                if (room.professors != null && room.professors!.isNotEmpty) ...[
                  const Text('Profesores Asociados:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  ...room.professors!.map((professor) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text('${professor.name} (${professor.roomNumber ?? 'N/A'})'),
                  )),
                ],
              ],
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
}