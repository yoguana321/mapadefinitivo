// lib/services/building_info_sheet.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../models/professor.dart'; // Importar Professor para usar en las tarjetas de profesores

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
    Key? key,
    required this.building,
  }) : super(key: key);

  @override
  State<_BuildingInfoSheetContent> createState() => _BuildingInfoSheetContentState();
}

class _BuildingInfoSheetContentState extends State<_BuildingInfoSheetContent> {
  bool _isHistoryExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Generar la lista de pisos dinámicamente y ordenarla
    final List<String> floors = widget.building.rooms
        ?.map((room) => room.floor)
        .where((floor) => floor != 'General' && floor.isNotEmpty) // Filtrar 'General' y vacíos para pisos
        .toSet() // Para obtener pisos únicos
        .toList() ?? [];
    floors.sort((a, b) {
      final numA = int.tryParse(a.replaceAll('Piso ', ''));
      final numB = int.tryParse(b.replaceAll('Piso ', ''));
      if (numA != null && numB != null) {
        return numA.compareTo(numB);
      }
      return a.compareTo(b); // Orden alfabético si no son números (ej. 'Sótano' vs 'Piso 1')
    });

    // Añadir 'Servicios Especiales' como una de las pestañas
    final List<String> tabs = ['General', 'Servicios Especiales', ...floors];

    // Determinar el color principal del TabBar (del markerColor del edificio)
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
                // Handle para arrastrar la hoja
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
                // --- ENCABEZADO MEJORADO ---
                _buildHeader(context, widget.building, primaryTabColor),

