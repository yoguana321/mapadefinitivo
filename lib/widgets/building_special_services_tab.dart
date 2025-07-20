// lib/widgets/building_special_services_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
import '../widgets/edit_room_sheet.dart';
import '../utils/schedule_utils.dart';

class BuildingSpecialServicesTab extends StatefulWidget {
  final Building building;
  final ScrollController scrollController;
  final Color accentColor;
  final Function(Room) onRoomUpdated;

  const BuildingSpecialServicesTab({
    Key? key,
    required this.building,
    required this.scrollController,
    required this.accentColor,
    required this.onRoomUpdated,
  }) : super(key: key);

  @override
  State<BuildingSpecialServicesTab> createState() => _BuildingSpecialServicesTabState();
}

class _BuildingSpecialServicesTabState extends State<BuildingSpecialServicesTab> {
  @override
  Widget build(BuildContext context) {
    if (widget.building.specialServices == null || widget.building.specialServices!.isEmpty) {
      return ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Text(
              'No hay servicios especiales registrados para este edificio.',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.building.specialServices!.length,
      itemBuilder: (context, index) {
        final service = widget.building.specialServices![index];

        List<Widget> subtitleWidgets = [];
        if (service.number != null && service.number!.isNotEmpty) {
          subtitleWidgets.add(Text('Ubicación: ${service.number}'));
        }
        if (service.capacity != null) {
          subtitleWidgets.add(Text('Capacidad: ${service.capacity} personas'));
        }
        if (service.isAccessible == true) {
          subtitleWidgets.add(const Text('Accesible para personas con movilidad reducida'));
        }
        if (service.equipment != null && service.equipment!.isNotEmpty) {
          subtitleWidgets.add(Text('Equipo: ${service.equipment!.join(', ')}'));
        }
        if (service.contact != null && service.contact!.isNotEmpty) {
          subtitleWidgets.add(Text('Contacto: ${service.contact!}'));
        }
        if (service.professors != null && service.professors!.isNotEmpty) {
          subtitleWidgets.add(Text('Responsables: ${service.professors!.map((p) => p.name).join(', ')}'));
        }

        // LÍNEA ELIMINADA: Ya no se muestra el estado de apertura
        // Comentado para referencia:
        // final openingInfo = getOpeningStatus(service.scheduleMap);
        // subtitleWidgets.add(
        //   Padding(
        //     padding: const EdgeInsets.only(top: 4.0),
        //     child: Row(
        //       children: [
        //         Icon(
        //           openingInfo.status == OpeningStatus.open ? Icons.lock_open : Icons.lock_outline,
        //           color: openingInfo.color,
        //           size: 16,
        //         ),
        //         const SizedBox(width: 4),
        //         Text(
        //           openingInfo.message,
        //           style: TextStyle(
        //             color: openingInfo.color,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 12,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              service.name ?? 'Servicio sin nombre',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: subtitleWidgets.isNotEmpty
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subtitleWidgets,
            )
                : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: widget.accentColor, size: 20),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => EditRoomSheet(
                    room: service,
                    accentColor: widget.accentColor,
                    onRoomUpdated: (updatedRoom) {
                      widget.onRoomUpdated(updatedRoom);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}