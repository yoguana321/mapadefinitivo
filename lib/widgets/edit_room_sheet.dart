import 'package:flutter/material.dart';
import '../models/room.dart';
import '../models/professor.dart'; // Asegúrate de importar el modelo Professor

// Este widget será un BottomSheet que permitirá editar la información de un Room.
class EditRoomSheet extends StatefulWidget {
  final Room room; // El Room que se va a editar
  final Color accentColor; // Para mantener la coherencia de estilo

  // Callback para devolver la Room modificada
  final Function(Room) onRoomUpdated;

  const EditRoomSheet({
    Key? key,
    required this.room,
    required this.accentColor,
    required this.onRoomUpdated,
  }) : super(key: key);

  @override
  State<EditRoomSheet> createState() => _EditRoomSheetState();
}

class _EditRoomSheetState extends State<EditRoomSheet> {
  // Controladores para los campos de texto
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _descriptionController;

  // NUEVOS CONTROLADORES para Room: contactInfo, capacity, equipment
  late TextEditingController _contactInfoController;
  late TextEditingController _capacityController;
  late TextEditingController _equipmentController;


  // Lista temporal para los profesores para poder añadir/quitar/editar
  late List<Professor> _professors;

  @override
  void initState() {
    super.initState();
    // Inicializar controladores con los valores actuales de la sala
    _nameController = TextEditingController(text: widget.room.name);
    _numberController = TextEditingController(text: widget.room.number);
    _descriptionController = TextEditingController(text: widget.room.description);

    // Inicializar los nuevos controladores
    _contactInfoController = TextEditingController(text: widget.room.contactInfo);
    _capacityController = TextEditingController(text: widget.room.capacity);
    _equipmentController = TextEditingController(text: widget.room.equipment);

    _professors = List.from(widget.room.professors ?? []); // Hacer una copia para poder modificarla
  }

  @override
  void dispose() {
    // Liberar los controladores cuando el widget ya no se use
    _nameController.dispose();
    _numberController.dispose();
    _descriptionController.dispose();

    // Disponer los nuevos controladores
    _contactInfoController.dispose();
    _capacityController.dispose();
    _equipmentController.dispose();

    super.dispose();
  }

  // Función para mostrar un diálogo de edición para un profesor
  Future<void> _editProfessor(Professor professor, int index) async {
    final TextEditingController professorNameController = TextEditingController(text: professor.name);
    final TextEditingController professorDepartmentController = TextEditingController(text: professor.department); // NEW
    final TextEditingController professorRoomController = TextEditingController(text: professor.roomNumber);
    final TextEditingController professorEmailController = TextEditingController(text: professor.email); // NEW
    final TextEditingController professorOfficeHoursController = TextEditingController(text: professor.officeHours); // NEW
    final TextEditingController professorRoleController = TextEditingController(text: professor.role); // NEW

    final updated = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Profesor'),
          content: SingleChildScrollView( // Added SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: professorNameController,
                  decoration: const InputDecoration(labelText: 'Nombre del Profesor'),
                ),
                TextField(
                  controller: professorDepartmentController,
                  decoration: const InputDecoration(labelText: 'Departamento'),
                ),
                TextField(
                  controller: professorRoomController,
                  decoration: const InputDecoration(labelText: 'Aula/Oficina Asignada (Opcional)'),
                ),
                TextField(
                  controller: professorEmailController,
                  decoration: const InputDecoration(labelText: 'Email (Opcional)'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: professorOfficeHoursController,
                  decoration: const InputDecoration(labelText: 'Horas de Oficina (Opcional)'),
                ),
                TextField(
                  controller: professorRoleController,
                  decoration: const InputDecoration(labelText: 'Rol (Opcional)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancelar
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // Guardar
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );

    if (updated == true) {
      setState(() {
        _professors[index] = Professor(
          id: professor.id,
          name: professorNameController.text,
          department: professorDepartmentController.text, // REQUIRED
          roomNumber: professorRoomController.text.isNotEmpty ? professorRoomController.text : null,
          email: professorEmailController.text.isNotEmpty ? professorEmailController.text : null,
          officeHours: professorOfficeHoursController.text.isNotEmpty ? professorOfficeHoursController.text : null,
          role: professorRoleController.text.isNotEmpty ? professorRoleController.text : null,
        );
      });
    }
  }

  // Función para añadir un nuevo profesor
  Future<void> _addProfessor() async {
    final TextEditingController newProfessorNameController = TextEditingController();
    final TextEditingController newProfessorDepartmentController = TextEditingController(); // NEW
    final TextEditingController newProfessorRoomController = TextEditingController();
    final TextEditingController newProfessorEmailController = TextEditingController(); // NEW
    final TextEditingController newProfessorOfficeHoursController = TextEditingController(); // NEW
    final TextEditingController newProfessorRoleController = TextEditingController(); // NEW

    final added = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Añadir Nuevo Profesor'),
          content: SingleChildScrollView( // Added SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newProfessorNameController,
                  decoration: const InputDecoration(labelText: 'Nombre del Profesor'),
                ),
                TextField(
                  controller: newProfessorDepartmentController,
                  decoration: const InputDecoration(labelText: 'Departamento'),
                ),
                TextField(
                  controller: newProfessorRoomController,
                  decoration: const InputDecoration(labelText: 'Aula/Oficina Asignada (Opcional)'),
                ),
                TextField(
                  controller: newProfessorEmailController,
                  decoration: const InputDecoration(labelText: 'Email (Opcional)'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: newProfessorOfficeHoursController,
                  decoration: const InputDecoration(labelText: 'Horas de Oficina (Opcional)'),
                ),
                TextField(
                  controller: newProfessorRoleController,
                  decoration: const InputDecoration(labelText: 'Rol (Opcional)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Añadir'),
            ),
          ],
        );
      },
    );

