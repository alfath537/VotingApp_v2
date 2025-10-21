import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final achievements = [
      {
        'icon': '🥇',
        'title': 'First Vote',
        'subtitle': 'You voted in your first poll',
        'achieved': true,
        'progress': 1.0,
      },
      {
        'icon': '⭐',
        'title': 'Top Voter',
        'subtitle': 'Voted in 100 polls',
        'achieved': false,
        'progress': 0.3,
      },
      {
        'icon': '🎯',
        'title': 'Inviter',
        'subtitle': 'Invited 10 friends',
        'achieved': true,
        'progress': 1.0,
      },
      {
        'icon': '🔥',
        'title': 'Popular Vote',
        'subtitle': 'Your poll got 500 votes',
        'achieved': false,
        'progress': 0.5,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final item = achievements[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: item['achieved'] as bool
                    ? Colors.amber
                    : Colors.grey[300],
                child: Text(
                  item['icon'] as String,
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['subtitle'] as String,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: item['progress'] as double,
                    backgroundColor: Colors.grey[300],
                    color: item['achieved'] as bool
                        ? Colors.green
                        : Colors.blueAccent,
                  ),
                ],
              ),
              trailing: Icon(
                item['achieved'] as bool ? Icons.check_circle : Icons.lock,
                color: item['achieved'] as bool ? Colors.green : Colors.grey,
                size: 28,
              ),
            ),
          );
        },
      ),
    );
  }
}
