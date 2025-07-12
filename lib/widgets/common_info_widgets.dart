// lib/widgets/common_info_widgets.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para _buildInfoRow con enlaces

// Widget para secciones de información con título, icono y contenido
class InfoSection extends StatelessWidget {
  final String title;
  final Widget content; // Cambiado a Widget para mayor flexibilidad
  final IconData? icon; // Icono opcional
  final Color accentColor;

  const InfoSection({
    Key? key,
    required this.title,
    required this.content,
    this.icon,
    required this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: accentColor, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}

// Widget para filas individuales de información (icono, etiqueta, valor)
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label; // Etiqueta, e.g., 'Contacto'
  final String value; // Valor, e.g., '310-123-4567'
  final Color color; // Color del icono y etiqueta
  final bool isLink; // Si el valor es un enlace clickeable

  const InfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.isLink = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color), // Usamos 'color' para el icono
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color, // Usa color para la etiqueta
                  ),
                ),
                isLink
                    ? GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(value.startsWith('http') ? value : 'https://$value');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No se pudo abrir el enlace: $value')),
                      );
                    }
                  },
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blue, // Enlaces azules
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
                    : Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}