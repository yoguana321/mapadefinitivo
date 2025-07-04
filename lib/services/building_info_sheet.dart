// lib/services/building_info_sheet.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Importar Professor para usar en las tarjetas de profesores

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
                        // Aquí, por tu solicitud, esta sección se mostrará vacía o con un mensaje.
                        return _buildSpecialServicesTab(widget.building, scrollController, primaryTabColor);
                      } else {
                        // Para las pestañas de pisos, filtramos las habitaciones que no son servicios generales
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
    return Stack(
      children: [
        // imagen, gradiente, contenido...
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
                            Navigator.pop(context);
                            showBuildingInfo(context, building);
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

  // --- FUNCIÓN _buildGeneralInfoTab ACTUALIZADA: Eliminando Cards y ajustando "Servicios Destacados" ---
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
        crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda para todo
        children: [
          // Sección de Servicios Destacados (Ahora vacía/con mensaje)
          _buildQuickAccessButtons(building, accentColor), // Esta función ahora regresará SizedBox.shrink() o un mensaje
          const SizedBox(height: 20), // Espacio después de los botones de acceso rápido

          // --- Información General (SIN Card) ---
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

          // --- Historia del edificio (SIN Card, pero manteniendo expandible) ---
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
            if (building.history!.length > 200) // Puedes ajustar este umbral
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

          // --- Horario (SIN Card) ---
          if (building.hours != null && building.hours!.isNotEmpty) ...[
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
            const SizedBox(height: 8),
            Text(
              building.hours!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
          ],

          // --- Contacto (SIN Card) ---
          if (building.contactInfo != null && building.contactInfo!.isNotEmpty)
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
            building.contactInfo!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // No se necesita SizedBox al final de la última sección si no hay más elementos.
        ],
      ),
    );
  }

  // --- FUNCIÓN _buildQuickAccessButtons (AHORA VACÍA/CON MENSAJE) ---
  Widget _buildQuickAccessButtons(Building building, Color accentColor) {
    // Por tu solicitud, esta sección no mostrará ningún botón ni servicio destacado.
    // Solo mostrará un mensaje o se ocultará completamente.
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
    // Si quisieras que se ocultara completamente si no hay nada, podrías hacer:
    // return const SizedBox.shrink();
  }


  // --- FUNCIONES AUXILIARES _infoCard y _expandableCard ELIMINADAS ---
  // Ya que su lógica se ha integrado directamente en _buildGeneralInfoTab.
  // Si en otro lugar de tu código las estabas llamando, necesitarás ajustar ese lugar.

  // Widget para construir la pestaña de Servicios Especiales (MÉTODO DE LA CLASE)
  // Aquí se mostrarán los servicios que NO son aulas y NO son los "destacados" del general.
  Widget _buildSpecialServicesTab(Building building, ScrollController scrollController, Color accentColor) {
    // Filtrar los servicios que son isServiceRoom, pero NO están en un piso específico (ej. los que eran 'General' en tu data original)
    // O podrías poner aquí los servicios que tienen el campo 'specialService: true' si lo agregaras a Room.
    final List<Room> specialServices = building.rooms
        ?.where((room) => (room.isServiceRoom ?? false) && (room.floor == 'General' || room.floor.isEmpty)) // Puedes ajustar la condición para tus "servicios especiales"
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
            'Servicios Generales y Especiales', // O solo 'Servicios Especiales'
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...specialServices.map((room) => _buildRoomTile(room, accentColor)),
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
    // Lógica para el icono:
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
                    backgroundColor: accentColor.withAlpha((255 * 0.7).round()),
                    // Aquí podrías usar professor.imageUrl si lo tuvieras, por ahora un placeholder
                    child: Text(professor.name.isNotEmpty ? professor.name[0].toUpperCase() : '?', style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(professor.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  // CAMBIO AQUÍ: Usar professor.roomNumber
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