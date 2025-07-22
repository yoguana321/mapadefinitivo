// lib/widgets/building_rooms_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../widgets/common_info_widgets.dart'; // Para InfoRow
// import '../widgets/edit_room_sheet.dart'; // ¡ELIMINAR ESTA LÍNEA!
// Importa las utilidades de horario
import '../utils/schedule_utils.dart'; // Aunque no se usa directamente aquí para horario de sala, es buena práctica mantenerla si tu app la usa

class BuildingRoomsTab extends StatefulWidget {
  final Building building;
  final List<Room> rooms;
  final ScrollController scrollController;
  final Color accentColor;
  // final ValueChanged<Room> onRoomUpdated; // ¡ELIMINAR ESTA LÍNEA!

  const BuildingRoomsTab({
    Key? key,
    required this.building,
    required this.rooms,
    required this.scrollController,
    required this.accentColor,
    // required this.onRoomUpdated, // ¡ELIMINAR ESTA LÍNEA!
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
      case 'Sala de Cómputo':
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
      case 'Oficina de Posgrado':
      case 'Oficina de Profesores':
      case 'Secretaría':
        return Icons.corporate_fare_outlined;
      case 'Servicios':
        return Icons.room_service_outlined;
      case 'Infraestructura':
        return Icons.construction_outlined;
      case 'Sala de Reuniones':
        return Icons.group_work_outlined;
      case 'Centro de Documentación':
        return Icons.library_books_outlined;
      case 'Sala de Estudiantes':
        return Icons.group_outlined;
      default:
        return Icons.room_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtén el tema actual aquí

    if (widget.rooms.isEmpty) {
      return ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.all(16.0),
        children: [
          Center( // Añadido Center para centrar el texto
            child: Text(
              'No hay información disponible para esta sección.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7), // Usa onSurface para el color del texto
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    // --- LOGIC FOR GROUPING AND SORTING ---
    final Map<String, List<Room>> roomsByCategory = {};
    for (var room in widget.rooms) {
      final category = room.category ?? 'Otros Espacios';
      roomsByCategory.putIfAbsent(category, () => []).add(room);
    }

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
      if (indexA == -1 && indexB == -1) return a.compareTo(b);
      if (indexA == -1) return 1;
      if (indexB == -1) return -1;
      return indexA.compareTo(indexB);
    });

    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      children: sortedCategories.map((category) {
        final roomsInThisCategory = roomsByCategory[category]!;
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

        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // El color de fondo de la Card ya se ajusta con el tema automáticamente si no lo sobrescribes.
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.accentColor, // Este color suele ser un color primario, por lo que está bien.
                  ),
                ),
                Divider(height: 20, thickness: 1, color: theme.dividerColor), // Asegura que el divisor también se ajuste al tema
                ...roomsInThisCategory.map((room) {
                  const double infoRowIndent = 28.0;

                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: theme.colorScheme.outlineVariant, width: 0.8), // Usar color de esquema para el borde
                    ),
                    // El color de fondo de esta Card interior también se ajusta automáticamente.
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
                                          color: theme.colorScheme.onSurface, // CAMBIO AQUÍ: Usar onSurface para el texto principal
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // ELIMINAMOS EL ICONO DE LÁPIZ DE EDICIÓN Y SU onPressed
                            ],
                          ),
                          // Room details (InfoRow and custom paddings)
                          if (room.description != null && room.description!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0, left: infoRowIndent),
                              child: Text(
                                room.description!,
                                style: theme.textTheme.bodySmall?.copyWith( // CAMBIO AQUÍ: Usar theme en lugar de Theme.of(context)
                                  color: theme.colorScheme.onSurface.withOpacity(0.7), // Un poco más tenue
                                ),
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
                                    style: theme.textTheme.bodySmall?.copyWith( // CAMBIO AQUÍ: Usar theme
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.onSurface, // Título del horario
                                    ),
                                  ),
                                  ...room.scheduleMap!.entries.map((e) =>
                                      Text(
                                        '  ${e.key}: ${e.value}',
                                        style: theme.textTheme.bodySmall?.copyWith( // CAMBIO AQUÍ: Usar theme
                                          color: theme.colorScheme.onSurface.withOpacity(0.8), // Texto del horario
                                        ),
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
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: widget.accentColor, // Se mantiene el color de acento
                                    ),
                                  ),
                                ),
                                ...room.professors!.map((professor) => Padding(
                                  padding: EdgeInsets.only(left: infoRowIndent + 8.0, top: 4.0),
                                  child: Text(
                                    '${professor.name ?? ''} - ${professor.department ?? ''}' +
                                        (professor.email != null ? ' (${professor.email})' : ''),
                                    style: theme.textTheme.bodyMedium?.copyWith( // CAMBIO AQUÍ: Usar theme
                                      color: theme.colorScheme.onSurface.withOpacity(0.8), // Texto de profesores
                                    ),
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