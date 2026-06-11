import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import '../widgets/mood_button.dart';
import '../theme/app_theme.dart';
import 'chat_screen.dart';
import 'breathing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showMoodSnackBar(BuildContext context, String mood) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Humor selecionado: $mood'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🚨 Emergência'),
        content: const Text(
          'Se você está em uma situação de emergência ou tendo pensamentos autodestrutivos, procure imediatamente ajuda:\n\n'
          '📞 CVV (Centro de Valorização da Vida): 188\n'
          '📞 Polícia: 190\n'
          '🏥 SAMU: 192\n\n'
          'Converse com um responsável, familiar ou procure o serviço local de emergência.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moods = Mood.getMoods();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Respira'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Welcome Section
              Text(
                'Como você está hoje?',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Sua saúde mental é importante',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Mood Selection
              Text(
                'Selecione seu humor:',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                ),
                itemCount: moods.length,
                itemBuilder: (context, index) {
                  return MoodButton(
                    mood: moods[index],
                    onPressed: () => _showMoodSnackBar(context, moods[index].name),
                  );
                },
              ),

              const SizedBox(height: 50),

              // Action Buttons
              Text(
                'O que você deseja fazer?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              // Breathing Exercise Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BreathingScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.air),
                  label: const Text('Exercício de Respiração'),
                ),
              ),
              const SizedBox(height: 12),

              // Chat Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: const Text('Conversar com IA'),
                ),
              ),
              const SizedBox(height: 12),

              // Emergency Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.errorColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () => _showEmergencyDialog(context),
                  icon: const Icon(Icons.warning),
                  label: const Text('Emergência'),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}