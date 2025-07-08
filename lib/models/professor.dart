// lib/models/professor.dart
class Professor {
  final String id;
  final String name;
  final String department;
  final String? email; // Opcional
  final String? officeHours; // Opcional
  final String? roomNumber; // Opcional, para indicar su aula principal
  final String? role; // Añadido el campo role en el constructor

  Professor({
    required this.id,
    required this.name,
    required this.department,
    this.email,
    this.officeHours,
    this.roomNumber,
    this.role, // Añadido al constructor
  });

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      id: map['id'] as String,
      name: map['name'] as String,
      department: map['department'] as String,
      email: map['email'] as String?,
      officeHours: map['officeHours'] as String?,
      roomNumber: map['roomNumber'] as String?,
      role: map['role'] as String?, // Asegúrate de leer el rol aquí también
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'department': department,
      'email': email,
      'officeHours': officeHours,
      'roomNumber': roomNumber,
      'role': role, // Añadido al toMap
    };
  }

  // --- Método copyWith para Professor ---
  Professor copyWith({
    String? id,
    String? name,
    String? department,
    String? email,
    String? officeHours,
    String? roomNumber,
    String? role,
  }) {
    return Professor(
      id: id ?? this.id,
      name: name ?? this.name,
      department: department ?? this.department,
      email: email ?? this.email,
      officeHours: officeHours ?? this.officeHours,
      roomNumber: roomNumber ?? this.roomNumber,
      role: role ?? this.role,
    );
  }
}