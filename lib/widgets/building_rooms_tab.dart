// lib/widgets/building_rooms_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../widgets/common_info_widgets.dart'; // Para InfoRow
import '../widgets/edit_room_sheet.dart'; // Para el sheet de edición
// Importa las utilidades de horario
import '../utils/schedule_utils.dart'; // Aunque no se usa directamente aquí para horario de sala, es buena práctica mantenerla si tu app la usa

class BuildingRoomsTab extends StatefulWidget {
  final Building building;
  final List<Room> rooms;
  final ScrollController scrollController;
  final Color accentColor;
  final ValueChanged<Room> onRoomUpdated;

  const BuildingRoomsTab({
    Key? key,
    required this.building,
    required this.rooms,
    required this.scrollController,
    required this.accentColor,
    required this.onRoomUpdated,
  }) : super(key: key);

  @override
  State<BuildingRoomsTab> createState() => _BuildingRoomsTabState();
}

class _BuildingRoomsTabState extends State<BuildingRoomsTab> {

  // Helper function to get an icon based on room category
  IconData _getRoomIcon(String? category) {
    switch (category) {
      case 'Auditorios':
        return Icons.meeting_room;
      case 'Aulas':
        return Icons.class_outlined;
      case 'Aulas Especializadas':
      case 'Sala de Cómputo': // Añadir esta categoría aquí
        return Icons.laptop_mac_outlined;
      case 'Laboratorios':
        return Icons.science_outlined;
      case 'Salas de Estudio':
        return Icons.menu_book_outlined;
      case 'Salones Especiales':
        return Icons.event_seat_outlined;
      case 'Oficinas Administrativas':
      case 'Oficinas Académicas':
      case 'Oficinas de Bienestar':
      case 'Oficina de Posgrado': // Añadir estas categorías
      case 'Oficina de Profesores': // Añadir estas categorías
      case 'Secretaría':           // Añadir estas categorías
        return Icons.corporate_fare_outlined; // O Icons.person para profesores, etc.
      case 'Servicios':
        return Icons.room_service_outlined; // Un icono más específico para servicios generales
      case 'Infraestructura': // Añadir para el 401
        return Icons.construction_outlined;
      case 'Sala de Reuniones': // Añadir para el 406
        return Icons.group_work_outlined;
      case 'Centro de Documentación': // Añadir para el 406
        return Icons.library_books_outlined;
      case 'Sala de Estudiantes': // Añadir para el 406
        return Icons.group_outlined;
      default:
        return Icons.room_outlined; // General icon
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rooms.isEmpty) {
      return ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'No hay información disponible para esta sección.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    // --- LOGIC FOR GROUPING AND SORTING ---
    // (This logic remains largely the same, but now it's just for the *single* floor
    // represented by widget.rooms, assuming widget.rooms already contains rooms for one floor)

    // Group rooms on the current "floor" (which is represented by widget.rooms) by category
    final Map<String, List<Room>> roomsByCategory = {};
    for (var room in widget.rooms) {
      final category = room.category ?? 'Otros Espacios'; // Default category if not specified
      roomsByCategory.putIfAbsent(category, () => []).add(room);
    }

    // Sort categories for consistent display within this floor
    final List<String> sortedCategories = roomsByCategory.keys.toList();
    const categoryOrder = [
      'Auditorios',
      'Aulas',
      'Aulas Especializadas',
      'Laboratorios',
      'Salas de Estudio',
      'Salones Especiales',
      'Oficinas Académicas',
      'Oficinas Administrativas',
      'Oficinas de Bienestar',
      'Servicios',
      'Otros Espacios'
    ];
    sortedCategories.sort((a, b) {
      int indexA = categoryOrder.indexOf(a);
      int indexB = categoryOrder.indexOf(b);
      if (indexA == -1 && indexB == -1) return a.compareTo(b); // Fallback alphabetical
      if (indexA == -1) return 1;
      if (indexB == -1) return -1;
      return indexA.compareTo(indexB);
    });

    return ListView( // Changed from ListView.builder to a simple ListView
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      // No itemCount or itemBuilder needed for ListView directly
      children: sortedCategories.map((category) {
        final roomsInThisCategory = roomsByCategory[category]!;
        // Sort rooms within each category numerically by their 'number' field, then by name
        roomsInThisCategory.sort((a, b) {
          final numA = int.tryParse((a.number ?? '').replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
          final numB = int.tryParse((b.number ?? '').replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

          if (numA != 0 && numB != 0) {
            return numA.compareTo(numB);
          }
          int numComparison = (a.number ?? '').compareTo(b.number ?? '');
          if (numComparison != 0) return numComparison;
          return (a.name ?? '').compareTo(b.name ?? '');
        });

        // Use a Card to contain each category's rooms for a nice visual separation
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0), // Margin between categories
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding( // Add padding inside the category card
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( // Category Title
                  category,
                  style: TextStyle(
                    fontSize: 18, // Slightly larger for main category
                    fontWeight: FontWeight.bold,
                    color: widget.accentColor, // Use accent color for category titles
                  ),
                ),
                const Divider(height: 20, thickness: 1), // Separator for category
                ...roomsInThisCategory.map((room) {
                  const double infoRowIndent = 28.0; // Consistent indent

                  return Card(
                    elevation: 0, // No shadow for inner room cards
                    margin: const EdgeInsets.only(bottom: 8.0, top: 8.0), // Margin between rooms
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.grey[300]!, width: 0.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(_getRoomIcon(room.category), size: 20, color: widget.accentColor),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        room.number != null && room.number!.isNotEmpty
                                            ? '${room.name ?? ''} (${room.number})'
                                            : room.name ?? '',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blueGrey[800],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, size: 20, color: widget.accentColor),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => EditRoomSheet(
                                      room: room,
                                      accentColor: widget.accentColor,
                                      onRoomUpdated: (updatedRoom) {
                                        widget.onRoomUpdated(updatedRoom);
                                        // This will trigger a rebuild of the parent, which should
                                        // then pass the updated list to this tab.
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          // Room details (InfoRow and custom paddings)
                          if (room.description != null && room.description!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: infoRowIndent),
                              child: Text(
                                room.description!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          if (room.capacity != null)
                            InfoRow(
                              icon: Icons.people,
                              label: 'Capacidad',
                              value: '${room.capacity} personas',
                              color: widget.accentColor,
                              iconIndent: infoRowIndent,
                            ),
                          if (room.equipment != null && room.equipment!.isNotEmpty)
                            InfoRow(
                              icon: Icons.build,
                              label: 'Equipamiento',
                              value: room.equipment!.join(', '),
                              color: widget.accentColor,
                              iconIndent: infoRowIndent,
                            ),
                          if (room.contact != null && room.contact!.isNotEmpty)
                            InfoRow(
                              icon: Icons.contact_mail,
                              label: 'Contacto',
                              value: room.contact!,
                              color: widget.accentColor,
                              iconIndent: infoRowIndent,
                              isLink: room.contact!.contains('@') || room.contact!.contains('http'),
                            ),
                          if (room.isAccessible == true)
                            InfoRow(
                              icon: Icons.accessible,
                              label: 'Accesibilidad',
                              value: 'Accesible para silla de ruedas',
                              color: widget.accentColor,
                              iconIndent: infoRowIndent,
                            ),
                          if (room.scheduleMap != null && room.scheduleMap!.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 4.0, left: infoRowIndent),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Horario:',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  ...room.scheduleMap!.entries.map((e) =>
                                      Text(
                                        '  ${e.key}: ${e.value}',
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                  ).toList(),
                                ],
                              ),
                            ),
                          if (room.professors != null && room.professors!.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Padding(
                                  padding: EdgeInsets.only(left: infoRowIndent),
                                  child: Text(
                                    'Profesores a Cargo:',
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: widget.accentColor),
                                  ),
                                ),
                                ...room.professors!.map((professor) => Padding(
                                  padding: EdgeInsets.only(left: infoRowIndent + 8.0, top: 4.0),
                                  child: Text(
                                    '${professor.name ?? ''} - ${professor.department ?? ''}' +
                                        (professor.email != null ? ' (${professor.email})' : ''),
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                )).toList(),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}