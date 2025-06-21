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

  final Color greenMain = const Color(0xFF92B23B); // Verde que mantenemos

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5, curve: Curves.easeOut)),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.7, curve: Curves.elasticOut)),
    );

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset(0, -0.2),
    ).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0, curve: Curves.easeOutBack)),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.7, 1.0, curve: Curves.easeIn)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Animación por letra individual (igual)
  Widget _buildAnimatedText() {
    const String text = "Tu U en un sólo lugar";
    final List<Widget> letters = [];

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      final letterAnimation = Tween<Offset>(
        begin: const Offset(0, 0),
        end: const Offset(0, -0.15),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.7 + (i * 0.0035), 1.0, curve: Curves.easeInOutSine),
        ),
      );

      letters.add(
        SlideTransition(
          position: letterAnimation,
          child: Text(
            char,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
            ),
          ),
        ),
      );
    }

    return FadeTransition(
      opacity: _textOpacityAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: letters,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Fondo dividido:
          Column(
          children: [
          Container(
          height: size.height * 1,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,  // Ahora empieza desde arriba
                end: Alignment.bottomCenter, // Hacia abajo
                colors: [
                  Colors.white,  // Blanco arriba
                  greenMain,     // Verde abajo
                ],
              ),
            ),
          ),
          ],
          ),
              // Elementos animados:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _logoOpacityAnimation,
                      child: ScaleTransition(
                        scale: _logoScaleAnimation,
                        child: Image.asset(
                          'assets/images/UNAL2.png',
                          width: 250,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SlideTransition(
                      position: _buttonSlideAnimation,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF2E7D32),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 10,
                          shadowColor: Colors.black.withOpacity(0.4),
                        ),
                        onPressed: () {
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
                    _buildAnimatedText(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


