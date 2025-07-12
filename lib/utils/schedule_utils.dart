// lib/utils/schedule_utils.dart
import 'package:flutter/material.dart'; // Para Color, Icons
import 'dart:async'; // Para Timer si lo necesitas en el futuro para actualizar horarios
import 'package:intl/intl.dart'; // Necesario para DateFormat

// --- ENUMS Y CLASES PARA EL ESTADO DEL HORARIO ---
// Estas son las definiciones que usaremos globalmente.
enum OpeningStatus { open, closed, closingSoon }

class OpeningInfo {
  final OpeningStatus status;
  final String message;
  final Color color;
  final String? closingTime; // Agregamos este campo para la hora de cierre si está abierto

  OpeningInfo(this.status, this.message, this.color, {this.closingTime});
}
// --- FIN DE LA SECCIÓN DE ENUMS Y CLASES ---


// --- FUNCIÓN PARA PARSEAR LA HORA DE STRING A MINUTOS ---
int parseTime(String timeStr) {
  if (timeStr.isEmpty) return -1; // Indicar hora no válida
  try {
    final parts = timeStr.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return hour * 60 + minute;
  } catch (e) {
    print('Error parsing time string "$timeStr": $e');
    return -1;
  }
}

// --- FUNCIÓN PARA OBTENER EL NOMBRE DEL DÍA EN ESPAÑOL ---
// Usaremos intl para esto para consistencia y robustez
String getDayName(int weekday) {
  // DateTime.now().weekday devuelve 1 para Lunes, 7 para Domingo
  // DateFormat.EEEE().format(now) da el nombre completo del día en el locale por defecto
  // Si necesitas un control más fino del locale, podrías usar:
  // DateFormat('EEEE', 'es').format(DateTime.now());
  final now = DateTime.now();
  final dayName = DateFormat('EEEE', 'es').format(DateTime(now.year, now.month, now.day).add(Duration(days: weekday - now.weekday)));
  // La implementación original de getDayName es más simple para lo que hace,
  // pero para evitar una dependencia directa en `now` y ser más flexible
  // podríamos usar la siguiente lógica más explícita basada en el entero `weekday`:
  switch (weekday) {
    case DateTime.monday: return 'Lunes';
    case DateTime.tuesday: return 'Martes';
    case DateTime.wednesday: return 'Miércoles';
    case DateTime.thursday: return 'Jueves';
    case DateTime.friday: return 'Viernes';
    case DateTime.saturday: return 'Sábado';
    case DateTime.sunday: return 'Domingo';
    default: return ''; // Esto no debería ocurrir
  }
}


// --- FUNCIÓN PARA FORMATEAR MINUTOS RESTANTES EN UN TEXTO AMIGABLE ---
String formatMinutes(int totalMinutes) {
  if (totalMinutes <= 0) return 'Ahora';
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  if (hours > 0) {
    return '${hours}h ${minutes}m';
  }
  return '${minutes}m';
}

