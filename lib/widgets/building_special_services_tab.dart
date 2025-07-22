// lib/widgets/building_special_services_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../models/room.dart';
// import '../widgets/edit_room_sheet.dart'; // ¡ELIMINAR ESTA LÍNEA!
import '../utils/schedule_utils.dart'; // No se usa directamente aquí, pero se mantiene si es relevante para el proyecto.

class BuildingSpecialServicesTab extends StatefulWidget {
  final Building building;
  final ScrollController scrollController;
  final Color accentColor;
  // final Function(Room) onRoomUpdated; // ¡ELIMINAR ESTA LÍNEA!

  const BuildingSpecialServicesTab({
    Key? key,
    required this.building,
    required this.scrollController,
    required this.accentColor,
    // required this.onRoomUpdated, // ¡ELIMINAR ESTA LÍNEA!
  }) : super(key: key);

  @override
  State<BuildingSpecialServicesTab> createState() => _BuildingSpecialServicesTabState();
}

class _BuildingSpecialServicesTabState extends State<BuildingSpecialServicesTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtén el tema actual aquí

    if (widget.building.specialServices == null || widget.building.specialServices!.isEmpty) {
      return ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Text(
              'No hay servicios especiales registrados para este edificio.',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7), // Usa onSurface para el color del texto
              ),
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

        // Sección de subtitleWidgets - Aseguramos que los textos usen onSurface
        List<Widget> subtitleWidgets = [];
        if (service.number != null && service.number!.isNotEmpty) {
          subtitleWidgets.add(Text('Ubicación: ${service.number}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))));
        }
        if (service.capacity != null) {
          subtitleWidgets.add(Text('Capacidad: ${service.capacity} personas', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))));
        }
        if (service.isAccessible == true) {
          subtitleWidgets.add(Text('Accesible para personas con movilidad reducida', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))));
        }
        if (service.equipment != null && service.equipment!.isNotEmpty) {
          subtitleWidgets.add(Text('Equipo: ${service.equipment!.join(', ')}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))));
        }
        if (service.contact != null && service.contact!.isNotEmpty) {
          subtitleWidgets.add(Text('Contacto: ${service.contact!}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))));
        }
        // if (service.professors != null && service.professors!.isNotEmpty) {
        //   // Resto del código que estaba incompleto
        // }

        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // El color de fondo de la Card ya se ajusta con el tema automáticamente si no lo sobrescribes.
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.room_service_outlined, color: widget.accentColor),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          service.name ?? '',
                          style: theme.textTheme.titleMedium?.copyWith( // CAMBIO AQUÍ: Usar theme.textTheme y onSurface
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface, // CAMBIO CRUCIAL: Usar onSurface para el texto principal
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Renderiza los subtitleWidgets
                  // Envuelve los subtitleWidgets en un Column para asegurar el diseño vertical
                  if (subtitleWidgets.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: subtitleWidgets,
                    ),
                  const SizedBox(height: 8),
                  if (service.description != null && service.description!.isNotEmpty)
                    Text(
                      service.description!,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                    ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: service.features.map((feature) {
                      return Chip(
                        label: Text(feature),
                        labelStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.onSurface, // CAMBIO AQUÍ: Color del texto del chip
                        ),
                        backgroundColor: theme.colorScheme.surfaceVariant, // CAMBIO OPCIONAL: Fondo del chip para contraste
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  if (service.scheduleMap != null && service.scheduleMap!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Divider(color: theme.dividerColor), // Asegura que el divisor también se ajuste al tema
                    Text(
                      'Horario:',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface, // Título del horario
                      ),
                    ),
                    ...service.scheduleMap!.entries.map((entry) => Text(
                      '${entry.key}: ${entry.value}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.8), // Texto del horario
                      ),
                    )).toList(),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}