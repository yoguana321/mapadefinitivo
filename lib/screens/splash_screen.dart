import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _buttonSlideAnimation;
  late Animation<double> _textOpacityAnimation;
  late Animation<double> _backgroundPulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duración total de la secuencia de animaciones
      vsync: this,
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
      ),
    );

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );

    _backgroundPulseAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOutSine),
      ),
    );

    _controller.forward();

    // REMOVEMOS LA NAVEGACIÓN AUTOMÁTICA AQUÍ
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/map');
    // });

    // Hacemos que la animación del fondo se repita para un efecto continuo
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true, period: const Duration(seconds: 3)); // Pulso continuo
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              // **NUEVOS TONOS DE VERDE MÁS CLAROS Y AGRADABLES**
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4CAF50), // Un verde más vibrante y claro (Material Green 500)
                  Color(0xFF8BC34A), // Un verde-lima suave (Material Light Green 500)
                  // Puedes experimentar con estos:
                  // Color(0xFF66BB6A), // Otro verde claro (Material Green 400)
                  // Color(0xFFC8E6C9), // Un verde muy pálido para un toque suave
                ],
              ),
              // Opcional: imagen de fondo sutil (descomentar si tienes la imagen)
              // image: const DecorationImage(
              //   image: AssetImage('assets/images/campus_background.png'),
              //   fit: BoxFit.cover,
              //   opacity: 0.1, // Muy sutil para que no compita
              //   filterQuality: FilterQuality.low,
              // ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Transform.scale(
                    scale: _backgroundPulseAnimation.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.08), // Círculo translúcido más visible
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.03),
                            blurRadius: 60, // Mayor desenfoque
                            spreadRadius: 25, // Mayor extensión
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _logoOpacityAnimation,
                        child: ScaleTransition(
                          scale: _logoScaleAnimation,
                          child: Image.asset(
                            'assets/images/logo.png', // Asegúrate de que este logo se vea bien sobre fondos claros
                            width: 250,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      SlideTransition(
                        position: _buttonSlideAnimation,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Botón blanco
                            foregroundColor: const Color(0xFF2E7D32), // Un verde oscuro para el texto (Material Green 800)
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 10,
                            shadowColor: Colors.black.withOpacity(0.4),
                          ),
                          onPressed: () {
                            // Ahora el botón es el único que navega
                            _controller.stop(); // Detiene la animación si se presiona antes
                            Navigator.pushReplacementNamed(context, '/map');
                          },
                          icon: const Icon(Icons.travel_explore, size: 24),
                          label: const Text(
                            "Explorar Campus",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      FadeTransition(
                        opacity: _textOpacityAnimation,
                        child: const Text(
                          "Tu U en un sólo lugar",
                          style: TextStyle(
                            color: Colors.white, // Texto blanco para un buen contraste
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