// --- FUNCIÓN PRINCIPAL PARA DETERMINAR EL ESTADO DE APERTURA ---
OpeningInfo getOpeningStatus(Map<String, String>? hoursMap) {
  final now = DateTime.now();
  final currentDayOfWeek = getDayName(now.weekday); // Obtiene el nombre del día actual en español
  final currentMinutes = now.hour * 60 + now.minute;

  if (hoursMap == null || hoursMap.isEmpty) {
    return OpeningInfo(OpeningStatus.closed, 'Horario no disponible', Colors.grey);
  }

  String? todayHoursString = hoursMap[currentDayOfWeek];

  // --- ELIMINADO: LÓGICA DE DETECCIÓN DE FERIADO ---
  // Se elimina la siguiente sección ya que se nos ha pedido no considerar los feriados.
  /*
  if (hoursMap.containsKey('Feriado') && hoursMap['Feriado']!.toLowerCase().contains('cerrado')) {
    return OpeningInfo(OpeningStatus.closed, 'Cerrado por feriado', Colors.red);
  }
  */
  // --- FIN DE LA ELIMINACIÓN ---


  if (todayHoursString == null || todayHoursString.toLowerCase().contains('cerrado')) {
    // Si hoy está explícitamente cerrado, o no hay horas definidas para hoy
    // Buscar el siguiente día de apertura
    String nextOpeningMessage = 'Cerrado';
    int daysToAdd = 1;
    for (int i = 0; i < 7; i++) {
      final nextDay = now.add(Duration(days: daysToAdd));
      final nextDayName = getDayName(nextDay.weekday); // Obtiene el nombre del siguiente día en español
      final nextDayHoursString = hoursMap[nextDayName];

      if (nextDayHoursString != null &&
          !nextDayHoursString.toLowerCase().contains('cerrado') &&
          !nextDayHoursString.toLowerCase().contains('24 horas')) {
        final nextDayOpenTimeParts = nextDayHoursString.split(' - ');
        if (nextDayOpenTimeParts.length == 2) {
          final nextOpenTime = nextDayOpenTimeParts[0];
          if (daysToAdd == 1) {
            nextOpeningMessage = 'Abre mañana a las $nextOpenTime';
          } else {
            nextOpeningMessage = 'Abre el $nextDayName a las $nextOpenTime';
          }
          break;
        }
      }
      daysToAdd++;
    }
    return OpeningInfo(OpeningStatus.closed, nextOpeningMessage, Colors.red);
  }

  if (todayHoursString.toLowerCase().contains('24 horas')) {
    return OpeningInfo(OpeningStatus.open, 'Abierto ahora', Colors.green, closingTime: '24 horas');
  }

  final parts = todayHoursString.split(' - ');
  if (parts.length != 2) {
    return OpeningInfo(OpeningStatus.closed, 'Horario inválido', Colors.grey);
  }

  final openMinutes = parseTime(parts[0]);
  final closeMinutes = parseTime(parts[1]);
  if (openMinutes == -1 || closeMinutes == -1) {
    return OpeningInfo(OpeningStatus.closed, 'Error al parsear horario', Colors.grey);
  }

  // Manejar horarios que cierran al día siguiente (ej., 22:00 - 06:00)
  // Si la hora de cierre es anterior a la de apertura, significa que cierra al día siguiente.
  bool closesNextDay = closeMinutes < openMinutes;

  if (currentMinutes >= openMinutes && currentMinutes < closeMinutes ||
      (closesNextDay && (currentMinutes >= openMinutes || currentMinutes < closeMinutes))) {
    // Está abierto actualmente
    int effectiveCloseMinutes = closeMinutes;
    if (closesNextDay && currentMinutes >= openMinutes) {
      // Si está abierto actualmente y la hora de cierre es al día siguiente,
      // el cálculo de los minutos restantes debe considerar el final del día + el cierre del día siguiente.
      effectiveCloseMinutes = closeMinutes + 24 * 60; // Añadir 24 horas en minutos
    }

    final minutesUntilClose = effectiveCloseMinutes - currentMinutes;
    const int closingSoonThresholdMinutes = 60; // 60 minutos (1 hora)

    if (minutesUntilClose <= closingSoonThresholdMinutes) {
      return OpeningInfo(OpeningStatus.closingSoon, 'Cierra pronto en ${formatMinutes(minutesUntilClose)}', Colors.orange, closingTime: parts[1]);
    } else {
      return OpeningInfo(OpeningStatus.open, 'Abierto ahora', Colors.green, closingTime: parts[1]);
    }
  } else {
    // Está cerrado
    String nextOpeningMessage = 'Cerrado';
    // Si la hora actual es posterior a la hora de cierre de hoy, buscar la apertura del día siguiente
    if (currentMinutes >= closeMinutes && !closesNextDay || (closesNextDay && currentMinutes >= closeMinutes)) {
      int daysToAdd = 1;
      for (int i = 0; i < 7; i++) {
        final nextDay = now.add(Duration(days: daysToAdd));
        final nextDayName = getDayName(nextDay.weekday); // Obtiene el nombre del siguiente día en español
        final nextDayHoursString = hoursMap[nextDayName]; // Usar hoursMap directamente

        if (nextDayHoursString != null &&
            !nextDayHoursString.toLowerCase().contains('cerrado') &&
            !nextDayHoursString.toLowerCase().contains('24 horas')) {
          final nextDayOpenTimeParts = nextDayHoursString.split(' - ');
          if (nextDayOpenTimeParts.length == 2) {
            final nextOpenTime = nextDayOpenTimeParts[0];
            if (daysToAdd == 1) {
              nextOpeningMessage = 'Abre mañana a las $nextOpenTime';
            } else {
              nextOpeningMessage = 'Abre el $nextDayName a las $nextOpenTime';
            }
            break;
          }
        }
        daysToAdd++;
      }
    } else { // Si está actualmente antes de la hora de apertura de hoy
      nextOpeningMessage = 'Abre hoy a las ${parts[0]}';
    }
    return OpeningInfo(OpeningStatus.closed, nextOpeningMessage, Colors.red);
  }
}

// --- FUNCIÓN PARA MOSTRAR EL DIÁLOGO DE HORARIO COMPLETO ---
void showFullScheduleDialog(BuildContext context, Map<String, String> hoursMap, Color accentColor) {
  final List<String> orderedDays = [
    'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo',
    // ELIMINADO: 'Feriado' ya no se considera en la visualización del horario completo
  ];
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Horario Completo'),
        contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: orderedDays.map((day) {
              final daySchedule = hoursMap[day] ?? 'No disponible';
              // Para determinar si es hoy, necesitamos el nombre del día actual.
              // Usamos DateFormat para asegurar que el nombre del día es consistente con cómo se obtiene en getOpeningStatus.
              final currentDayName = DateFormat('EEEE', 'es').format(DateTime.now());
              final isToday = currentDayName == day;


              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        color: isToday ? accentColor : null,
                      ),
                    ),
                    Text(
                      daySchedule,
                      style: TextStyle(
                        fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                        color: isToday ? accentColor : null,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}