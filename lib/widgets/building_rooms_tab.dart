// lib/widgets/building_rooms_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../widgets/common_info_widgets.dart'; // Para InfoRow
import '../widgets/edit_room_sheet.dart'; // Para el sheet de edición
// Importa las utilidades de horario
import '../utils/schedule_utils.dart';

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
                        room.name ?? room.number,
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
                            room: room,
                            accentColor: widget.accentColor,
                            onRoomUpdated: (updatedRoom) {
                              widget.onRoomUpdated(updatedRoom);
                              Navigator.pop(context);
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
                // LÍNEA ELIMINADA: Ya no se muestra el horario de la sala
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