                // Contenido principal: TabBar (Distribución por Pisos) y TabBarView
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detalles y Ubicaciones', // Título más generalizado para las pestañas
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
                        // Filtramos los servicios que deben ir en esta pestaña
                        return _buildSpecialServicesTab(widget.building, scrollController, primaryTabColor);
                      } else {
                        // Para las pestañas de pisos, filtramos las habitaciones que no son servicios generales
                        final roomsOnFloor = widget.building.rooms
                            ?.where((room) => room.floor == tab && (room.isServiceRoom ?? false) == false) // Asegúrate que NO son servicios generales
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
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Stack(
        children: [
          // Imagen de fondo
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              building.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- FUNCIÓN _buildGeneralInfoTab ACTUALIZADA CON TARJETAS Y SERVICIOS DESTACADOS ---
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
        children: [
          // Sección de Servicios Destacados
          _buildQuickAccessButtons(building, accentColor),
          const SizedBox(height: 20), // Espacio después de los botones de acceso rápido

          _infoCard(
            icon: Icons.info_outline,
            title: 'Información general',
            content: building.info,
            accentColor: accentColor,
          ),
          const SizedBox(height: 12), // Espacio entre tarjetas
          if (building.history != null && building.history!.isNotEmpty) ...[
            _expandableCard(
              icon: Icons.history,
              title: 'Historia del edificio',
              content: building.history!,
              expanded: isHistoryExpanded,
              onToggle: toggleHistory,
              accentColor: accentColor,
            ),
            const SizedBox(height: 12), // Espacio entre tarjetas
          ],
          if (building.hours != null && building.hours!.isNotEmpty) ...[
            _infoCard(
              icon: Icons.access_time,
              title: 'Horario',
              content: building.hours!,
              accentColor: accentColor,
            ),
            const SizedBox(height: 12), // Espacio entre tarjetas
          ],
          if (building.contactInfo != null && building.contactInfo!.isNotEmpty)
            _infoCard(
              icon: Icons.phone,
              title: 'Contacto',
              content: building.contactInfo!,
              accentColor: accentColor,
            ),
          // No se necesita SizedBox al final de la última tarjeta
        ],
      ),
    );
  }

  // --- NUEVA FUNCIÓN PARA BOTONES DE ACCESO RÁPIDO (MÉTODO DE LA CLASE) ---
  Widget _buildQuickAccessButtons(Building building, Color accentColor) {
    // Filtra los servicios comunes que quieres destacar
    final List<Room> commonServices = building.rooms
        ?.where((room) =>
    (room.isServiceRoom ?? false) &&
        (room.name!.toLowerCase().contains('aseo') || // Cambiado de ?? false a directamente
            room.name!.toLowerCase().contains('baño') || // Cambiado de ?? false a directamente
            room.name!.toLowerCase().contains('cafetería') || // Cambiado de ?? false a directamente
            room.name!.toLowerCase().contains('enfermería') || // Cambiado de ?? false a directamente
            room.name!.toLowerCase().contains('centro de impresión') || // Cambiado de ?? false a directamente
            room.name!.toLowerCase().contains('préstamos'))) // Cambiado de ?? false a directamente
        .toList() ?? [];

    if (commonServices.isEmpty) {
      return const SizedBox.shrink(); // No muestra nada si no hay servicios comunes
    }

    // Mapea los nombres a los íconos para los botones
    IconData _getServiceIcon(String? serviceName) {
      if (serviceName == null) return Icons.info_outline;
      if (serviceName.toLowerCase().contains('aseo') || serviceName.toLowerCase().contains('baño')) {
        return Icons.wc;
      } else if (serviceName.toLowerCase().contains('cafetería')) {
        return Icons.restaurant_menu;
      } else if (serviceName.toLowerCase().contains('enfermería')) {
        return Icons.local_hospital;
      } else if (serviceName.toLowerCase().contains('centro de impresión')) {
        return Icons.print;
      } else if (serviceName.toLowerCase().contains('préstamos')) {
        return Icons.gamepad; // O Icons.library_books si es más de libros
      }
      return Icons.info_outline;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Servicios Destacados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90, // Altura fija para el carrusel de botones
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: commonServices.length,
            itemBuilder: (context, index) {
              final service = commonServices[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      // CAMBIO AQUÍ: Usar .withAlpha para reemplazar .withOpacity obsoleto
                      backgroundColor: accentColor.withAlpha((255 * 0.1).round()),
                      child: Icon(_getServiceIcon(service.name), color: accentColor, size: 30),
                    ),
                    const SizedBox(height: 6),
                    Flexible( // Usar Flexible para evitar desbordamiento del texto
                      child: Text(
                        service.name?.split(' ').first ?? 'Servicio', // Solo la primera palabra para el botón
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- FUNCIONES AUXILIARES PARA LAS TARJETAS (MÉTODOS DE LA CLASE) ---
  Widget _infoCard({
    required IconData icon,
    required String title,
    required String content,
    required Color accentColor,
  }) {
    return Card(
      margin: EdgeInsets.zero, // El margen se manejará con SizedBox en el Column padre
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: accentColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CAMBIO AQUÍ: Eliminado 'const' si el color no es constante
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  // --- ACCESIBILIDAD VISUAL: Color del texto. Eliminado 'const'
                  Text(content, style: TextStyle(fontSize: 14, color: Colors.grey[800])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expandableCard({
    required IconData icon,
    required String title,
    required String content,
    required bool expanded,
    required VoidCallback onToggle,
    required Color accentColor,
  }) {
    final bool showToggle = content.length > 200; // Puedes ajustar este umbral

    return Card(
      margin: EdgeInsets.zero, // El margen se manejará con SizedBox en el Column padre
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 28, color: accentColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // --- MEJORA UX: AnimatedSize para la historia expandible ---
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                content,
                maxLines: expanded ? null : 4,
                overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
                // --- ACCESIBILIDAD VISUAL: Color del texto. Eliminado 'const'
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
            ),
            if (showToggle)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: onToggle,
                  style: TextButton.styleFrom(
                    foregroundColor: accentColor,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(expanded ? 'Ver menos...' : 'Ver más...'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Widget para construir la pestaña de Servicios Especiales (MÉTODO DE LA CLASE)
  Widget _buildSpecialServicesTab(Building building, ScrollController scrollController, Color accentColor) {
    // Filtramos las salas que son servicios y que tienen 'General' como piso.
    final List<Room> specialServices = building.rooms
        ?.where((room) => (room.isServiceRoom ?? false) && room.floor == 'General')
        .toList() ?? [];

    if (specialServices.isEmpty) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16.0),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No hay servicios generales o especiales listados para este edificio.'),
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
          ...specialServices.map((room) => _buildRoomTile(room, accentColor)).toList(),
        ],
      ),
    );
  }

  // Widget para construir la lista de Rooms por piso (MÉTODO DE LA CLASE)
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
  Widget _buildRoomTile(Room room, Color accentColor) {
    IconData icon;
    // Eliminado 'subtitleText' ya que no se usa directamente
    // String subtitleText = '';

    // Lógica para el icono:
    if (room.isServiceRoom ?? false) {
      if (room.name?.toLowerCase().contains('cuarto técnico') ?? false) {
        icon = Icons.handyman;
      } else if (room.name!.toLowerCase().contains('aseo') || room.name!.toLowerCase().contains('baño')) { // Cambiado '?? false'
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
    } else { // Si no es un cuarto de servicio (o isServiceRoom es null/false)
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

    // Lógica mejorada para el subtítulo: Mostrar tarjetas de profesores si existen
    List<Widget> subtitleWidgets = [];
    if (room.description != null && room.description!.isNotEmpty) {
      subtitleWidgets.add(Text(room.description!));
    } else if (room.name != null && room.name != room.number) {
      subtitleWidgets.add(Text(room.name!));
    } else if (room.number.isNotEmpty) {
      subtitleWidgets.add(Text('Número: ${room.number}'));
    }

    // --- REDISEÑO PRO: Tarjetas individuales para profesores ---
    if (room.professors != null && room.professors!.isNotEmpty) {
      if (subtitleWidgets.isNotEmpty) {
        subtitleWidgets.add(const SizedBox(height: 8)); // Espacio entre descripción/número y profesores
      }
      subtitleWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Profesores:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 4),
            ...room.professors!.map((professor) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4), // Margen para separar tarjetas de profesor
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0.5, // Ligeramente elevado
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  leading: CircleAvatar(
                    // Aquí podrías usar professor.imageUrl si lo tuvieras, por ahora un placeholder
                    child: Text(professor.name.isNotEmpty ? professor.name[0].toUpperCase() : '?', style: const TextStyle(color: Colors.white)),
                    // CAMBIO AQUÍ: Usar .withAlpha para reemplazar .withOpacity obsoleto
                    backgroundColor: accentColor.withAlpha((255 * 0.7).round()),
                  ),
                  title: Text(professor.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  // CAMBIO AQUÍ: Usar professor.roomNumber
                  subtitle: Text(professor.roomNumber ?? 'Sin aula asignada', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                ),
              );
            }).toList(),
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
        // Si hay subtítulos, usa un Column; de lo contrario, null
        subtitle: subtitleWidgets.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: subtitleWidgets,
        )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}