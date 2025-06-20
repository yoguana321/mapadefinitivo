import 'package:flutter/material.dart';
import '../utils/ui_helpers.dart'; // Tus utilidades

// Este widget ahora contendrá un TabBar y TabBarView para los pisos
class Building401Details extends StatelessWidget {
  const Building401Details({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos DefaultTabController para gestionar las pestañas de los pisos
    return DefaultTabController(
      length: 4, // "General" + Piso 1 + Piso 2 + Piso 3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: buildSectionTitle('Historia del edificio'),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'El Edificio 401 de Ingeniería de la Universidad Nacional de Colombia, también conocido como el Edificio Julio Garavito Armero, fue construido en 1945 por el arquitecto Leopoldo Rother. Su diseño se integró en el plan urbanístico de la ciudad universitaria, concebido por Karl Brunner en 1932. En 1995 fue declarado Bien de Interés Cultural.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 20),

          // Pestañas de navegación para los pisos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding para las pestañas
            child: TabBar(
              isScrollable: true, // Para que las pestañas puedan desplazarse si hay muchas
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey[600],
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: 'General'),
                Tab(text: 'Piso 1'),
                Tab(text: 'Piso 2'),
                Tab(text: 'Piso 3'),
              ],
            ),
          ),
          const Divider(height: 0), // Separador visual para las pestañas
          // Contenido de cada pestaña (los detalles de cada piso)
          SizedBox(
            // Altura fija para el TabBarView. Puedes ajustarla o usar Expanded dentro de una Column flexible.
            // Una altura fija es más fácil para empezar.
            height: MediaQuery.of(context).size.height * 0.5, // Ajusta esta altura según sea necesario
            child: TabBarView(
              children: [
                // Contenido General del Edificio 401 (lo que no encaja en un piso específico)
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Información Adicional'),
                      const SizedBox(height: 8),
                      buildListTile(Icons.wifi, 'Acceso a Wi-Fi', 'Disponible en todo el edificio.'),
                      buildListTile(Icons.local_parking, 'Parqueadero', 'Parqueadero limitado para bicicletas y motos.'),
                      buildListTile(Icons.medical_services, 'Primeros Auxilios', 'Punto de atención en la decanatura.'),
                    ],
                  ),
                ),
                // Contenido del Piso 1
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Primer Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.meeting_room, 'Auditorios', 'Varios auditorios para clases magistrales y eventos.'),
                      buildListTile(Icons.local_cafe, 'Cafetería Minka', 'Horario: L-V 7 AM - 7 PM. Ofrece comidas, snacks y bebidas.'),
                      buildListTile(Icons.library_books, 'Puntos de Préstamo de Libros', 'Servicio de préstamo rápido para materiales de estudio.'),
                      buildListTile(Icons.water_drop, 'Dispensadores de Agua', 'Puntos de hidratación disponibles.'),
                      buildListTile(Icons.charging_station, 'Puntos de Carga', 'Zonas con tomas eléctricas para dispositivos móviles.'),
                    ],
                  ),
                ),
                // Contenido del Piso 2
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Segundo Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.business_center, 'Decanatura de Ingeniería', 'Oficinas administrativas de la facultad.'),
                      buildListTile(Icons.lightbulb_outline, 'Vicedecanatura de Investigación y Extensión', 'Soporte para proyectos de investigación y convenios.'),
                      buildListTile(Icons.school, 'Vicedecanatura Académica', 'Asesoría académica y gestión de currículo.'),
                      buildListTile(Icons.wc, 'Baños', 'Baños para hombres y mujeres disponibles.'),
                    ],
                  ),
                ),
                // Contenido del Piso 3
                SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle('Tercer Piso'),
                      const SizedBox(height: 12),
                      buildListTile(Icons.print, 'Centro de Impresión y Copiado', 'Servicios de impresión, fotocopiado y escaneo.'),
                      buildListTile(Icons.desktop_windows, 'Salones de Estudio (B y @/A)', 'Espacios equipados con computadores para uso estudiantil.'),
                      buildListTile(Icons.self_improvement, 'Sala Oasis', 'Espacio de bienestar y relajación para estudiantes.'),
                      buildListTile(Icons.group, 'Oficina ProFi', 'Soporte académico y tutorías para estudiantes.'),
                      buildListTile(Icons.science, 'Aulas Técnicas', 'Salones especializados para prácticas y laboratorios.'),
                    ],
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