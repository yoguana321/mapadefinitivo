// lib/models/professor.dart
class Professor {
  final String id;
  final String name;
  final String department;
  final String? email; // Opcional
  final String? officeHours; // Opcional
  final String? roomNumber; // Opcional, para indicar su aula principal

  Professor({
    required this.id,
    required this.name,
    required this.department,
    this.email,
    this.officeHours,
    this.roomNumber,
  });

  factory Professor.fromMap(Map<String, dynamic> map) {
    return Professor(
      id: map['id'] as String,
      name: map['name'] as String,
      department: map['department'] as String,
      email: map['email'] as String?,
      officeHours: map['officeHours'] as String?,
      roomNumber: map['roomNumber'] as String?,
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
    };
  }
}