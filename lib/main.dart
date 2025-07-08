import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/map_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // Mantén esta importación

void main() async { // <--- **PASO 1: HAZ main() ASYNC**
  WidgetsFlutterBinding.ensureInitialized(); // <--- **PASO 2: AÑADE ESTA LÍNEA**

  // <--- **PASO 3: AÑADE ESTA LÍNEA PARA INICIALIZAR INTL**
  // 'es' para español. Si necesitas otros idiomas, puedes añadir más llamadas
  // o configurarlo para que sea dinámico según el locale del dispositivo.
  await initializeDateFormatting('es', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi UNAL',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/map': (context) => const MapScreen(),
      },
    );
  }
}