import 'package:flutter/material.dart';
import '../models/building.dart'; // Importamos el modelo Building
// Importa los nuevos widgets de detalles
import '../building_details/building_401_details.dart';
import '../building_details/building_453_details.dart';
// Tus utilidades

// Función que abre la hoja inferior, ahora contendrá BuildingInfoSheetContent
void showBuildingInfo(BuildContext context, Building building) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      // Usamos un widget Stateful para gestionar la vista y el PageView
      return BuildingInfoSheetContent(building: building);
    },
  );
}

// Nuevo StatefulWidget para la hoja inferior completa
class BuildingInfoSheetContent extends StatefulWidget {
  final Building building;
  const BuildingInfoSheetContent({super.key, required this.building});

  @override
  State<BuildingInfoSheetContent> createState() => _BuildingInfoSheetContentState();
}

class _BuildingInfoSheetContentState extends State<BuildingInfoSheetContent> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // Aquí integramos la información del encabezado del edificio
              _buildBuildingHeader(widget.building),
              const SizedBox(height: 24),

              // Contenido específico del edificio
              // Si no es ninguno de los edificios con detalles específicos,
              // no se mostrará ninguna sección de "información específica" en este punto.
              _getBuildingDetailsWidget(widget.building),
              const SizedBox(height: 20), // Espacio al final
            ],
          ),
        );
      },
    );
  }

  Widget _buildBuildingHeader(Building building) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding para el contenido
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            building.name == '401 - El Viejo'
                ? 'Edificio 401 - Julio Garavito'
                : building.name == '453 - GUILLERMINA URIBE BONE'
                ? 'GUILLERMINA URIBE BONE'
                : building.name, // Si no es 401 ni 453, simplemente muestra el nombre
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (building.name == '453 - GUILLERMINA URIBE BONE')
            Text(
              '453 - GUILLERMINA URIBE BONE ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: building.name == '401 - El Viejo'
                ? Image.asset(
              'assets/images/401.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : building.name == '453 - GUILLERMINA URIBE BONE'
                ? Image.asset(
              'assets/images/453.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : Container( // Si no es 401 ni 453, muestra un contenedor genérico
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Icon(
                    building.category == 'Cafeterías' // Usa la categoría del edificio
                        ? Icons.local_cafe
                        : Icons.location_on,
                    size: 60,
                    color: Colors.grey[500]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para obtener el widget de detalles correcto
  Widget _getBuildingDetailsWidget(Building building) {
    switch (building.name) {
      case '401 - El Viejo':
        return const Building401Details();
      case '453 - GUILLERMINA URIBE BONE':
        return const Building453Details();
      default:
      // Si no hay un widget de detalles específico, puedes devolver un SizedBox.shrink()
      // para que no se muestre nada, o un widget simple con un mensaje.
        return const SizedBox.shrink();
    // O podrías poner un mensaje como:
    /*
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('Información Adicional'),
              const SizedBox(height: 8),
              const Text(
                'No hay información detallada específica disponible para este edificio en este momento.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        );
        */
    }
  }
}