    if (added == true && newProfessorNameController.text.isNotEmpty) {
      setState(() {
        _professors.add(Professor(
          id: UniqueKey().toString(),
          name: newProfessorNameController.text,
          department: newProfessorDepartmentController.text, // REQUIRED
          roomNumber: newProfessorRoomController.text.isNotEmpty ? newProfessorRoomController.text : null,
          email: newProfessorEmailController.text.isNotEmpty ? newProfessorEmailController.text : null,
          officeHours: newProfessorOfficeHoursController.text.isNotEmpty ? newProfessorOfficeHoursController.text : null,
          role: newProfessorRoleController.text.isNotEmpty ? newProfessorRoleController.text : null,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                height: 16,
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Editar ${widget.room.number} - ${widget.room.name ?? ''}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Salón (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        labelText: 'Número del Salón',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Descripción (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _contactInfoController,
                      decoration: const InputDecoration(
                        labelText: 'Información de Contacto (Salón) (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone, // O email, dependiendo del uso principal
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _capacityController,
                      decoration: const InputDecoration(
                        labelText: 'Capacidad (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _equipmentController,
                      decoration: const InputDecoration(
                        labelText: 'Equipamiento (Opcional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                      keyboardType: TextInputType.multiline,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profesores Asignados',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle, color: widget.accentColor),
                          onPressed: _addProfessor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (_professors.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'No hay profesores asignados. Usa el botón "+" para añadir.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ),
                    ..._professors.asMap().entries.map((entry) {
                      int idx = entry.key;
                      Professor professor = entry.value;
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0.5,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          leading: CircleAvatar(
                            backgroundColor: widget.accentColor.withAlpha((255 * 0.7).round()),
                            child: Text(professor.name.isNotEmpty ? professor.name[0].toUpperCase() : '?', style: const TextStyle(color: Colors.white)),
                          ),
                          title: Text(professor.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                          // Mostrar departamento y aula/oficina
                          subtitle: Text(
                            '${professor.department}${professor.roomNumber != null && professor.roomNumber!.isNotEmpty ? ' - Aula: ${professor.roomNumber}' : ''}',
                            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20),
                                onPressed: () => _editProfessor(professor, idx),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _professors.removeAt(idx);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Crear una nueva instancia de Room con los datos modificados
                        final updatedRoom = widget.room.copyWith(
                          name: _nameController.text.isNotEmpty ? _nameController.text : null,
                          number: _numberController.text,
                          description: _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
                          professors: _professors,
                          contactInfo: _contactInfoController.text.isNotEmpty ? _contactInfoController.text : null,
                          capacity: _capacityController.text.isNotEmpty ? _capacityController.text : null,
                          equipment: _equipmentController.text.isNotEmpty ? _equipmentController.text : null,
                          // Asegúrate de copiar otras propiedades que no se editan aquí
                          isServiceRoom: widget.room.isServiceRoom,
                          floor: widget.room.floor,
                          // No actualizamos directamente buildingId aquí, asumiendo que la sala sigue en el mismo edificio
                        );
                        // Llamar al callback para pasar la Room actualizada
                        widget.onRoomUpdated(updatedRoom);
                        Navigator.pop(context); // Cerrar el BottomSheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.accentColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Guardar Cambios',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}