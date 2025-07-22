// lib/widgets/common_info_widgets.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Widget para secciones de información con título, icono y contenido
class InfoSection extends StatelessWidget {
  final String title;
  final Widget content;
  final IconData? icon;
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
    // InfoSection ya usaba accentColor para el título, lo cual está bien si accentColor es un color de tema.
    // Si quisieras que el título se adaptara al tema oscuro con onSurface, sería:
    // final theme = Theme.of(context);
    // style: theme.textTheme.titleMedium?.copyWith(
    //   fontWeight: FontWeight.bold,
    //   color: theme.colorScheme.onSurface, // O accentColor si quieres que sea consistente
    // ),
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
                color: accentColor, // Se mantiene accentColor, asumiendo que es un color de acento visible en ambos modos
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
  final String label;
  final String value;
  final Color color; // Este color se pasa para el icono, y antes se usaba para la etiqueta.
  final bool isLink;
  final double iconIndent;

  const InfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color, // `color` se usará para el icono
    this.isLink = false,
    this.iconIndent = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Obtén el tema actual para acceder a ColorScheme

    return Padding(
      padding: EdgeInsets.fromLTRB(iconIndent, 4.0, 0.0, 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color), // El icono usa el color que le pasas (accentColor)
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith( // CAMBIO AQUÍ: Usar theme.textTheme y onSurface
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface, // CAMBIO CRUCIAL: Usa onSurface para la etiqueta
                  ),
                ),
                isLink
                    ? GestureDetector(
                  onTap: () async {
                    // Si el enlace es un email, se usa mailto:. Si no, asume https://
                    final urlString = value.contains('@') ? 'mailto:$value' : (value.startsWith('http') ? value : 'https://$value');
                    final url = Uri.parse(urlString);
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
                    style: theme.textTheme.bodyMedium?.copyWith( // CAMBIO AQUÍ: Usar theme.textTheme y primary
                      color: theme.colorScheme.primary, // CAMBIO CRUCIAL: Usa el color primario del tema para enlaces
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
                    : Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith( // CAMBIO AQUÍ: Usar theme.textTheme y onSurface
                    color: theme.colorScheme.onSurface.withOpacity(0.8), // Texto normal, un poco más tenue
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}