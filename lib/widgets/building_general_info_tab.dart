// lib/widgets/building_general_info_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../widgets/common_info_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
// Importa las utilidades de horario
import '../utils/schedule_utils.dart'; // <--- IMPORTANTE

class BuildingGeneralInfoTab extends StatefulWidget {
  final Building building;
  final ScrollController scrollController;
  final Color accentColor;

  const BuildingGeneralInfoTab({
    Key? key,
    required this.building,
    required this.scrollController,
    required this.accentColor,
  }) : super(key: key);

  @override
  State<BuildingGeneralInfoTab> createState() => _BuildingGeneralInfoTabState();
}

class _BuildingGeneralInfoTabState extends State<BuildingGeneralInfoTab> {
  bool _isHistoryExpanded = false;
  Timer? _hourlyUpdateTimer;

  @override
  void initState() {
    super.initState();
    // Inicia un temporizador para forzar la actualización del horario cada 30 segundos
    // Esto asegura que el estado "Cierra pronto" o "Abierto" se actualice.
    _hourlyUpdateTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        setState(() {
          // Esto forzará la reconstrucción y recalculará el estado del horario
        });
      }
    });
  }

  @override
  void dispose() {
    _hourlyUpdateTimer?.cancel(); // Cancela el temporizador al desechar el widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usa la función global getOpeningStatus
    OpeningInfo openingInfo = getOpeningStatus(widget.building.hours);

    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16.0),
      children: [
        // Sección de Horario
        InfoSection(
          title: 'Horario',
          icon: Icons.access_time,
          accentColor: widget.accentColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    openingInfo.status == OpeningStatus.open ? Icons.lock_open : Icons.lock_outline,
                    color: openingInfo.color,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    openingInfo.message,
                    style: TextStyle(
                      color: openingInfo.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (openingInfo.closingTime != null && openingInfo.closingTime != '24 horas')
                    Text(
                      ' (cierra a las ${openingInfo.closingTime})',
                      style: TextStyle(
                        color: openingInfo.color,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
              if (widget.building.hours != null && widget.building.hours!.isNotEmpty)
                TextButton(
                  onPressed: () => showFullScheduleDialog(context, widget.building.hours!, widget.accentColor), // Usa la función global
                  child: Text('Ver horario completo', style: TextStyle(color: widget.accentColor)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Sección de Información
        InfoSection(
          title: 'Información General',
          icon: Icons.info_outline,
          accentColor: widget.accentColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.building.info.isNotEmpty) // Mostrar solo si hay info
                Text(
                  widget.building.info,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 8),
              if (widget.building.address != null && widget.building.address!.isNotEmpty)
                InfoRow(
                  icon: Icons.location_on,
                  label: 'Dirección',
                  value: widget.building.address!,
                  color: widget.accentColor,
                ),
              if (widget.building.contactInfo != null && widget.building.contactInfo!.isNotEmpty)
                InfoRow(
                  icon: Icons.phone,
                  label: 'Contacto',
                  value: widget.building.contactInfo!,
                  color: widget.accentColor,
                ),
              if (widget.building.website != null && widget.building.website!.isNotEmpty)
                InfoRow(
                  icon: Icons.link,
                  label: 'Sitio Web',
                  value: widget.building.website!,
                  color: widget.accentColor,
                  isLink: true,
                ),
              if (widget.building.isAccessible == true)
                InfoRow(
                  icon: Icons.accessible_forward,
                  label: 'Accesibilidad',
                  value: 'Edificio accesible para personas con movilidad reducida.',
                  color: widget.accentColor,
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Sección de Historia
        if (widget.building.history != null && widget.building.history!.isNotEmpty)
          InfoSection(
            title: 'Historia',
            icon: Icons.history,
            accentColor: widget.accentColor,
            content: GestureDetector(
              onTap: () {
                setState(() {
                  _isHistoryExpanded = !_isHistoryExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.building.history!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: _isHistoryExpanded ? null : 3,
                    overflow: _isHistoryExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  if (widget.building.history!.length > 300)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _isHistoryExpanded ? 'Mostrar menos' : 'Leer más',
                        style: TextStyle(
                          color: widget.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}