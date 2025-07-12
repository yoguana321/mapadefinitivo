// lib/widgets/edit_room_sheet.dart
import 'package:flutter/material.dart';
import '../models/room.dart';
import '../models/professor.dart'; // Asegúrate de importar Professor

class EditRoomSheet extends StatefulWidget {
  final Room room; // Cambiado de 'initialRoom' a 'room'
  final Color accentColor;
  final ValueChanged<Room> onRoomUpdated; // Cambiado de 'onRoomSaved' a 'onRoomUpdated'

  const EditRoomSheet({
    Key? key,
    required this.room,
    required this.accentColor,
    required this.onRoomUpdated, // Usar onRoomUpdated
  }) : super(key: key);

  @override
  State<EditRoomSheet> createState() => _EditRoomSheetState();
}

class _EditRoomSheetState extends State<EditRoomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _numberController;
  late TextEditingController _floorController;
  late TextEditingController _descriptionController;
  late TextEditingController _capacityController;
  late TextEditingController _equipmentController;
  late TextEditingController _contactController;
  late TextEditingController _scheduleController; // Para manejar el horario como un string
  late bool _isServiceRoom;
  late bool _isAccessible;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.room.name);
    _numberController = TextEditingController(text: widget.room.number);
    _floorController = TextEditingController(text: widget.room.floor);
    _descriptionController = TextEditingController(text: widget.room.description);
    _capacityController = TextEditingController(text: widget.room.capacity?.toString());
    _equipmentController = TextEditingController(text: widget.room.equipment?.join(', '));
    _contactController = TextEditingController(text: widget.room.contact);
    // Para el horario, podrías mostrar un resumen o "Editar"
    _scheduleController = TextEditingController(text: _formatScheduleMap(widget.room.scheduleMap));
    _isServiceRoom = widget.room.isServiceRoom ?? false;
    _isAccessible = widget.room.isAccessible ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _floorController.dispose();
    _descriptionController.dispose();
    _capacityController.dispose();
    _equipmentController.dispose();
    _contactController.dispose();
    _scheduleController.dispose();
    super.dispose();
  }

  // Helper para mostrar el horario de forma legible (simple)
  String _formatScheduleMap(Map<String, String>? scheduleMap) {
    if (scheduleMap == null || scheduleMap.isEmpty) return 'No definido';
    // Ejemplo: "Lunes-Viernes: 08:00-17:00"
    return scheduleMap.entries.map((e) => '${e.key}: ${e.value}').join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            children: [
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Editar Sala',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre de la Sala (opcional)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _numberController,
                          decoration: InputDecoration(
                            labelText: 'Número de Sala',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el número de sala.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _floorController,
                          decoration: InputDecoration(
                            labelText: 'Piso',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, ingrese el piso.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Descripción (opcional)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _capacityController,
                          decoration: InputDecoration(
                            labelText: 'Capacidad (opcional)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _equipmentController,
                          decoration: InputDecoration(
                            labelText: 'Equipamiento (separado por comas, opcional)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _contactController,
                          decoration: InputDecoration(
                            labelText: 'Contacto (opcional)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Horario: Podrías hacer un selector de horario más complejo aquí.
                        // Por ahora, solo es de lectura simple o un campo de texto para edición manual.
                        TextFormField(
                          controller: _scheduleController,
                          decoration: InputDecoration(
                            labelText: 'Horario (ej. Lunes: 08:00-17:00, Sábado: Cerrado)',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        SwitchListTile(
                          title: const Text('Es Sala de Servicio'),
                          value: _isServiceRoom,
                          onChanged: (bool value) {
                            setState(() {
                              _isServiceRoom = value;
                            });
                          },
                          activeColor: widget.accentColor,
                        ),
                        SwitchListTile(
                          title: const Text('Es Accesible'),
                          value: _isAccessible,
                          onChanged: (bool value) {
                            setState(() {
                              _isAccessible = value;
                            });
                          },
                          activeColor: widget.accentColor,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Crear el mapa de horario desde el string (simplificado)
                              final Map<String, String>? updatedScheduleMap = _scheduleController.text.isNotEmpty
                                  ? Map.fromEntries(_scheduleController.text.split(',').map((s) {
                                final parts = s.split(':');
                                if (parts.length == 2) {
                                  return MapEntry(parts[0].trim(), parts[1].trim());
                                }
                                return null;
                              }).whereType<MapEntry<String, String>>())
                                  : null;

                              final updatedRoom = widget.room.copyWith(
                                name: _nameController.text.isEmpty ? null : _nameController.text,
                                number: _numberController.text,
                                floor: _floorController.text,
                                description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
                                capacity: int.tryParse(_capacityController.text),
                                equipment: _equipmentController.text.isEmpty
                                    ? null
                                    : _equipmentController.text.split(',').map((e) => e.trim()).toList(),
                                contact: _contactController.text.isEmpty ? null : _contactController.text,
                                isServiceRoom: _isServiceRoom,
                                isAccessible: _isAccessible,
                                scheduleMap: updatedScheduleMap,
                                // Profesores no se editan desde aquí en este ejemplo, se mantienen los originales
                                professors: widget.room.professors,
                              );
                              widget.onRoomUpdated(updatedRoom); // Llama al callback con la sala actualizada
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.accentColor,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Guardar Cambios',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}