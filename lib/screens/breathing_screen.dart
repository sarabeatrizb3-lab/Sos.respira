import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isBreathing = false;
  int _breathCount = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _startBreathing() {
    setState(() {
      _isBreathing = true;
      _breathCount = 0;
    });
    _breathingCycle();
  }

  void _breathingCycle() {
    if (!_isBreathing) return;

    _animationController.forward().then((_) {
      if (_isBreathing) {
        setState(() => _breathCount++);
        _animationController.reverse().then((_) {
          if (_isBreathing && _breathCount < 5) {
            Future.delayed(const Duration(seconds: 1), _breathingCycle);
          } else if (_breathCount >= 5) {
            setState(() => _isBreathing = false);
          }
        });
      }
    });
  }

  void _stopBreathing() {
    setState(() => _isBreathing = false);
    _animationController.stop();
    _animationController.reset();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício de Respiração'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'Técnica de Respiração 4-7-8',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '1. Inspire por 4 segundos\n'
                '2. Segure por 7 segundos\n'
                '3. Expire por 8 segundos\n\n'
                'Repita 5 vezes para aliviar a ansiedade.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 60),

            // Animated Circle
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColor.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _isBreathing ? _breathCount.toString() : '0',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Status Text
            Text(
              _isBreathing
                  ? 'Respirando... (${_breathCount}/5)'
                  : 'Pronto para começar?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isBreathing)
                  ElevatedButton.icon(
                    onPressed: _startBreathing,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Começar'),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: _stopBreathing,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.stop),
                    label: const Text('Parar'),
                  ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}