// lib/widgets/building_rooms_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../widgets/common_info_widgets.dart'; // Para InfoRow
import '../widgets/edit_room_sheet.dart'; // Para el sheet de edición
// Importa las utilidades de horario
import '../utils/schedule_utils.dart'; // <--- IMPORTANTE

// Las enums y clases OpeningStatus/OpeningInfo ya no necesitan ser declaradas aquí
// si las importas desde 'package:your_app_name/utils/schedule_utils.dart'.


class BuildingRoomsTab extends StatefulWidget {
  final Building building; // Mantenemos Building por si necesitas info global
  final List<Room> rooms; // Ahora recibe directamente las habitaciones filtradas
  final ScrollController scrollController;
  final Color accentColor;
  final ValueChanged<Room> onRoomUpdated; // Callback para cuando una habitación es actualizada

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
  // Las funciones _parseTime, _getDayName, _formatMinutes, _getOpeningStatus
  // YA NO NECESITAN ESTAR AQUÍ. SE IMPORTAN DE schedule_utils.dart

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

    return ListView.builder(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.rooms.length,
      itemBuilder: (context, index) {
        final room = widget.rooms[index];
        // Usa la función global getOpeningStatus
        final openingInfo = getOpeningStatus(room.scheduleMap);

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        room.name ?? room.number, // Usa el nombre si existe, sino el número
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, size: 20, color: widget.accentColor),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => EditRoomSheet(
                            room: room, // <--- AHORA SÍ ES 'room'
                            accentColor: widget.accentColor,
                            onRoomUpdated: (updatedRoom) { // <--- AHORA SÍ ES 'onRoomUpdated'
                              widget.onRoomUpdated(updatedRoom); // Llama al callback para notificar al padre
                              Navigator.pop(context); // Cierra el sheet de edición
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                if (room.description != null && room.description!.isNotEmpty)
                  InfoRow(
                    icon: Icons.info_outline,
                    label: 'Descripción',
                    value: room.description!,
                    color: widget.accentColor,
                  ),
                if (room.capacity != null)
                  InfoRow(
                    icon: Icons.people,
                    label: 'Capacidad',
                    value: '${room.capacity} personas',
                    color: widget.accentColor,
                  ),
                if (room.equipment != null && room.equipment!.isNotEmpty)
                  InfoRow(
                    icon: Icons.build,
                    label: 'Equipamiento',
                    value: room.equipment!.join(', '),
                    color: widget.accentColor,
                  ),
                if (room.contact != null && room.contact!.isNotEmpty)
                  InfoRow(
                    icon: Icons.contact_mail,
                    label: 'Contacto',
                    value: room.contact!,
                    color: widget.accentColor,
                  ),
                // Horario de la sala
                InfoRow(
                  icon: openingInfo.status == OpeningStatus.open ? Icons.lock_open : Icons.lock_outline,
                  label: 'Horario',
                  value: '${openingInfo.message}' + (openingInfo.closingTime != null && openingInfo.closingTime != '24 horas' ? ' (cierra a las ${openingInfo.closingTime})' : ''),
                  color: openingInfo.color,
                ),
                if (room.isAccessible == true)
                  InfoRow(
                    icon: Icons.accessible,
                    label: 'Accesibilidad',
                    value: 'Accesible para silla de ruedas',
                    color: widget.accentColor,
                  ),
                if (room.professors != null && room.professors!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Profesores a Cargo:',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: widget.accentColor),
                      ),
                      ...room.professors!.map((professor) => Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          '${professor.name} - ${professor.department}' +
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
      },
    );
  }
}