// lib/widgets/building_general_info_tab.dart
import 'package:flutter/material.dart';
import '../models/building.dart';
import '../widgets/common_info_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
// Importa las utilidades de horario
import '../utils/schedule_utils.dart'; // <--- IMPORTANTE

// Importa la información específica del Auditorio León de Greiff
// Asegúrate de que esta ruta sea correcta en tu proyecto
import '../../data/building_details_specific/auditorio_leon_details_data.dart'; // ¡NUEVA IMPORTACIÓN!
import 'package:flutter_markdown/flutter_markdown.dart'; // Necesario para MarkdownBody

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
  bool _isTeamExpanded = false; // Nuevo estado para expandir/colapsar el equipo
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

    // Determina si el edificio actual es el Auditorio León de Greiff para mostrar info específica
    final bool isAuditorioLeon = widget.building.id == 'auditorio_leon_de_greiff';


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
                  MarkdownBody( // Usamos MarkdownBody para que el formato **negrita** funcione
                    data: widget.building.history!,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                      p: Theme.of(context).textTheme.bodyMedium, // Estilo para párrafos
                    ),
                    shrinkWrap: true,
                    //maxLines: _isHistoryExpanded ? null : 3, // MarkdownBody no soporta maxLines directamente para truncar
                    //overflow: _isHistoryExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  ),
                  // Se puede implementar un "leer más" si es necesario, pero MarkdownBody no lo hace automáticamente
                  // como un Text normal. Para un texto largo, mostrar todo o implementar una lógica de corte manual.
                  if (widget.building.history!.length > 300) // Mostrar "Leer más" si el texto es largo
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
        const SizedBox(height: 16),

        // NUEVA SECCIÓN: Equipo de Trabajo (solo para el Auditorio León de Greiff)
        if (isAuditorioLeon) // Mostrar solo si es el Auditorio León de Greiff
          InfoSection(
            title: 'Equipo de Trabajo',
            icon: Icons.people_alt, // Un icono apropiado para el equipo
            accentColor: widget.accentColor,
            content: GestureDetector(
              onTap: () {
                setState(() {
                  _isTeamExpanded = !_isTeamExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarkdownBody(
                    data: teamAuditorioLeon, // ¡Usamos la nueva constante!
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                      p: Theme.of(context).textTheme.bodyMedium,
                      listBullet: Theme.of(context).textTheme.bodyMedium, // Para listas
                    ),
                    shrinkWrap: true,
                  ),
                  if (teamAuditorioLeon.length > 300) // O ajusta la lógica de expansión según el contenido
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _isTeamExpanded ? 'Mostrar menos' : 'Leer más',
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
        // FIN NUEVA SECCIÓN
      ],
    );
  }
}