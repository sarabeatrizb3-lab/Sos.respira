import 'package:flutter/material.dart';

class Mood {
  final String id;
  final String name;
  final Color color;
  final String emoji;
  final String description;

  Mood({
    required this.id,
    required this.name,
    required this.color,
    required this.emoji,
    required this.description,
  });

  static List<Mood> getMoods() {
    return [
      Mood(
        id: 'excellent',
        name: 'Ótimo',
        color: Colors.green,
        emoji: '😄',
        description: 'Você está se sentindo muito bem!',
      ),
      Mood(
        id: 'good',
        name: 'Bom',
        color: Colors.lightGreen,
        emoji: '🙂',
        description: 'Tudo indo bem!',
      ),
      Mood(
        id: 'neutral',
        name: 'Neutro',
        color: Colors.orange,
        emoji: '😐',
        description: 'Você está ok.',
      ),
      Mood(
        id: 'sad',
        name: 'Triste',
        color: Colors.orange,
        emoji: '😕',
        description: 'Você está um pouco triste.',
      ),
      Mood(
        id: 'terrible',
        name: 'Péssimo',
        color: Colors.red,
        emoji: '😢',
        description: 'Você está precisando de ajuda.',
      ),
    ];
  }
}